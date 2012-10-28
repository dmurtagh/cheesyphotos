//
//  AsyncFileOperation_Test.m
//  WhatIsThat
//
//  Created by Mark Gants on 7/18/12.
//  Copyright (c) 2012 Playfirst. All rights reserved.
//

#import "AsyncFileOperation_Test.h"
#import "AsyncFileOperation.h"

/**
 * Unit tests for the AsyncFileOperation class.
 */
@implementation AsyncFileOperation_Test

- (void) setUp
{
    [super setUp];
    
    _op = [AsyncFileOperation alloc];
}

- (void) tearDown
{
    _op = nil;
    
    [super tearDown];
}

- (void) testInitForDownload_nilPath
{
    _path = nil;
    _uid  = nil;
    _gid  = nil;
   
    STAssertThrows(_op = [_op initForDownloadWithFilePath: _path userId: _uid gameRoundId: _gid], nil);
}

- (void) testInitForDownload_emptyPath
{
    _path = @"";
    _uid  = nil;
    _gid  = nil;
    
    STAssertThrows(_op = [_op initForDownloadWithFilePath: _path userId: _uid gameRoundId: _gid], nil);
}

- (void) testInitForDownload_nilUserId
{
    _path = @"/some/path/to/a/file.zip";
    _uid  = nil;
    _gid  = nil;
    
    STAssertThrows(_op = [_op initForDownloadWithFilePath: _path userId: _uid gameRoundId: _gid], nil);
}

- (void) testInitForDownload_EmptyUserId
{
    _path = @"/some/path/to/a/file.zip";
    _uid  = @"";
    _gid  = nil;
    
    STAssertThrows(_op = [_op initForDownloadWithFilePath: _path userId: _uid gameRoundId: _gid], nil);
}

- (void) testInitForDownload_nilGameRoundId
{
    _path = @"/some/path/to/a/file.zip";
    _uid  = @"unittest_user";
    _gid  = nil;
    
    STAssertThrows(_op = [_op initForDownloadWithFilePath: _path userId: _uid gameRoundId: _gid], nil);
}

- (void) testInitForDownload_emptyGameRoundId
{
    _path = @"/some/path/to/a/file.zip";
    _uid  = @"unittest_user";
    _gid  = @"";
    
    STAssertThrows(_op = [_op initForDownloadWithFilePath: _path userId: _uid gameRoundId: _gid], nil);
}

- (void) testInitForDownload
{
    _path = @"/some/path/to/a/file.zip";
    _uid  = @"unittest_user";
    _gid  = @"12345";
    
    _op = [_op initForDownloadWithFilePath: _path userId: _uid gameRoundId: _gid];
    STAssertNotNil(_op, nil);
    STAssertTrue(_op.isConcurrent, nil);
    STAssertFalse(_op.isExecuting, nil);
    STAssertFalse(_op.isFinished, nil);
}

- (void) testInitForUpload_nilPath
{
    _path = nil;
    _bid  = nil;
    _gid  = nil;
    
    STAssertThrows(_op = [_op initForUploadWithFilePath: _path bucketId: _bid gameRoundId: _gid], nil);
}

- (void) testInitForUpload_emptyPath
{
    _path = @"";
    _bid  = nil;
    _gid  = nil;
    
    STAssertThrows(_op = [_op initForUploadWithFilePath: _path bucketId: _bid gameRoundId: _gid], nil);
}

- (void) testInitForUpload_bogusFile
{
    _path = @"/some/path/to/a/file.zip";
    _bid  = nil;
    _gid  = nil;
    
    STAssertThrows(_op = [_op initForUploadWithFilePath: _path bucketId: _bid gameRoundId: _gid], nil);
}

- (void) testInitForUpload_nilBucketId
{
    _path = [[[NSBundle mainBundle] resourcePath] stringByAppendingFormat: @"/pen.png"];
    _bid  = nil;
    _gid  = nil;
    
    STAssertThrows(_op = [_op initForUploadWithFilePath: _path bucketId: _bid gameRoundId: _gid], nil);
}

- (void) testInitForUpload_emptyBucketId
{
    _path = [[[NSBundle mainBundle] resourcePath] stringByAppendingFormat: @"/pen.png"];
    _bid  = @"";
    _gid  = nil;
    
    STAssertThrows(_op = [_op initForUploadWithFilePath: _path bucketId: _bid gameRoundId: _gid], nil);
}

- (void) testInitForUpload_nilGameRoundId
{
    _path = [[[NSBundle mainBundle] resourcePath] stringByAppendingFormat: @"/pen.png"];
    _bid  = @"12345";
    _gid  = nil;
    
    STAssertThrows(_op = [_op initForUploadWithFilePath: _path bucketId: _bid gameRoundId: _gid], nil);
}

- (void) testInitForUpload_emptyGameRoundId
{
    _path = [[[NSBundle mainBundle] resourcePath] stringByAppendingFormat: @"/pen.png"];
    _bid  = @"12345";
    _gid  = @"";
    
    STAssertThrows(_op = [_op initForUploadWithFilePath: _path bucketId: _bid gameRoundId: _gid], nil);
}


- (void) testInitForUpload
{
    _path = [[[NSBundle mainBundle] resourcePath] stringByAppendingFormat: @"/pen.png"];
    _bid  = @"12345";
    _gid  = @"12345";
    
    _op = [_op initForUploadWithFilePath: _path bucketId: _bid gameRoundId: _gid];
    STAssertNotNil(_op, nil);
    STAssertTrue(_op.isConcurrent, nil);
    STAssertFalse(_op.isExecuting, nil);
    STAssertFalse(_op.isFinished, nil);
}

@end
