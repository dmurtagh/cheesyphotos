//
//  CustomImagePickerViewController.m
//  CustomImagePickerViewController
//

#import "CustomImagePickerViewController.h"

@implementation CustomImagePickerViewController

@synthesize delegate = _delegate;

- (id)initWithCoder:(NSCoder *)aDecoder
{
	if ((self = [super initWithCoder:aDecoder]))
	{
        _imageAssetsInAlbum = nil;
        _imageAssetsInAlbum = [[NSMutableArray alloc] init];
        _assetLib = nil;
        //NSLog(@"init CustomImagePicker");
	}
	return self;
}

- (void)viewDidLoad {
	
    // TODO: We should have an activity indicator cause the enumerating the SavedPhotos may take a while
//    UIActivityIndicatorView* activityIndicator = [[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle: UIActivityIndicatorViewStyleGray] autorelease];
//    
//    activityIndicator.center = self.view.center;
//    NSLog(@"Center %f %f", activityIndicator.center.x, activityIndicator.center.y);
//    [activityIndicator startAnimating];
//
//    [self.view addSubview: activityIndicator];
//

    //Block for checking all the photos in the device.
    
    // TODO(??): we can push the enumeration to separate thread.
    void (^assetEnumerator) (ALAsset *, NSUInteger, BOOL *) = ^(ALAsset *result, NSUInteger index, BOOL * stop) {
        if(result != nil) 
        {
            //NSLog(@"See Assets: %@", result);
            [_imageAssetsInAlbum addObject:result];
        }
    };
    
    void (^assetGroupEnumerator)(ALAssetsGroup *, BOOL *) =  ^(ALAssetsGroup *group, BOOL *stop) {
        if(group != nil) {
            [group enumerateAssetsUsingBlock:assetEnumerator];
        }
        [self performSelectorOnMainThread:@selector(reloadPickerView) withObject:nil waitUntilDone:YES];
    };
    
    _assetLib = [[ALAssetsLibrary alloc]init];
    [_assetLib enumerateGroupsWithTypes:ALAssetsGroupSavedPhotos
                        usingBlock: assetGroupEnumerator 
                         failureBlock:^(NSError *error){
                             NSLog(@"A problem has occurred");
                         }];
    
    [super viewDidLoad];
}

-(void)reloadPickerView {
	
    // TODO: Need to create a Label to tell player there is no photos in the saved library
    
	// Create view
    UIScrollView *view = [[UIScrollView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	
    [view setBackgroundColor:[UIColor blackColor]];

    
    
	int row = 0;
	int column = 0;
	for(int i = 0; i < _imageAssetsInAlbum.count; ++i) {
		
        ALAsset *asset = [_imageAssetsInAlbum objectAtIndex:i];
        
        // we use the thumbnail image.
		UIImage *thumb = [UIImage imageWithCGImage:[asset thumbnail]];
		UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
		button.frame = CGRectMake(column*100+24, row*80+10, 64, 64);
		[button setImage:thumb forState:UIControlStateNormal];
		[button addTarget:self 
				   action:@selector(buttonClicked:) 
		 forControlEvents:UIControlEventTouchUpInside];
		button.tag = i; 
		[view addSubview:button];
		
		if (column == 2) {
			column = 0;
			row++;
		} else {
			column++;
		}
		
	}
	
	[view setContentSize:CGSizeMake(320, (row+1) * 80 + 10)];
	
	self.view = view;
	
	// Create cancel button
	UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] 
									 initWithTitle:@"Cancel" 
									 style:UIBarButtonItemStylePlain 
									 target:self 
									 action:@selector(cancel:)];
	self.navigationItem.leftBarButtonItem = cancelButton;
}

- (IBAction)buttonClicked:(id)sender {
	UIButton *button = (UIButton *)sender;

    ALAsset *selectedAsset = [_imageAssetsInAlbum objectAtIndex:button.tag];
    
    NSLog(@"See Assets: %@", selectedAsset); 
    UIImage * selectImage = [[UIImage alloc] initWithCGImage:[selectedAsset defaultRepresentation].fullResolutionImage];
    [self.delegate CustomImagePickerViewControllerDidButtonClick:self selectedImage:selectImage];

}

- (IBAction)cancel:(id)sender {
    [self.delegate CustomImagePickerViewControllerDidCancel:self];
 
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    
    //NSLog(@"CustomImagePickerViewController deallocate");
    _imageAssetsInAlbum = nil;
    _assetLib = nil;
}

@end
