//
//  ImageViewerWC-NSNotification.h
//  ImageViewerTest
//
//  Created by boreal-kiss.com on 10/07/22.
//  Copyright 2010 boreal-kiss.com. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "ImageViewerWC.h"

@interface ImageViewerWC (_NSNotification)

-(void)_subscribe;
-(void)_unsubscribe;
-(void)_notificationHandler:(NSNotification *)aNotification;
@end
