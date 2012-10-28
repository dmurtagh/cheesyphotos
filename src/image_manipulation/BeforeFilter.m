//
//  BeforeFilter.m
//  StoryboardTest
//
//  Created by Damien Murtagh on 5/22/12.
//  Copyright (c) 2012 Playfirst. All rights reserved.
//

#import "BeforeFilter.h"
#import "Utilities.h"
#import "AppDelegate.h"

#define MAX_NUMBER_OF_BRUSH 3

@interface BeforeFilter ()
{
    CGPoint _touchDownPoint;
    CGPoint _maskImageCenter;
}

@end

@implementation BeforeFilter

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
    [_frontFacingImageView setImage:_selectedImage];
    _maskImageCenter = _frontFacingImageView.center;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    _touchDownPoint = [touch locationInView:self.view];
    
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInView:self.view];
    _frontFacingImageView.center = CGPointMake(_maskImageCenter.x + touchPoint.x - _touchDownPoint.x,
                                               _maskImageCenter.y + touchPoint.y - _touchDownPoint.y);
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    _maskImageCenter = _frontFacingImageView.center;
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
