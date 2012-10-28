//
//  MessageManager_Test.m
//  WhatIsThat
//
//  Created by Mark Gants on 7/2/12.
//  Copyright (c) 2012 Playfirst. All rights reserved.
//

#import "MessageManager_Test.h"
#import "MessageManager.h"

/**
 * Unit tests for the AsyncFileUploader class.
 */
@implementation MessageManager_Test

static NSString * userId1;          // User id to test with.
static NSString * userId2;          // User id to test with.
static NSString * gameId;           // Game id to test with.

+ (void) initialize
{
    // Init bucket id
    userId1 = @"pf-wit-unit-test-user1";
    userId2 = @"pf-wit-unit-test-user2";
    
    // Init game id
    gameId = @"game_id_placeholder";
}

- (void)setUp
{
    [super setUp];
    
    // Init file loader for testing
    _messageManager = [[MessageManager alloc] init];
    STAssertNotNil(_messageManager, @"%@ instance could not be initialized ", class_getName([MessageManager class]));
}


- (void)tearDown
{
    // Tear-down code here.
    _messageManager = nil;
    
    [super tearDown];
}

- (void) clearKey:(NSString*)key
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setValue: nil forKey: key];
    STAssertNil([defaults stringForKey:key], 
                @"NSUserDefaults value for key \"%@\" should be nil. Instead found: \"%@\"",
                key,
                [defaults stringForKey:key]);
}

- (void) testFindQueueUrlForUser
{
    /*
    // Create a queue so we can use it
    [_messageManager createQueueForUser:userId1];
    [_messageManager createQueueForUser:userId2];
    
    // Should ping the server
    NSString * urlFromFunction = [_messageManager findQueueUrlForUser:userId1]; 
    STAssertTrue([urlFromFunction isEqualToString:@"https://queue.amazonaws.com/888039811649/pf-wit-unit-test-user1"],
                 @"[MessageManager findQueueUrlForUser] failed.");
    
    // Should ping the server
    urlFromFunction = [_messageManager findQueueUrlForUser:userId2];
    STAssertTrue([urlFromFunction isEqualToString:@"https://queue.amazonaws.com/888039811649/pf-wit-unit-test-user2"],
                 @"[MessageManager findQueueUrlForUser] failed.");
    
    // Should use the version from NSDefaults
    urlFromFunction = [_messageManager findQueueUrlForUser:userId2];
    STAssertTrue([urlFromFunction isEqualToString:@"https://queue.amazonaws.com/888039811649/pf-wit-unit-test-user2"],
                 @"[MessageManager findQueueUrlForUser] failed.");
*/
}

@end
