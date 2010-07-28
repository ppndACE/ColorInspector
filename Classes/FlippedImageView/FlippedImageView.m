//
//  FlippedImageView.m
//  ImageViewerTest
//
//  Created by boreal-kiss.com on 10/07/22.
//  Copyright 2010 boreal-kiss.com. All rights reserved.
//

#import "FlippedImageView.h"
#import "NotificationSender.h"

@implementation FlippedImageView

//Override
-(void)awakeFromNib{
	[self setImageFrameStyle:NSImageFrameNone];
	[self setImageScaling:NSScaleNone];
}

//Override
-(BOOL)isFlipped{
	return YES;
}

@end
