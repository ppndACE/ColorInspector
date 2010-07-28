//
//  ColorSampleView.m
//  ImageViewerTest
//
//  Created by boreal-kiss.com on 10/07/22.
//  Copyright 2010 boreal-kiss.com. All rights reserved.
//

#import "ColorSampleView.h"


@implementation ColorSampleView
@synthesize fillColor = _fillColor;
@synthesize strokeColor = _strokeColor;

-(void)awakeFromNib{
	self.fillColor = [NSColor whiteColor];
	self.strokeColor = [NSColor blackColor];
}

- (void)drawRect:(NSRect)dirtyRect {
    [_fillColor set];
	[NSBezierPath fillRect:[self bounds]];
	
	[_strokeColor set];
	[NSBezierPath strokeRect:[self bounds]];
}

-(void)dealloc{
	self.fillColor = nil;
	self.strokeColor = nil;
	[super dealloc];
}

#pragma mark -
#pragma mark Accessors

-(void)setFillColor:(NSColor *)aColor{
	if (_fillColor != aColor){
		[_fillColor release];
		_fillColor = [aColor retain];
		[self setNeedsDisplay:YES];
	}
}

-(void)setStrokeColor:(NSColor *)aColor{
	if (_strokeColor != aColor){
		[_strokeColor release];
		_strokeColor = [aColor retain];
		[self setNeedsDisplay:YES];
	}
}

@end
