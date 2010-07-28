//
//  ImageViewerWC-NSNotification.m
//  ImageViewerTest
//
//  Created by boreal-kiss.com on 10/07/22.
//  Copyright 2010 boreal-kiss.com. All rights reserved.
//

#import "ImageViewerWC-NSNotification.h"
#import "ImageViewerWC-Resize.h"
#import "NotificationSender.h"
#import "DraggingView.h"

@implementation ImageViewerWC (_NSNotification)

-(void)_subscribe{
	[[NSNotificationCenter defaultCenter] addObserver:self 
											 selector:@selector(_notificationHandler:) 
												 name:ImageDidDropNotification 
											   object:nil];
}

-(void)_unsubscribe{
	[[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void)_notificationHandler:(NSNotification *)aNotification{
	//NSLog(@"%s", __FUNCTION__);
	
	DraggingView *theView = (DraggingView *)[aNotification object];
	
	//The notification must come from a subview in the same window.
	if ([theView window] == [self window]){
		[self loadImageWithPath:theView.filePath];
	}
}

	 
@end
