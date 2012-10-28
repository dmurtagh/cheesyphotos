//
//  CustomImagePickerViewController.h
//  CustomImagePickerViewController
//
//

#import <AssetsLibrary/AssetsLibrary.h>

@class CustomImagePickerViewController;

@protocol CustomImagePickerViewControllerDelegate <NSObject>
- (void)CustomImagePickerViewControllerDidCancel: (CustomImagePickerViewController *)controller;
- (void)CustomImagePickerViewControllerDidButtonClick: (CustomImagePickerViewController *)controller selectedImage:(UIImage *)selectedAsset;
@end

@interface CustomImagePickerViewController : UIViewController {
	
    NSMutableArray  *_imageAssetsInAlbum;
    ALAssetsLibrary *_assetLib;
    
}

@property (nonatomic, weak) id <CustomImagePickerViewControllerDelegate> delegate;

- (IBAction)buttonClicked:(id)sender;
- (IBAction)cancel:(id)sender;

@end
