//
//  ImageViewerWC-Accessors.m
//  ColorInspector
//
//  Created by boreal-kiss.com on 10/07/27.
//  Copyright 2010 boreal-kiss.com. All rights reserved.
//

#import "ImageViewerWC-Accessors.h"


@implementation ImageViewerWC (_Accessors)

-(void)setOriginalImage:(NSImage *)anImage{
	NSLog(@"%s", __FUNCTION__);
	
	if (_originalImage != anImage){
		[_originalImage release];
		_originalImage = [anImage copyWithZone:[anImage zone]];
		
		[_instructionLabel setHidden:YES];
	}
}

@end
