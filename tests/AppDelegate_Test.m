//
//  AppDelegate_Test.m
//  WhatIsThat
//
//  Created by Mark Gants on 7/16/12.
//  Copyright (c) 2012 Playfirst. All rights reserved.
//

#import "AppDelegate_Test.h"
#import "AppDelegate.h"

/**
 * Unit tests for the AppDelegate class.
 */
@implementation AppDelegate_Test

- (void)setUp
{
    [super setUp];
    
    // Init file loader for testing
    appDelegate = [[AppDelegate alloc] init];
    STAssertNotNil(appDelegate, @"%@ instance could not be initialized ", NSStringFromClass([AppDelegate class]));
}


- (void)tearDown
{
    // Tear-down code here.
    appDelegate = nil;
    
    [super tearDown];
}

- (void) testUserInfoProperty
{
    // Test default
    STAssertNil(appDelegate.fbUserInfo, @"Expected invalid user info property.");
}

-(void) testFriendsListProperty
{
    // Test default
    STAssertNil(appDelegate.fbFriendsList, @"Expected invalid friends list property.");
}

@end
