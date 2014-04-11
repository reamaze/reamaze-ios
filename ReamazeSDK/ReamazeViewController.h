//
//  ReamazeViewController.h
//  ReamazeSDK
//
//  Copyright (c) 2014 Reamaze. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ReamazeController.h"

@interface ReamazeViewController : UIViewController

@property (nonatomic, weak) id <ReamazeControllerDelegate> delegate;
@property (nonatomic, copy) NSString* brand;

@end
