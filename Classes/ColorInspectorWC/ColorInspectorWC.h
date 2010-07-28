//
//  ColorInspectorWC.h
//  ColorInspector
//
//  Created by boreal-kiss.com on 10/07/26.
//  Copyright 2010 boreal-kiss.com. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class ColorSampleView;

@interface ColorInspectorWC : NSWindowController {
	IBOutlet ColorSampleView *_colorSampleView;
}
@property (nonatomic, assign) ColorSampleView *colorSampleView;

@end
