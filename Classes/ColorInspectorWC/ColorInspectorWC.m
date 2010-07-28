//
//  ColorInspectorWC.m
//  ColorInspector
//
//  Created by boreal-kiss.com on 10/07/26.
//  Copyright 2010 boreal-kiss.com. All rights reserved.
//

#import "ColorInspectorWC.h"
#import "ColorInspectorWC-NSNotification.h"
#import "ColorInspectorWC-NSWindowDelegate.h"

//Private
//static NSString * const NibName = @"ColorInspectorWC";
static NSString * const NibName = @"ColorInspectorWC-NSPanel";

//Private
@interface ColorInspectorWC ()
-(void)_setup;
@end

@implementation ColorInspectorWC
@synthesize colorSampleView = _colorSampleView;

-(id)init{
	if (self = [super initWithWindowNibName:NibName]) {
		[self _setup];
	}
	return self;
}

-(void)windowDidLoad{
	NSRect wf = [[self window] frame];
	NSRect vf = [[NSScreen mainScreen] visibleFrame];
	[[self window] setFrameOrigin:NSMakePoint(NSMaxX(vf) - wf.size.width, NSMaxY(vf))];
}

-(void)dealloc{
	[self _unsubscribe];
	self.colorSampleView = nil;
	[super dealloc];
}

#pragma mark -
#pragma mark Private

-(void)_setup{
	[self _subscribe];
	
	[[self window] setDelegate:self];
}

@end
