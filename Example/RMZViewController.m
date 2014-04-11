//
//  RMZViewController.m
//  ReamazeSDK
//
//  Copyright (c) 2014 Reamaze. All rights reserved.
//

#import "RMZViewController.h"
#import "Reamaze.h"

@interface NSURLRequest (DummyInterface)
+ (BOOL)allowsAnyHTTPSCertificateForHost:(NSString*)host;
+ (void)setAllowsAnyHTTPSCertificate:(BOOL)allow forHost:(NSString*)host;
@end

@interface RMZViewController () <ReamazeControllerDelegate>
@end

@implementation RMZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onHelpClicked:(id)sender
{
    ReamazeController *reamaze = [[ReamazeController alloc] init];
    reamaze.delegate = self;
    reamaze.brand = @"democentral";
    [self presentViewController:reamaze animated:true completion:nil];
}

#pragma mark - ReamazeControllerDelegate
- (void)reamazeCompletionHandler:(ReamazeController *)reamazeController
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Done" message:@"Back from Reamaze" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}

@end
