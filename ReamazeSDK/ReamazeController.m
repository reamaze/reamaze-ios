//
//  ReamazeNavigationController.m
//  ReamazeSDK
//
//  Copyright (c) 2014 Reamaze. All rights reserved.
//

#import "ReamazeController.h"
#import "ReamazeViewController.h"

@interface ReamazeController () 

@property (nonatomic, retain) ReamazeViewController *reamazeController;

@end

@implementation ReamazeController
@synthesize delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _reamazeController = [[ReamazeViewController alloc] init];
        self.viewControllers = @[_reamazeController];
    }
    return self;
}

- (void)viewDidLoad
{
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setBrand:(NSString *)brand
{
    _brand = brand;
    _reamazeController.brand = brand;
}

- (void)setDelegate:(id<ReamazeControllerDelegate>)newDelegate
{
    delegate = newDelegate;
    _reamazeController.delegate = newDelegate;
}

@end
