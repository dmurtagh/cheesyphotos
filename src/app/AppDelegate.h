//
//  AppDelegate.h
//  StoryboardTest
//
//  Created by Damien Murtagh on 5/21/12.
//  Copyright (c) 2012 Playfirst. All rights reserved.
//

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    // UI members
    UIViewController *_currentViewController;   // Current view controller.
    UIView           *_activityView;            // Pointer to the activity indicator view.
    bool             _showingActivityIndicator; // True if we are showing the indicator, don't want to show it again if already visible.
}

// UI properties
@property (strong, nonatomic) UIWindow                *window;

@property (nonatomic, strong) UIViewController        *currentViewController;
@property (nonatomic, strong) UIActivityIndicatorView *activityIndicator;
@property (nonatomic, strong) UIView                  *activityView;

// Instance methods
- (void) showActivityIndicator;
- (void) hideActivityIndicator;

@end
