//
//  AppDelegate.m
//  StoryboardTest
//
//  Created by Damien Murtagh on 5/21/12.
//  Copyright (c) 2012 Playfirst. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

#pragma mark - Instance Methods

/**
 * Clean up allocated resources.
 */
- (void)dealloc
{
}

/**
 * Called when the app has launched.
 *
 * @param application   The application that launched.
 * @param launchOptions Launch options.
 *
 * @return true when ready to run.
 */
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    _showingActivityIndicator = false;
        
    // Override point for customization after application launch.
    return YES;
}

/**
 * Sent when the application is about to move from active to inactive state. 
 * This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) 
 * or when the user quits the application and it begins the transition to the background state.
 * Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. 
 * Games should use this method to pause the game.
 */
- (void)applicationWillResignActive:(UIApplication *)application
{
    
}

/**
 * Use this method to release shared resources, save user data, invalidate timers, and store enough 
 * application state information to restore your application to its current state in case it is terminated later. 
 * If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
 */
- (void)applicationDidEnterBackground:(UIApplication *)application
{
    
}

/**
 * Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
 */
- (void)applicationWillEnterForeground:(UIApplication *)application
{
    
}

/**
 * Restart any tasks that were paused (or not yet started) while the application was inactive. 
 * If the application was previously in the background, optionally refresh the user interface.
 */
- (void)applicationDidBecomeActive:(UIApplication *)application
{
}

/**
 * Called when the application is about to terminate. 
 * Save data if appropriate. See also applicationDidEnterBackground:.
 */
- (void)applicationWillTerminate:(UIApplication *)application
{
}

/**
 * Method to show the activity indicator.
 */
- (void) showActivityIndicator
{
    if (self.currentViewController == nil)
    {
        // No current viewController set so cant do anything.
        return; 
    }

    // Check that we're not already showing the activity indicatory (in a thread safe manner)
    @synchronized(self)
    {
        if (_showingActivityIndicator)
        {
            return;
        }
        
        _showingActivityIndicator = true;
    }
    
    CGRect bounds = self.window.bounds;
    
    self.activityView = [[UIView alloc] initWithFrame: CGRectMake(0, 0, bounds.size.width, bounds.size.height)];
    self.activityView.backgroundColor = [UIColor blackColor];
    self.activityView.alpha = 0.5;
    
    UIActivityIndicatorView *activityWheel = [[UIActivityIndicatorView alloc] initWithFrame: 
        CGRectMake(bounds.size.width / 2 - 12, bounds.size.height / 2 - 12, 24, 24)];
    activityWheel.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhite;
    activityWheel.autoresizingMask = (UIViewAutoresizingFlexibleLeftMargin |
                                      UIViewAutoresizingFlexibleRightMargin |
                                      UIViewAutoresizingFlexibleTopMargin |
                                      UIViewAutoresizingFlexibleBottomMargin);
    [self.activityView addSubview:activityWheel];
    
    UIView * currentView = self.currentViewController.view;
    [currentView addSubview: self.activityView];
    
    [[[self.activityView subviews] objectAtIndex:0] startAnimating];
}

/**
 * Method to hide the activity indicator.
 */
- (void) hideActivityIndicator
{
    @synchronized(self)
    {
        _showingActivityIndicator = false;
    }
    
    [[[self.activityView subviews] objectAtIndex:0] stopAnimating];
    [self.activityView removeFromSuperview];
    self.activityView = nil;
}

#pragma mark - Getters and Setters

/**
 * Method to set the current view controller. Also hides the activity indicator.
 */
- (void) setCurrentViewController:(UIViewController *)currentViewController
{
    _currentViewController = currentViewController;
    [self hideActivityIndicator];
}

@end
