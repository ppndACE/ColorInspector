//
//  ColorSampleView.h
//  ImageViewerTest
//
//  Created by boreal-kiss.com on 10/07/22.
//  Copyright 2010 boreal-kiss.com. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface ColorSampleView : NSView {
	NSColor *_fillColor;
	NSColor *_strokeColor;
}
@property (nonatomic, retain) NSColor *fillColor;
@property (nonatomic, retain) NSColor *strokeColor;

@end
