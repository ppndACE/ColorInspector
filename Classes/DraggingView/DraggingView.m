//
//  DraggingView.m
//  ImageViewerTest
//
//  Created by boreal-kiss.com on 10/07/22.
//  Copyright 2010 boreal-kiss.com. All rights reserved.
//

#import "DraggingView.h"
#import "ImageViewerWC.h"

@implementation DraggingView
@synthesize highlighted = _highlighted;
@synthesize filePath = _filePath;

//Override
-(void)awakeFromNib{
	[self registerForDraggedTypes:[NSArray arrayWithObjects:NSFilenamesPboardType, nil]];
	
	self.highlighted = NO;
}

-(void)drawRect:(NSRect)dirtyRect{
	if (_highlighted) {
		[[NSColor blueColor] set];
		NSFrameRect([self bounds]);
	}
}

-(void)dealloc{
	self.filePath = nil;
	[super dealloc];
}

#pragma mark -
#pragma mark Accessors

-(void)setHighlighted:(BOOL)yn{
	_highlighted = yn;
	[self setNeedsDisplay:YES];
}

@end
