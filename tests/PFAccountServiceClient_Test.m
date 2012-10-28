//
//  PFAccountServiceClient_Test.m
//  WhatIsThat
//
//  Created by Mark Gants on 7/6/12.
//  Copyright (c) 2012 Playfirst. All rights reserved.
//

#import "PFAccountServiceClient_Test.h"
#import "PFAccountServiceClient.h"
#import "SBJSON.h"

/**
 * Unit tests for the PFAccountServiceClient class.
 */
@implementation PFAccountServiceClient_Test

-(void) testUrlConstants
{
#ifdef DEBUG
    NSString *expected = @"http://api-stage.playfirst.com/v1/account";
#else
    NSString *expected = @"http://api.playfirst.com/v1/account";
#endif
    
    STAssertTrue([expected isEqualToString: PF_ACCOUNTS_URL], @"Constant %@ not equal to expected value: %@", PF_ACCOUNTS_URL, expected);
}

-(void) testAuthConstants
{
#ifdef DEBUG
    NSString *expected = @"Basic dGVzdF9hcGlfYWNjb3VudF9pZDp0ZXN0X2FwaV9hY2NvdW50X2lkX3Bhc3N3b3Jk";
#else
    NSString *expected = @"Basic NWFlMTIxZTMtODZjZC00ZWZiLWI5NGItZThhYmE4NWI4N2U3OjMyNzljYWE2LTExNTQtNDc3MS04NTQ2LTEzZTk3MWE5ZDEzNQ==";
#endif

    STAssertTrue([expected isEqualToString: PF_ACCOUNTS_AUTH], @"Constant %@ not equal to expected value: %@", PF_ACCOUNTS_AUTH, expected);
}

-(void) testSendRequest
{
    STAssertThrows([PFAccountServiceClient sendRequest: nil], @"Did not catch expected exception from PFAccountServiceClient sendRequest");
}

-(void) testConstants
{
    NSString *expected = @"PlayFirstUserId";
    STAssertTrue([expected isEqualToString: PF_KEY_ACCOUNT_ID], @"Constant %@ not equal to expected value: %@", PF_KEY_ACCOUNT_ID, expected);
    
    expected = @"FacebookUserId";
    STAssertTrue([expected isEqualToString: FB_KEY_ACCOUNT_ID], @"Constant %@ not equal to expected value: %@", FB_KEY_ACCOUNT_ID, expected);
    
    expected =@"gotPlayFirstId";
    STAssertTrue([expected isEqualToString: PF_EVENT_GOT_ACCOUNT], @"Constant %@ not equal to expected value: %@", PF_EVENT_GOT_ACCOUNT, expected);
}

-(void) testRequestToCreatePFAccountFrom
{
    NSString *fbId = @"12345";
    PFUserIdRequest *req = [PFAccountServiceClient requestToCreatePFAccountFrom: fbId];

    // Test request options
    STAssertNotNil(req, nil);
    STAssertNotNil(req.facebookId, nil);
    STAssertTrue([req.facebookId isEqualToString: fbId], nil);
    STAssertTrue([[[req URL] absoluteString] isEqualToString: PF_ACCOUNTS_URL], nil);
    STAssertTrue([[req HTTPMethod] isEqualToString: @"POST"], nil);
    STAssertTrue([[req valueForHTTPHeaderField: @"Content-Type"] isEqualToString: @"application/json"], nil);
    STAssertTrue([[req valueForHTTPHeaderField: @"Authorization"] isEqualToString: PF_ACCOUNTS_AUTH], nil);
    STAssertNotNil([req HTTPBody], nil);

    // Get request body
    NSString *str = [[NSString alloc] initWithData: [req HTTPBody] encoding: NSUTF8StringEncoding];
    SBJSON *json = [[SBJSON alloc] init];
    NSDictionary *dict = [json objectWithString: str error: nil];

    // Test body values
    STAssertNotNil(dict, nil);
    STAssertNotNil([dict objectForKey: @"type"], nil);
    STAssertTrue([[dict objectForKey: @"type"] isEqualToString: @"FACEBOOK"], nil);

    STAssertNotNil([dict objectForKey: @"accountId"], nil);
    STAssertTrue([[dict objectForKey: @"accountId"] isEqualToString: fbId], nil);
    
}

-(void) testRequestToQueryPFAccountFrom
{
    NSString *fbId = @"12345";
    PFUserIdRequest *req = [PFAccountServiceClient requestToQueryPFAccountFrom: fbId];

    // Test url string
    NSString *str = [NSString stringWithFormat: @"%@?subAccountId=%@&type=FACEBOOK"
                     ,PF_ACCOUNTS_URL
                     ,fbId];

    // Test request options
    STAssertNotNil(req, nil);
    STAssertNotNil(req.facebookId, nil);
    STAssertTrue([req.facebookId isEqualToString: fbId], nil);
    STAssertTrue([[[req URL] absoluteString] isEqualToString: str], nil);
    STAssertTrue([[req HTTPMethod] isEqualToString: @"GET"], nil);
    STAssertTrue([[req valueForHTTPHeaderField: @"Content-Type"] isEqualToString: @"application/json"], nil);
    STAssertTrue([[req valueForHTTPHeaderField: @"Authorization"] isEqualToString: PF_ACCOUNTS_AUTH], nil);
    STAssertNil([req HTTPBody], nil);
}

@end
