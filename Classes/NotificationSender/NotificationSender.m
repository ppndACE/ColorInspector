//
//  NotificationSender.m
//  ImageViewerTest
//
//  Created by boreal-kiss.com on 10/07/22.
//  Copyright 2010 boreal-kiss.com. All rights reserved.
//

#import "NotificationSender.h"

//Public
NSString * const ImageDidDropNotification	= @"imageDidDrop";
NSString * const ColorDidGetNotification	= @"colorDidGet";

@implementation NotificationSender

+(void)postNotificationwithName:(NSString *)aName object:(id)anObject{
	NSNotification *aNotification = [NSNotification notificationWithName:aName object:anObject];
	[[NSNotificationCenter defaultCenter] postNotification:aNotification];
}

@end
