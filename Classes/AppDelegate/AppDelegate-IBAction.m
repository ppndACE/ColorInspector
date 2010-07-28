//
//  AppDelegate-IBAction.m
//  ColorInspector
//
//  Created by boreal-kiss.com on 10/07/27.
//  Copyright 2010 boreal-kiss.com. All rights reserved.
//

#import "AppDelegate-IBAction.h"


@implementation AppDelegate (_IBAction)

-(IBAction)openDocument:(id)sender{
	NSLog(@"%s", __FUNCTION__);
	
	[self.documentManager openDocument:sender];
}

-(IBAction)newDocument:(id)sender{
	NSLog(@"%s", __FUNCTION__);
	
	//NSLog(@"manager: %@", self.documentManager);
	
	[self.documentManager newDocument:sender];
}

-(IBAction)zoomIn:(id)sender{
	NSLog(@"%s", __FUNCTION__);
	
	NSWindowController *wc = [[NSApp keyWindow] windowController];
	if ([wc respondsToSelector:@selector(zoomIn:)]){
		[wc zoomIn:self];
	}
}

-(IBAction)zoomOut:(id)sender{
	NSLog(@"%s", __FUNCTION__);
	
	NSWindowController *wc = [[NSApp keyWindow] windowController];
	if ([wc respondsToSelector:@selector(zoomOut:)]){
		[wc zoomOut:self];
	}
}

-(IBAction)zoomEven:(id)sender{
	NSLog(@"%s", __FUNCTION__);
	
	NSWindowController *wc = [[NSApp keyWindow] windowController];
	if ([wc respondsToSelector:@selector(zoomEven:)]){
		[wc zoomEven:self];
	}
}

-(IBAction)removeObject:(id)sender{
	NSLog(@"%s", __FUNCTION__);
	
	[self.documentManager removeObject:sender];
}


@end
