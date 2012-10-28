//
//  GameRoundConstants.h
//  WhatIsThat
//
//  Created by Damien Murtagh on 7/6/12.
//  Copyright (c) 2012 Playfirst. All rights reserved.
//

/**
 * Enumerate game message operation types.
 */
typedef enum
{
    Game_Message_My_Turn = 0,
    Game_Message_Their_Turn,
    Game_Message_Game_Over
} MessageType;

// General States
extern NSString * const kGameBootstrap;                         // Game is starting up / initializing.
extern NSString * const kGameStateIdle;                         // Game is idle, waiting for user input.
extern NSString * const kGameStateCleanup;						// Clean up any files in the staging directories.

// Game Creation / Uploading states
extern NSString * const kGameStateZippingFiles;                 // Game is busy zipping up files for transfer.
extern NSString * const kConvertingFbIdToPfId;                  // Game is retrieving the PfId for this user.
extern NSString * const kGameStateUploadingToS3;                // Game is busy uploading files to S3.
extern NSString * const kGameStateSendSQSMessage;               // Game is sending the "game ready" message.
extern NSString * const kGameStateSendSuccess;                  // Game has successfully completed the send.

// Download / Guessing states
extern NSString * const kGameStateDownloadingFromS3;            // Game is downloading files from S3.
extern NSString * const kGameStateUnZippingFiles;               // Game is unzipping a downloaded zip file.
extern NSString * const kGameStateGuessing;                     // Guessing portion of the game.

// State Change Notification keys
extern NSString * const kEventKeyCurrentState;      			// Required - Current State. Default behavior is to transition to the next state.
extern NSString * const kEventKeyWithError;         			// Optional - Omission implies no error.
extern NSString * const kEventKeyNextState;         			// Optional - Should only be used when the next state is ambiguous.
extern NSString * const kEventKeyPfId;              			// Optional - Key for sending a PfId to the event handler 


// NSNotificationCenter Event Name
extern NSString * const kGameStateRoundEventName;				// An Notification name is required by NSNotification
                                
                                