//
//  DocumentManager.h
//  ColorInspector
//
//  Created by boreal-kiss.com on 10/07/26.
//  Copyright 2010 boreal-kiss.com. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface DocumentManager : NSObject {
	NSMutableArray *_documents;
	NSPoint _windowCascadePoint;
}
@property (nonatomic, retain) NSMutableArray *documents;

-(Class)documentClass;
-(NSArray *)documentExtensions;
-(IBAction)openDocument:(id)sender;
-(IBAction)newDocument:(id)sender;

-(void)addObject:(id)object;
-(void)removeObject:(id)object;
@end

#import "DocumentManager-FileOpen.h"
