//
//  ImageViewerWC-NSResponder.m
//  ImageViewerTest
//
//  Created by boreal-kiss.com on 10/07/23.
//  Copyright 2010 boreal-kiss.com. All rights reserved.
//

#import "ImageViewerWC-NSResponder.h"
#import "NotificationSender.h"

@implementation ImageViewerWC (_NSResponder)

- (void)mouseDown:(NSEvent *) theEvent{
	NSPoint p = [theEvent locationInWindow];
	NSPoint localP = [_flippedImageView convertPoint:p fromView:nil];
	
	NSColor *aColor = [self.imageRep colorAtX:localP.x y:localP.y];
	[NotificationSender postNotificationwithName:ColorDidGetNotification object:aColor];
}

- (void)mouseDragged:(NSEvent *) theEvent{
	[self mouseDown:theEvent];
}

@end
