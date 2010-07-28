//
//  ImageViewerWC-NSWindowDelegate.m
//  ColorInspector
//
//  Created by boreal-kiss.com on 10/07/26.
//  Copyright 2010 boreal-kiss.com. All rights reserved.
//

#import "ImageViewerWC-NSWindowDelegate.h"


@implementation ImageViewerWC (_NSWindowDelegate)

- (void)windowWillClose:(NSNotification *) notification{
	NSLog(@"%s", __FUNCTION__);
	
	[NSApp sendAction:@selector(removeObject:) to:nil from:self];
}

@end