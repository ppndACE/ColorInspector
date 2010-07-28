//
//  NotificationSender.h
//  ImageViewerTest
//
//  Created by boreal-kiss.com on 10/07/22.
//  Copyright 2010 boreal-kiss.com. All rights reserved.
//

#import <Cocoa/Cocoa.h>

extern NSString * const ImageDidDropNotification;
extern NSString * const ColorDidGetNotification;

@interface NotificationSender : NSObject {

}

+(void)postNotificationwithName:(NSString *)aName object:(id)anObject;
@end
