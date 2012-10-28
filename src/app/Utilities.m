//
//  Utilities.m
//  WhatIsThat
//
//  Created by Damien Murtagh on 7/6/12.
//  Copyright (c) 2012 Playfirst. All rights reserved.
//

#import "Utilities.h"
#import "ZipArchive.h"
#import "mach/mach.h"
#import "mach/mach_time.h"

@implementation Utilities

/**
 * Gets the staging directory path under the documents folder for this app
 *
 * @return Returns an NSString pointer to the path
 */
+(NSString*)getStagingFolder
{
    // Get the path to the temporary file to upload.
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    return [documentsDirectory stringByAppendingPathComponent:@"Staging"];
}

/**
 * Return path to the "archived games" folder.
 *
 * @return Returns an NSString pointer to the path
 */
+(NSString*)getArchivedGamesFolder
{
    // Return path
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *dir = [paths objectAtIndex:0];
    return [dir stringByAppendingPathComponent:@"ArchivedGames"];
}

/**
 * Generate a unique Id for a game round. From the CFFUUID documentation UUIDs are guaranteed to be unique
 * (https://developer.apple.com/library/mac/#documentation/CoreFoundation/Reference/CFUUIDRef/Reference/reference.html):
 * "A UUID is made unique over both space and time by combining a value unique to the computer on which it 
 * was generated-usually the Ethernet hardware address—and a value representing the number of 
 * 100-nanosecond intervals since October 15, 1582 at 00:00:00."
 */
+(NSString*)generateUniqueId
{
    CFUUIDRef theUUID = CFUUIDCreate(NULL);
    CFStringRef string = CFUUIDCreateString(NULL, theUUID);
    CFRelease(theUUID);
    
    // __bridge_transfer makes the static analyzer happy.
    // Transferring responsibility for clean up of "string" to the caller, otherwise, flagged as a leak.
    return (__bridge_transfer NSString*)string;
}

/**
 * Zips the contents of a directory up into a single file
 *
 * @param directoryPath The full path containing the files to be zipped.
 * @param zipFilePath   The full path to the desired output zip file.
 *
 * @return true if the operation succeeded, false if not.
 */
+(BOOL)zipDirectoryContents:(NSString*)directoryPath toFile:(NSString*)zipFilePath
{
    NSFileManager *fm = [NSFileManager defaultManager];
    BOOL isDir = NO;
    
    // If parameters valid
    if (directoryPath && 
        zipFilePath &&
        0 < [zipFilePath length] &&
        [fm fileExistsAtPath: directoryPath isDirectory: &isDir] && isDir)  // Make sure directory exists
    {
        // If directory contains files
        NSArray * dirContents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:directoryPath error:nil];
        if (dirContents && 0 < [dirContents count])
        {
            // Init zip file
            ZipArchive * archive = [[ZipArchive alloc] init];
            [archive CreateZipFile2:zipFilePath];

            // For each file in the directory
            for (NSString * filename in dirContents)
            {
                // Add to the zip file
                NSLog(@"Adding to Zip: %@", filename);
                NSString * filePath = [directoryPath stringByAppendingPathComponent:filename];
                [archive addFileToZip:filePath newname:filename]; 
            }
            
            // Zip files
            return [archive CloseZipFile2];
        }
    }
    
    // Return failure
    return FALSE;
}

/**
 * Zips the contents of a directory up into a single file
 *
 * @param zipFilePath   The full path to the desired output zip file
 * @param directoryPath The target directory where files should be unzipped to.
 *
 * @return true if the operation succeeded, false if not.
 */
+(BOOL)unzipFile:(NSString*)zipFilePath toDirectory:(NSString*)directoryPath
{
    NSFileManager *fm = [NSFileManager defaultManager];
    BOOL isDir = NO;
    
    // If parameters valid
    if (zipFilePath && 
        directoryPath &&
        [fm fileExistsAtPath: zipFilePath   isDirectory: &isDir] && !isDir &&   // Make sure file exists
        [fm fileExistsAtPath: directoryPath isDirectory: &isDir] && isDir)      // Make sure directory exists
    {
        // Setup unzip options
        ZipArchive * archive = [[ZipArchive alloc] init];
        [archive UnzipOpenFile:zipFilePath];
        [archive UnzipFileTo:directoryPath overWrite:YES];
        
        // Unzip file
        return [archive UnzipCloseFile];
    }
    
    // Return failure
    return FALSE;
}

/**
 * Returns 0 on first call and returns the elapsed time in millis (since the previous call) on subsequent calls
 */
+(int64_t)getElapsedTimeMillis
{
    static NSDate * start = nil; 
    if (start != nil)
    {
        NSTimeInterval timeInterval = -[start timeIntervalSinceNow];
        start = [NSDate date];
        return timeInterval * 1000;
    }
    
    start = [NSDate date];
    return 0;
}

/**
 * Returns a string representation of the time in seconds, minutes, hours, days or weeks.
 * Only one type of time unit is ever used and fractions of that interval are ignored.
 */
+(NSString*)formatSendTime:(NSTimeInterval)time
{
    int intervals[] = {1, 60, 60*60, 60*60*24, 60*60*24*7 };
    NSString * units[] = { @"second", @"minute", @"hour", @"day", @"week" };
    
    if (time < 2)
    {
        return @"1 second ago";
    }
    
    int length = sizeof(intervals) / sizeof(int);
    int i = 1;
    while(i < length)
    {
        if(time < intervals[i])
           break;
        
        ++i;
    }
    
    int number = time/intervals[i-1];
    NSString * unit = units[i-1];
    
    if (number == 1)
    {
        return [NSString stringWithFormat:@"1 %@ ago", unit]; 
    }
    else 
    {
        return [NSString stringWithFormat:@"%d %@s ago", number, unit];
    }
}

@end
