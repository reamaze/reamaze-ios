//
//  ReamazeViewController.m
//  ReamazeSDK
//
//  Copyright (c) 2014 Reamaze. All rights reserved.
//

#import "ReamazeViewController.h"

#if DEBUG
@interface NSURLRequest (DummyInterface)
+ (BOOL)allowsAnyHTTPSCertificateForHost:(NSString*)host;
+ (void)setAllowsAnyHTTPSCertificate:(BOOL)allow forHost:(NSString*)host;
@end
#endif

@interface ReamazeViewController () <UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation ReamazeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _brand = @"reamaze";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // right button
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc]
                                   initWithTitle:@"Done"
                                   style:UIBarButtonItemStyleBordered
                                   target:self
                                   action:@selector(onDonePressed)];
    self.navigationItem.rightBarButtonItem = doneButton;
    
    // left button
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc]
                                   initWithTitle:@"Back"
                                   style:UIBarButtonItemStyleBordered
                                   target:self
                                   action:@selector(onBackPressed)];
    self.navigationItem.leftBarButtonItem = backButton;
    self.navigationItem.leftBarButtonItem.enabled = NO;
    
    // title
    self.navigationItem.title = @"Help Center";
    
    // web view delegation
    self.webView.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated
{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://%@.reamaze.com", _brand]];
    NSMutableURLRequest *requestObj = [NSMutableURLRequest requestWithURL:url];

#if DEBUG
    [NSURLRequest setAllowsAnyHTTPSCertificate:YES forHost:[url host]];
#endif
    
    [requestObj setValue:@"iOS" forHTTPHeaderField:@"X-Reamaze-Embed"];
    [self.webView loadRequest:requestObj];
}

#pragma mark - Navigation callbacks

- (IBAction)onDonePressed
{
    [self.presentingViewController dismissViewControllerAnimated:TRUE completion:nil];
    
    if ([self.delegate respondsToSelector:@selector(reamazeCompletionHandler:)]) {
        [self.delegate reamazeCompletionHandler:(ReamazeController*)self.presentingViewController];
    }
}

- (IBAction)onBackPressed
{
    if ([self.webView canGoBack])
        [self.webView goBack];
}

#pragma mark - UIWebViewDelegate

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    
    self.navigationItem.leftBarButtonItem.enabled = [self.webView canGoBack];
}

@end
