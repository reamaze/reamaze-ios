Reamaze SDK for iOS
===================

[Reamaze](https://www.reamaze.com/) allows you to embed a support knowledge base into your app.



Sample app
----------

For a quick first look at Reamaze, we have included a very small sample application that you can build and run. The sample app demonstrates presenting a ReamazeController and delegation when the controller is finished.


Installation
------------

There are two ways to add Reamaze to your project:

#### CocoaPods

[CocoaPods](http://cocoapods.org/) is a common library dependency management tool for Objective-C.  To use the Reamaze iOS bindings with CocoaPods, simply add the following to your `Podfile` and run `pod install`:

```ruby
pod 'Reamaze', :git => 'https://github.com/reamaze/reamaze-ios.git'
```

Note: be sure to use the `.xcworkspace` to open your project in Xcode instead of the `.xcproject`.


#### Copy manually

1. Clone this repository (`git clone --recursive`)
1. In the menubar, click on 'File' then 'Add files to "Project"...'
1. Select the 'ReamazeSDK' directory in your cloned reamaze-ios repository
1. Make sure "Copy items into destination group's folder (if needed)" is checked"
1. Click "Add"


Instructions
------------

#### Integrate


Trigger Reamaze from anywhere (e.g. Button Press)

```obj-c
// SomeViewController.m

- (IBAction)viewHelp:(id)sender {
  ReamazeController *reamaze = [[ReamazeController alloc] init];
  reamaze.brand = @"YOUR BRAND HERE"; // Get your brand from the subdomain of your public site. (e.g. foobar.reamaze.com is brand "foobar")
  [self presentModalViewController:reamaze animated:YES];
}
```

#### Optional Delegation

Create a class that conforms to the `ReamazeControllerDelegate` protocol.

```obj-c
// SomeViewController.h

#import "Reamaze.h"
@interface SomeViewController : UIViewController<ReamazeControllerDelegate>
// ...
```

Write a delegate method to receive the callback when the user is done viewing your knowledge base
```obj-c
// SomeViewController.m

- (void)reamazeCompletionHandler:(ReamazeController *)reamaze {
  NSLog(@"Reamaze is done");
}
```

That's all you need to do!
