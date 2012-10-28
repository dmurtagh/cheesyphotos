//
//  Utilities.h
//  WhatIsThat
//
//  Created by Damien Murtagh on 7/6/12.
//  Copyright (c) 2012 Playfirst. All rights reserved.
//

@interface Utilities : NSObject

// File system methods
+(NSString*)getStagingFolder;
+(NSString*)getArchivedGamesFolder;

// Zip file methods
+(BOOL)zipDirectoryContents:(NSString*)directoryPath toFile:(NSString*)zipFilePath;
+(BOOL)unzipFile:(NSString*)zipFilePath toDirectory:(NSString*)directoryPath;

// Id methods
+(NSString*)generateUniqueId;

// Timer methods
+(int64_t)getElapsedTimeMillis;
+(NSString*)formatSendTime:(NSTimeInterval)time;

@end
