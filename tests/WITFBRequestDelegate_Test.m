//
//  WITFBRequestDelegate_Test.m
//  WhatIsThat
//
//  Created by Mark Gants on 7/6/12.
//  Copyright (c) 2012 Playfirst. All rights reserved.
//

#import "WITFBRequestDelegate_Test.h"
#import "WITFBRequestDelegate.h"
#import "FBUserResponseDelegate.h"
#import "FBFriendsListResponseDelegate.h"

/**
 * Unit tests for the WITFBRequestDelegate class.
 */
@implementation WITFBRequestDelegate_Test

-(void) testConstants
{
    NSString *expected = @"447199031971669";
    STAssertTrue([expected isEqualToString: FB_APP_ID], @"Constant: %@ not equal to expected value: %@", FB_APP_ID, expected);               
    
    expected = @"FBAccessTokenKey"; 
    STAssertTrue([expected isEqualToString: FB_KEY_ACCESS_TOKEN], @"Constant: %@ not equal to expected value: %@", FB_KEY_ACCESS_TOKEN, expected);
    
    expected = @"FBExpirationDateKey";
    STAssertTrue([expected isEqualToString: FB_KEY_EXPIRATION_DATE], @"Constant: %@ not equal to expected value: %@", FB_KEY_EXPIRATION_DATE, expected);
    
    expected = @"gotFacebookId";
    STAssertTrue([expected isEqualToString: FB_EVENT_GOT_USER_ID], @"Constant: %@ not equal to expected value: %@", FB_EVENT_GOT_USER_ID, expected);
}

@end
