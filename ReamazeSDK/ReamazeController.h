//
//  ReamazeController.h
//  ReamazeSDK
//
//  Copyright (c) 2014 Reamaze. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ReamazeController;

@protocol ReamazeControllerDelegate <UINavigationControllerDelegate>
@optional
- (void)reamazeCompletionHandler:(ReamazeController *)reamazeController;
@end

@interface ReamazeController : UINavigationController

@property (nonatomic, weak) id <ReamazeControllerDelegate> delegate;
@property (nonatomic, copy) NSString* brand;

@end
