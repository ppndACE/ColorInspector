//
//  ImageViewerWC-Resize.m
//  ImageViewerTest
//
//  Created by boreal-kiss.com on 10/07/23.
//  Copyright 2010 boreal-kiss.com. All rights reserved.
//

#import "ImageViewerWC-Resize.h"
#import "NSBitmapImageRep-Additions.h"

//Private
static const CGFloat Magnifier			= 1.2;
static const CGFloat MinimumPixelSize	= 20.0;
static const CGFloat MaximumPixelSize	= 10000.0;

//Private
@interface ImageViewerWC ()
-(void)_setImage:(NSImage *)anImage width:(CGFloat)w height:(CGFloat)h;
@end

@implementation ImageViewerWC (_Resize)

-(IBAction)zoomIn:(id)sender{
	//NSLog(@"%s", __FUNCTION__);
	
	CGFloat w = [[_flippedImageView image] size].width * Magnifier;
	CGFloat h = [[_flippedImageView image] size].height * Magnifier;
	
	if (w < MaximumPixelSize && h < MaximumPixelSize){
		[self _setImage:_originalImage width:w height:h];
	}
}

-(IBAction)zoomOut:(id)sender{
	//NSLog(@"%s", __FUNCTION__);
	
	CGFloat w = [[_flippedImageView image] size].width / Magnifier;
	CGFloat h = [[_flippedImageView image] size].height / Magnifier;
	
	if (w > MinimumPixelSize && h > MinimumPixelSize){
		[self _setImage:_originalImage width:w height:h];
	}
}

-(IBAction)zoomEven:(id)sender{
	//NSLog(@"%s", __FUNCTION__);
	
	CGFloat w = [_originalImage size].width;
	CGFloat h = [_originalImage size].height;
	
	[self _setImage:_originalImage width:w height:h];
}

#pragma mark -
#pragma mark Private

-(void)_setImage:(NSImage *)anImage width:(CGFloat)w height:(CGFloat)h{
	//NSLog(@"%s", __FUNCTION__);
	
	self.imageRep = [NSBitmapImageRep imageRepWithPixelsWide:w pixelsHigh:h hasAlpha:YES];
	[_imageRep setImage:_originalImage];
	[_flippedImageView setImage:[_imageRep image]];
	
	NSRect frame = [_flippedImageView frame];
	frame.size = NSMakeSize(w, h);
	[_flippedImageView setFrame:frame];
}
@end
