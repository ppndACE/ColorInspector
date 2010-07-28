//
//  DraggingView.h
//  ImageViewerTest
//
//  Created by boreal-kiss.com on 10/07/22.
//  Copyright 2010 boreal-kiss.com. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface DraggingView : NSView {
	BOOL _highlighted;
	NSString *_filePath;
}
@property (nonatomic, assign) BOOL highlighted;
@property (nonatomic, copy) NSString *filePath;

@end
