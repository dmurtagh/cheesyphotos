//
//  GameRoundConstants.m
//  WhatIsThat
//
//  Created by Damien Murtagh on 7/6/12.
//  Copyright (c) 2012 Playfirst. All rights reserved.
//

#import "GameConstants.h"


// String constants which define the states
NSString * const kGameBootstrap                      = @"Bootstrap";
NSString * const kGameStateIdle                      = @"Idle";
NSString * const kGameStateCleanup					 = @"Cleanup";

// Game Creation / Uploading states
NSString * const kGameStateZippingFiles              = @"ZippingFiles";
NSString * const kConvertingFbIdToPfId               = @"ConvertingFbIdToPfId";
NSString * const kGameStateUploadingToS3             = @"UploadingToS3";
NSString * const kGameStateSendSQSMessage            = @"SendingGameReadyMessage";
NSString * const kGameStateSendSuccess               = @"SendCompletedSuccessfully";

// Download / Guessing states
NSString * const kGameStateDownloadingFromS3         = @"DownloadingFromS3";
NSString * const kGameStateUnZippingFiles            = @"UnzippingFiles";
NSString * const kGameStateGuessing                  = @"GameStateGuessing";

// State Change Notification keys
NSString * const kEventKeyCurrentState      		 = @"EventKeyCurrentState";
NSString * const kEventKeyWithError                  = @"EventKeyWithError";
NSString * const kEventKeyNextState         		 = @"EventKeyNextState";
NSString * const kEventKeyPfId                       = @"EventKeyPfId";


// NSNotificationCenter Event Name
NSString * const kGameStateRoundEventName = @"GameRoundStateEvent";
