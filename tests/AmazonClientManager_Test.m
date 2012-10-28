//
//  AmazonClientManager_Test.m
//  WhatIsThat
//
//  Created by Mark Gants on 7/2/12.
//  Copyright (c) 2012 Playfirst. All rights reserved.
//

#import "AmazonClientManager_Test.h"
#import "AmazonClientManager.h"
#import <AWSiOSSDK/S3/AmazonS3Client.h>
#import <AWSiOSSDK/SQS/AmazonSQSClient.h>

/**
 * Unit tests for the AmazonClientManager class.
 */
@implementation AmazonClientManager_Test

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void) testS3Client
{
    AmazonS3Client *s3 = [AmazonClientManager s3];
    STAssertNotNil(s3, @"%@ returned invalid S3 client.", class_getName( [AmazonS3Client class] ));
}

- (void) testSQSClient
{
    AmazonSQSClient *sqs = [AmazonClientManager sqs];
    STAssertNotNil(sqs, @"%@ returned invalid SQS client.", class_getName( [AmazonSQSClient class] ));
}

@end
