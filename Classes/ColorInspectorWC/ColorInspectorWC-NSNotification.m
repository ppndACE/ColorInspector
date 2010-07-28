//
//  ColorInspectorWC-NSNotification.m
//  ColorInspector
//
//  Created by boreal-kiss.com on 10/07/26.
//  Copyright 2010 boreal-kiss.com. All rights reserved.
//

#import "ColorInspectorWC-NSNotification.h"
#import "NotificationSender.h"

//Private
static const NSInteger RIntLabelTag		= 201;
static const NSInteger GIntLabelTag		= 202;
static const NSInteger BIntLabelTag		= 203;
static const NSInteger RHexLabelTag		= 301;
static const NSInteger GHexLabelTag		= 302;
static const NSInteger BHexLabelTag		= 303;
static const NSInteger HexLabelTag		= 304;

@implementation ColorInspectorWC (_NSNotification)

-(void)_subscribe{
	[[NSNotificationCenter defaultCenter] addObserver:self 
											 selector:@selector(_notificationHandler:) 
												 name:ColorDidGetNotification 
											   object:nil];
}

-(void)_unsubscribe{
	[[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void)_notificationHandler:(NSNotification *)aNotification{
	//NSLog(@"%s", __FUNCTION__);
	
	NSColor *selectedColor = (NSColor *)[aNotification object];
	[_colorSampleView setFillColor:selectedColor];
	
	static CGFloat c[4];
	[selectedColor getComponents:c];
	
	int r = c[0] * 255;
	int g = c[1] * 255;
	int b = c[2] * 255;
	
	[self _setLabelText:[[NSNumber numberWithInt:r] stringValue] withViewTag:RIntLabelTag];
	[self _setLabelText:[[NSNumber numberWithInt:g] stringValue] withViewTag:GIntLabelTag];
	[self _setLabelText:[[NSNumber numberWithInt:b] stringValue] withViewTag:BIntLabelTag];
	[self _setLabelText:[NSString stringWithFormat:@"%02X", r] withViewTag:RHexLabelTag];
	[self _setLabelText:[NSString stringWithFormat:@"%02X", g] withViewTag:GHexLabelTag];
	[self _setLabelText:[NSString stringWithFormat:@"%02X", b] withViewTag:BHexLabelTag];
	
	NSString *hexString = [NSString stringWithFormat:@"%02X%02X%02X", r, g, b];
	[self _setLabelText:hexString withViewTag:HexLabelTag];
}

-(void)_setLabelText:(NSString *)aText withViewTag:(NSInteger)aTag{
	NSTextField *textFielld = [[[self window] contentView] viewWithTag:aTag];
	[textFielld setTitleWithMnemonic:aText];
}

@end
