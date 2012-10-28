//
//  Utilities_Test.m
//  WhatIsThat
//
//  Created by Mark Gants on 7/17/12.
//  Copyright (c) 2012 Playfirst. All rights reserved.
//

#import "Utilities_Test.h"
#import "Utilities.h"

/**
 * Unit tests for the Utilties class.
 */
@implementation Utilities_Test

- (void) testGetStagingFolder
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *expected = [documentsDirectory stringByAppendingPathComponent:@"Staging"];
    
    NSString *ret = [Utilities getStagingFolder];
    STAssertTrue([ret isEqualToString: expected], nil);
}

- (void) testGetArchivedGamesFolder
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *dir = [paths objectAtIndex:0];
    NSString *expected = [dir stringByAppendingPathComponent:@"ArchivedGames"];
    
    NSString *ret = [Utilities getArchivedGamesFolder];
    STAssertTrue([ret isEqualToString: expected], nil);
}

- (void) testZipDirectoryContents
{
    NSFileManager *fm = [NSFileManager defaultManager];
    
    /**
     * Test nil directory
     */
    NSString *dir  = nil;
    NSString *file = nil;
    
    BOOL ret = [Utilities zipDirectoryContents: dir toFile: file];
    STAssertFalse(ret, nil);
    
    /**
     * Test empty directory
     */
    dir  = @"";
    file = nil;
    
    ret = [Utilities zipDirectoryContents: dir toFile: file];
    STAssertFalse(ret, nil);
    
    /**
     * Test non existant directory
     */
    dir  = [[[NSFileManager defaultManager] currentDirectoryPath] stringByAppendingString:@"crap"];
    file = nil;
    
    ret = [Utilities zipDirectoryContents: dir toFile: file];
    STAssertFalse(ret, nil);
    
    /**
     * Test valid directory, nil file
     */
    dir  = [[Utilities getStagingFolder] stringByAppendingString: @"/unittest"];
    ret = [fm createDirectoryAtPath: dir withIntermediateDirectories: YES attributes: nil error: nil];
    STAssertTrue(ret, nil);
    
    file = nil;
    
    ret = [Utilities zipDirectoryContents: dir toFile: file];
    STAssertFalse(ret, nil);
    
    /**
     * Test valid directory, empty file
     */
    file = @"";
    
    ret = [Utilities zipDirectoryContents: dir toFile: file];
    STAssertFalse(ret, nil);
    
    /**
     * Test valid arguments,  w/ no contents.
     */
    file = [dir stringByAppendingString: @"/test.zip"];
    
    ret = [Utilities zipDirectoryContents: dir toFile: file];
    STAssertFalse(ret, nil);
    
    /**
     * Test valid arguments w/ contents
     */
    NSString *tmp = [[[NSBundle mainBundle] resourcePath] stringByAppendingFormat: @"/pen.png"];
    ret = [fm fileExistsAtPath: tmp];
    STAssertTrue(ret, nil);
    
    NSString *tmpImage = [dir stringByAppendingString: @"/pen.png"];
    ret = [fm copyItemAtPath: tmp toPath: tmpImage error: nil];
    STAssertTrue(ret, nil);
    
    ret = [fm fileExistsAtPath: tmpImage];
    STAssertTrue(ret, nil);
    
    ret = [Utilities zipDirectoryContents: dir toFile: file];
    STAssertTrue(ret, nil);
    STAssertTrue([fm fileExistsAtPath: tmp], nil);
    
    /**
     * Clean up
     */
    ret = [fm removeItemAtPath: tmpImage error: nil];
    STAssertTrue(ret, nil);
    
    ret = [fm removeItemAtPath: file error: nil];
    STAssertTrue(ret, nil);
    
    ret = [fm removeItemAtPath: dir error: nil];
    STAssertTrue(ret, nil);
}

- (void) testUnzipFile
{
    NSFileManager *fm = [NSFileManager defaultManager];
    
    /**
     * Test nil directory
     */
    NSString *dir  = nil;
    NSString *file = nil;
    
    BOOL ret = [Utilities unzipFile: file toDirectory: dir];
    STAssertFalse(ret, nil);
    
    /**
     * Test empty directory
     */
    dir  = @"";
    file = nil;
    
    ret = [Utilities unzipFile: file toDirectory: dir];
    STAssertFalse(ret, nil);
    
    /**
     * Test non existant directory
     */
    dir  = [[[NSFileManager defaultManager] currentDirectoryPath] stringByAppendingString:@"crap"];
    file = nil;
    
    ret = [Utilities unzipFile: file toDirectory: dir];
    STAssertFalse(ret, nil);
    
    /**
     * Test valid directory, nil file
     */
    dir  = [[Utilities getStagingFolder] stringByAppendingString: @"/unittest"];
    ret = [fm createDirectoryAtPath: dir withIntermediateDirectories: YES attributes: nil error: nil];
    STAssertTrue(ret, nil);
    
    file = nil;
    
    ret = [Utilities unzipFile: file toDirectory: dir];
    STAssertFalse(ret, nil);
    
    /**
     * Test valid directory, empty file
     */
    file = @"";
    
    ret = [Utilities unzipFile: file toDirectory: dir];
    STAssertFalse(ret, nil);
    
    /**
     * Test valid arguments
     */
    NSString *tmp = [[[NSBundle mainBundle] resourcePath] stringByAppendingFormat: @"/pen.png"];
    ret = [fm fileExistsAtPath: tmp];
    STAssertTrue(ret, nil);
    
    NSString *tmpImage = [dir stringByAppendingString: @"/pen.png"];
    ret = [fm copyItemAtPath: tmp toPath: tmpImage error: nil];
    STAssertTrue(ret, nil);
    
    ret = [fm fileExistsAtPath: tmpImage];
    STAssertTrue(ret, nil);
    
    file = [dir stringByAppendingString: @"/test.zip"];
    
    ret = [Utilities zipDirectoryContents: dir toFile: file];
    STAssertTrue(ret, nil);
    STAssertTrue([fm fileExistsAtPath: tmp], nil);
    
    ret = [Utilities unzipFile: file toDirectory: dir];
    STAssertTrue(ret, nil);
    
    /**
     * Clean up
     */
    ret = [fm removeItemAtPath: tmpImage error: nil];
    STAssertTrue(ret, nil);
    
    ret = [fm removeItemAtPath: file error: nil];
    STAssertTrue(ret, nil);
    
    ret = [fm removeItemAtPath: dir error: nil];
    STAssertTrue(ret, nil);
}

@end
