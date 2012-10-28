//
//  BeforeFilter.h
//  StoryboardTest
//
//  Created by Damien Murtagh on 5/22/12.
//  Copyright (c) 2012 Playfirst. All rights reserved.
//

#import "AssetsLibrary/AssetsLibrary.h"

@interface BeforeFilter : UIViewController
{
    // List of filters/ effects
    NSMutableArray *_filters; 
}

@property (nonatomic, strong) UIImage * selectedImage;

// FaceApp Code
@property (nonatomic, strong) IBOutlet UIImageView * frontFacingImageView;
@property (nonatomic, strong) IBOutlet UIImageView * sideFacingImageView;


@end
