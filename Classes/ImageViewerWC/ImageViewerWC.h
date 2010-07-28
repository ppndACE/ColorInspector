//
//  ImageViewerWC.h
//  ImageViewerTest
//
//  Created by boreal-kiss.com on 10/07/21.
//  Copyright 2010 boreal-kiss.com. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class FlippedImageView;

@interface ImageViewerWC : NSWindowController <NSWindowDelegate>{
	IBOutlet FlippedImageView *_flippedImageView;
	IBOutlet NSTextField *_instructionLabel;
	
	NSImage *_originalImage;
	NSBitmapImageRep *_imageRep;
	NSString *_documentPath;
}
@property (nonatomic, assign) FlippedImageView *flippedImageView;
@property (nonatomic, assign) NSTextField *instructionLabel;
@property (nonatomic, copy) NSImage *originalImage;
@property (nonatomic, retain) NSBitmapImageRep *imageRep;
@property (nonatomic, copy) NSString *documentPath;

+(NSArray *)documentExtensions;

/**
 * The designated initializer.
 */
-(id)initWithPath:(NSString *)aPath;
-(void)loadImageWithPath:(NSString *)aPath;
@end

#import "ImageViewerWC-Resize.h"