//
//  AsyncFileOperation_Test.h
//  WhatIsThat
//
//  Created by Mark Gants on 7/18/12.
//  Copyright (c) 2012 Playfirst. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>

@class AsyncFileOperation;

/**
 * Unit tests for the AsyncFileOperation class.
 */
@interface AsyncFileOperation_Test : SenTestCase
{
    AsyncFileOperation *_op;    // Instance for testing.
    
    // Config params for testing
    NSString *_path;    // File path
    NSString *_uid;     // User id
    NSString *_gid;     // Game round id
    NSString *_bid;     // Bucket id
}

@end
