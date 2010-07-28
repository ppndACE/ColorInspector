//
//  DraggingView-NSDraggingDestination.m
//  ImageViewerTest
//
//  Created by boreal-kiss.com on 10/07/22.
//  Copyright 2010 boreal-kiss.com. All rights reserved.
//

#import "DraggingView-NSDraggingDestination.h"
#import "NotificationSender.h"

@implementation DraggingView (_NSDraggingDestination)

- (NSDragOperation)draggingEntered:(id < NSDraggingInfo >) sender{
	//NSLog(@"%s", __FUNCTION__);
	
	self.highlighted = YES;
	return NSDragOperationCopy;
}

- (void)draggingExited:(id < NSDraggingInfo >) sender{
	//NSLog(@"%s", __FUNCTION__);
	
	self.highlighted = NO;
}

- (BOOL)prepareForDragOperation:(id < NSDraggingInfo >) sender{
	//NSLog(@"%s", __FUNCTION__);
	
	return YES;
}

- (BOOL)performDragOperation:(id < NSDraggingInfo >) sender{
	//NSLog(@"%s", __FUNCTION__);
	
	NSPasteboard *pb = [sender draggingPasteboard];

	if ([NSImage canInitWithPasteboard:pb]){
		self.filePath = [[pb propertyListForType:NSFilenamesPboardType] lastObject];
		[NotificationSender postNotificationwithName:ImageDidDropNotification object:self];
		return YES;
	}
	
	return NO;
}

- (void)concludeDragOperation:(id < NSDraggingInfo >) sender{
	//NSLog(@"%s", __FUNCTION__);
	
	self.highlighted = NO;
}

@end
