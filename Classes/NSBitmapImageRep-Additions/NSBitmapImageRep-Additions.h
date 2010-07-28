//
//  NSBitmapImageRep-Additions.h
//  ImageViewerTest
//
//  Created by boreal-kiss.com on 10/07/22.
//  Copyright 2010 boreal-kiss.com. All rights reserved.
//

#import <Cocoa/Cocoa.h>



@interface NSBitmapImageRep (_Additions)

+(NSBitmapImageRep *)imageRepWithImage:(NSImage *)anImage;
+(NSBitmapImageRep *)imageRepWithPixelsWide:(NSInteger)width pixelsHigh:(NSInteger)height hasAlpha:(BOOL)alpha;

-(id)initWithPixelsWide:(NSInteger)width pixelsHigh:(NSInteger)height hasAlpha:(BOOL)alpha;
-(id)initWithImage:(NSImage *)anImage;
-(NSImage *)image;
-(void)setImage:(NSImage *)anImage;
@end
