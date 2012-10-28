//
//  MessageManager_Test.m
//  WhatIsThat
//
//  Created by Mark Gants on 7/2/12.
//  Copyright (c) 2012 Playfirst. All rights reserved.
//

#import "ThemeManager_Test_Data.h"
#import "ThemeManager_Test.h"
#import "ThemeManager.h"

/**
 * Unit tests for the ThemeManager class.
 */
@implementation ThemeManager_Test

#pragma mark setup and teardown

+ (void) initialize
{
}

- (void)setUp
{
    [super setUp];
    
    // Init file loader for testing
    _themeManager = [[ThemeManager alloc] init];
    STAssertNotNil(_themeManager, @"%@ instance could not be initialized ", class_getName([ThemeManager class]));
    
    [ThemeManager_Test_Data createTestData];
}
             
- (void)tearDown
{
    // Tear-down code here.
    _themeManager = nil;
    
    [super tearDown];
}

#pragma mark - Test functions

- (void) testWithFileMissing
{
    // Rename the file
    NSString * resourcePath = [[NSBundle mainBundle] resourcePath];
    NSString * fileUrl = [resourcePath stringByAppendingPathComponent:@"themes.json"];
    NSString * altFileUrl = [resourcePath stringByAppendingPathComponent:@"themes.json.bak"];
    [[NSFileManager defaultManager] moveItemAtPath:fileUrl toPath:altFileUrl error:nil];
    
    // Recreate the themeManager so it will reload the file
    _themeManager = [[ThemeManager alloc] init];
    STAssertNotNil(_themeManager, @"%@ instance could not be initialized ", class_getName([ThemeManager class]));
    
    // Run some tests
    [self helperTestThemeCount:1 expectedResult:0];
    [self helperTestThemeCount:3 expectedResult:0];
    [self helperTestThemeCount:5 expectedResult:0];
    [self helperTestThemeCount:8 expectedResult:0];
    
    // Rename back to themes.json (and reload _themeManager) so that we don't affect other tests
    [[NSFileManager defaultManager] moveItemAtPath:altFileUrl toPath:fileUrl error:nil];
    _themeManager = [[ThemeManager alloc] init];
    STAssertNotNil(_themeManager, @"%@ instance could not be initialized ", class_getName([ThemeManager class]));
}

- (void) testGenerateThemes
{
    [self helperTestThemeCount:-1 expectedResult:0];
    [self helperTestThemeCount:0 expectedResult:0];
    [self helperTestThemeCount:1 expectedResult:1];
    [self helperTestThemeCount:3 expectedResult:3];
    [self helperTestThemeCount:5 expectedResult:5];
    [self helperTestThemeCount:8 expectedResult:8];
    [self helperTestThemeCount:1000 expectedResult:164];
    [self helperTestThemeCount:1000000000 expectedResult:164];
}

- (void) testWrongAnswerGeneration
{
    // Test -1 wrong answers
    [_themeManager generateWrongAnswersFor:@"Medieval" numWrongAnswers:-1];
    NSArray * wrongAnswers = _themeManager.wrongAnswers;
    STAssertTrue(wrongAnswers.count == 0, @"Wrong Answer count should be 0, but was %d", wrongAnswers.count);
    
    // Test 1000000 wrong answers
    [_themeManager generateWrongAnswersFor:@"Medieval" numWrongAnswers:1000000];
    STAssertTrue(wrongAnswers.count == 163, @"Wrong Answer count should be 163, but was %d", wrongAnswers.count);
    
    // Test 3 choices, 1 wrong answer
    [_themeManager generateThemes:3];
    NSArray * themeChoices = _themeManager.themeChoices;
    NSString * chosenAnswer = [themeChoices objectAtIndex:0];
    [_themeManager generateWrongAnswersFor:chosenAnswer numWrongAnswers:1];
    
    STAssertTrue(wrongAnswers.count == 1, @"Wrong Answer count should be %d, but was %d", 1, wrongAnswers.count);
    STAssertFalse([[wrongAnswers objectAtIndex:0] isEqualToString:chosenAnswer],
                  @"Wrong answer %@ should not be equal to chosen answer %@",
                  [wrongAnswers objectAtIndex:0], chosenAnswer);
    
    // Test 3 choices, 3 wrong answers
    [_themeManager generateThemes:3];
    themeChoices = _themeManager.themeChoices;
    chosenAnswer = [themeChoices objectAtIndex:2];
    [_themeManager generateWrongAnswersFor:chosenAnswer numWrongAnswers:3];
    
    STAssertTrue(wrongAnswers.count == 3, @"Wrong Answer count should be %d, but was %d", 1, wrongAnswers.count);
    
    for (int index = 0 ; index < 3 ; index++)
    {
        STAssertFalse([[wrongAnswers objectAtIndex:index] isEqualToString:chosenAnswer],
                  @"Wrong answer %@ should not be equal to chosen answer %@",
                  [wrongAnswers objectAtIndex:index], chosenAnswer);
    }
    
    // Test for "Medieval" as the correct answer. Should return "1960's and "Summer"
    [_themeManager generateWrongAnswersFor:@"Medieval" numWrongAnswers:2];
    NSString * wrongAnswer1 = [_themeManager.wrongAnswers objectAtIndex:0];
    NSString * wrongAnswer2 = [_themeManager.wrongAnswers objectAtIndex:1];
    STAssertTrue([wrongAnswer1 isEqualToString:@"1960's"] ||
                 [wrongAnswer1 isEqualToString:@"Summer"], 
                 @"Answer should be 1960's or Summer, but was %@", wrongAnswer1);
    STAssertTrue([wrongAnswer2 isEqualToString:@"1960's"] ||
                 [wrongAnswer2 isEqualToString:@"Summer"], 
                 @"Answer should be 1960's or Summer, but was %@", wrongAnswer2);
}

#pragma mark - Helper functions

- (void) helperTestThemeCount:(int)count expectedResult:(int)expected
{
    [_themeManager generateThemes:count];
    NSArray * generatedThemes = [_themeManager themeChoices];

    STAssertTrue(generatedThemes.count == expected, @"Count should be %d, but was %d", expected, generatedThemes.count);
}

@end
