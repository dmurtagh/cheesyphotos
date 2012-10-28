//
//  CameraOrAlbumViewController.h
//  StoryboardTest
//
//  Created by Damien Murtagh on 5/21/12.
//  Copyright (c) 2012 Playfirst. All rights reserved.
//

@interface CameraOrAlbumViewController : UIViewController < UINavigationControllerDelegate, UIImagePickerControllerDelegate>
{
    UIImage *_selectedImage;
}

- (IBAction)selectPhotoFromLib:(id)sender;
- (IBAction)takePhoto:(id)sender;

@end
