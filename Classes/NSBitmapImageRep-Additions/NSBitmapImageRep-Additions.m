//
//  NSBitmapImageRep-Additions.m
//  ImageViewerTest
//
//  Created by boreal-kiss.com on 10/07/22.
//  Copyright 2010 boreal-kiss.com. All rights reserved.
//

#import "NSBitmapImageRep-Additions.h"

//Private
static const NSInteger DefaultBitsPerSample		= 8;
static const NSInteger DefaultSamplesPerPixel	= 4;
static const NSInteger BitsPerByte				= 8;

@implementation NSBitmapImageRep (_Additions)

+(NSBitmapImageRep *)imageRepWithImage:(NSImage *)anImage{
	return [[[[self class] alloc] initWithImage:anImage] autorelease];
}

+(NSBitmapImageRep *)imageRepWithPixelsWide:(NSInteger)width pixelsHigh:(NSInteger)height hasAlpha:(BOOL)alpha{
	return [[[[self class] alloc] initWithPixelsWide:width pixelsHigh:height hasAlpha:alpha] autorelease];
}

-(id)initWithPixelsWide:(NSInteger)width pixelsHigh:(NSInteger)height hasAlpha:(BOOL)alpha{
	return [self initWithBitmapDataPlanes:NULL 
							   pixelsWide:width 
							   pixelsHigh:height
							bitsPerSample:DefaultBitsPerSample 
						  samplesPerPixel:DefaultSamplesPerPixel 
								 hasAlpha:alpha 
								 isPlanar:NO 
						   colorSpaceName:NSDeviceRGBColorSpace 
							  bytesPerRow:0
							 bitsPerPixel:0];
}

-(id)initWithImage:(NSImage *)anImage{
	self = [self initWithPixelsWide:[anImage size].width pixelsHigh:[anImage size].height hasAlpha:YES];
	
	if (self){
		[self setImage:anImage];
		return self;
	}
	
	return nil;
}

-(NSImage *)image{
	int w = [self pixelsWide];
	int h = [self pixelsHigh];
	int bpr = [self bytesPerRow];
	int bpp = [self bitsPerPixel];
	int bps = [self bitsPerSample];
	
	CGDataProviderRef dataProvider = CGDataProviderCreateWithData(NULL, [self bitmapData], h * bpr, NULL);
	CGImageRef cgImage = CGImageCreate(w, 
									   h, 
									   bps, 
									   bpp, 
									   bpr, 
									   [[self colorSpace] CGColorSpace], 
									   kCGImageAlphaPremultipliedLast, 
									   dataProvider, 
									   NULL, 
									   YES, 
									   kCGRenderingIntentDefault);
	
	CGDataProviderRelease(dataProvider);
	NSImage *nsImage = [[[NSImage alloc] initWithCGImage:cgImage size:NSZeroSize] autorelease];
	CGImageRelease(cgImage);
	
	return nsImage;
}


-(void)setImage:(NSImage *)anImage{
	int w = [self pixelsWide];
	int h = [self pixelsHigh];
	int bpr = [self bytesPerRow];
	int bps = [self bitsPerSample];
	
	CGImageRef cgImage = [anImage CGImageForProposedRect:NULL context:nil hints:nil];
	
	CGContextRef context = CGBitmapContextCreate([self bitmapData], 
												 w, 
												 h, 
												 bps, 
												 bpr, 
												 [[self colorSpace] CGColorSpace], 
												 kCGImageAlphaPremultipliedLast);
	
	CGContextDrawImage(context, CGRectMake(0, 0, w, h), cgImage);
	CGContextRelease(context);
}

@end
