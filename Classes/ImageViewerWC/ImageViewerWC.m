//
//  ImageViewerWC.m
//  ImageViewerTest
//
//  Created by boreal-kiss.com on 10/07/21.
//  Copyright 2010 boreal-kiss.com. All rights reserved.
//

#import "ImageViewerWC.h"
#import "ImageViewerWC-NSNotification.h"
#import "ImageViewerWC-Resize.h"

//Private
static NSString * const NibName = @"ImageViewerWC";

@interface ImageViewerWC ()
-(void)_setup;
@end

@implementation ImageViewerWC
@synthesize flippedImageView = _flippedImageView;
@synthesize originalImage = _originalImage;
//@synthesize modifiedImage = _modifiedImage;
@synthesize imageRep = _imageRep;
@synthesize documentPath = _documentPath;
@synthesize instructionLabel = _instructionLabel;

+(NSArray *)documentExtensions{
	return [NSImage imageFileTypes];
}

-(id)initWithPath:(NSString *)aPath{
	if (self = [super initWithWindowNibName:NibName]){
		
		if (aPath){
			self.documentPath = aPath;
			[self loadImageWithPath:_documentPath];
		}
		
		[self _setup];
	}
	return self;
}

-(id)init{
	return [self initWithPath:nil];
}

/**
 * Override. The initializer for flipped image view in xib.
 */
-(void)windowDidLoad{
	if (_originalImage) {
		[_flippedImageView setImage:_originalImage];
		[self zoomEven:self];
	}
}

-(void)loadImageWithPath:(NSString *)aPath{
	//NSLog(@"%s", __FUNCTION__);
	
	[[self window] setTitleWithRepresentedFilename:aPath];
	self.originalImage = [[[NSImage alloc] initWithContentsOfFile:aPath] autorelease];
	[_flippedImageView setImage:_originalImage];
	[self zoomEven:self];
}

-(void)dealloc{
	//NSLog(@"%s", __FUNCTION__);
	
	[self _unsubscribe];
	
	self.flippedImageView = nil;
	self.originalImage = nil;
	self.imageRep = nil;
	self.documentPath = nil;
	self.instructionLabel = nil;
	
	[super dealloc];
}

#pragma mark -
#pragma mark Private

-(void)_setup{
	[self _subscribe];
	[[self window] setDelegate:self];
}

@end
