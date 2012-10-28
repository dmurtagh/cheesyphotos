//
//  BeforeFilter.m
//  StoryboardTest
//
//  Created by Damien Murtagh on 5/22/12.
//  Copyright (c) 2012 Playfirst. All rights reserved.
//

#import "ApplyMask.h"
#import "Utilities.h"
#import "AppDelegate.h"

#define MAX_NUMBER_OF_BRUSH 3

@interface ApplyMask ()
{
    CGPoint _touchDownPoint;
    CGAffineTransform _touchDownTransform;
    
    CGPoint _maskImageCenter;
}

@end

@implementation ApplyMask

- (id)initWithCoder:(NSCoder *)aDecoder
{
	if ((self = [super initWithCoder:aDecoder]))
	{
	}
	return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    [_sideFacingImageView setImage:_selectedImage];
    _maskImageCenter = _sideFacingImageMask.center;
    
    // Set up a pinch gesture recognizer
    UIPinchGestureRecognizer * pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handlePinchGesture:)];
    [self.view addGestureRecognizer:pinch];
}

- (void)handlePinchGesture:(id)sender
{
    UIPinchGestureRecognizer * pinch = (UIPinchGestureRecognizer*)sender;
    _sideFacingImageMask.transform = CGAffineTransformScale(_touchDownTransform, pinch.scale, pinch.scale);
    
    
    NSLog(@"Scale = %4.2f", pinch.scale);
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    _touchDownPoint = [touch locationInView:self.view];
    
    _touchDownTransform = _sideFacingImageMask.transform;
    
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInView:self.view];
    _sideFacingImageMask.center = CGPointMake(_maskImageCenter.x + touchPoint.x - _touchDownPoint.x,
                                               _maskImageCenter.y + touchPoint.y - _touchDownPoint.y);
    
    
    NSLog(@"touchesMoved to (%4.2f,%4.2f)", touchPoint.x, touchPoint.y);
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    _maskImageCenter = _sideFacingImageMask.center;
    _touchDownTransform = _sideFacingImageMask.transform;
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
}

- (void)handlePanGesture:(UIGestureRecognizer *)sender
{
    UIPanGestureRecognizer * panGestureRecognizer = (UIPanGestureRecognizer*) sender;
    CGPoint pan = [panGestureRecognizer translationInView:self.view];
    CGPoint location = [panGestureRecognizer locationInView:self.view];
    
    
    
    NSLog(@"Moved (%4.2f, %4.2f)", pan.x, pan.y);
    NSLog(@"Location (%4.2f, %4.2f)", location.x, location.y);
}

- (void)viewDidUnload
{
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
