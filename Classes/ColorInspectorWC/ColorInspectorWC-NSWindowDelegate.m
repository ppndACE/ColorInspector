//
//  ColorInspectorWC-NSWindowDelegate.m
//  ColorInspector
//
//  Created by boreal-kiss.com on 10/07/26.
//  Copyright 2010 boreal-kiss.com. All rights reserved.
//

#import "ColorInspectorWC-NSWindowDelegate.h"


@implementation ColorInspectorWC (_NSWindowDelegate)

- (void)windowWillClose:(NSNotification *) notification{
	NSLog(@"%s", __FUNCTION__);
	//[NSApp terminate:nil];
}

- (BOOL)windowShouldClose:(id) sender{
	return NO;
}

@end
