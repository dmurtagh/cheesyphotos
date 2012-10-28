 //
//  main.m
//  StoryboardTest
//
//  Created by Damien Murtagh on 5/21/12.
//  Copyright (c) 2012 Playfirst. All rights reserved.
//

#import "AppDelegate.h"

int main(int argc, char *argv[])
{
    @autoreleasepool 
    {
        @try 
        {
            // Kick off UI application
            return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
        }
        @catch (NSException *exception) 
        {
            // Log uncaught exceptions
            NSArray  *backtrace = [exception callStackSymbols];
            NSString *system    = [[UIDevice currentDevice] systemName];
            NSString *version   = [[UIDevice currentDevice] systemVersion];
            NSString *message   = [NSString stringWithFormat:@"%@: %@\nDevice: %@. OS: %@. Backtrace:\n%@"
                                   , [exception name]
                                   , [exception reason]
                                   , system
                                   , version
                                   , backtrace];
            
            NSLog(@"%@", message);
        }
    }
}
