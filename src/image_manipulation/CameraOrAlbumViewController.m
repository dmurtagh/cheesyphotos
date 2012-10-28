//
//  CameraOrAlbumViewController.m
//  StoryboardTest
//
//  Created by Damien Murtagh on 5/21/12.
//  Copyright (c) 2012 Playfirst. All rights reserved.
//

#import "CameraOrAlbumViewController.h"
#import "BeforeFilter.h"

@interface CameraOrAlbumViewController ()

@end

@implementation CameraOrAlbumViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) 
    {
        // Custom initialization
        _selectedImage = nil;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    _selectedImage = nil;
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{ 
    if ([segue.identifier isEqualToString:@"ShowImage"])
	{
        BeforeFilter *beforeFilter = (BeforeFilter *)segue.destinationViewController;
        beforeFilter.selectedImage = _selectedImage;
	}
}
- (IBAction)selectPhotoFromLib:(id)sender 
{
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) 
    {
        [imagePicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
        
        [imagePicker setDelegate:self];
        [self presentModalViewController:imagePicker animated:YES];
    }
}


- (IBAction)takePhoto:(id)sender 
{
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) 
    {
        [imagePicker setSourceType:UIImagePickerControllerSourceTypeCamera];
   
        [imagePicker setDelegate:self];
        [self presentModalViewController:imagePicker animated:YES];
    }
}

-(void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    if(image.imageOrientation == UIImageOrientationUp) 
    {
        NSLog(@"Portrait");
    }
    else if(image.imageOrientation == UIImageOrientationDown) 
    {
        NSLog(@"Down");
    }
    else if(image.imageOrientation == UIImageOrientationRight) 
    {
        NSLog(@"Right");
    }
    else if(image.imageOrientation == UIImageOrientationLeft) 
    {
        NSLog(@"Left");
    }
    
    _selectedImage = image;
    [self dismissViewControllerAnimated:YES completion:^(){
        [self performSegueWithIdentifier:@"ShowImage" sender:self];
    }];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker 
{
    [self dismissModalViewControllerAnimated:YES];
}
@end
