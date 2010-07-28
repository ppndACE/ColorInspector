//
//  DocumentManager.m
//  ColorInspector
//
//  Created by boreal-kiss.com on 10/07/26.
//  Copyright 2010 boreal-kiss.com. All rights reserved.
//

#import "DocumentManager.h"
#import "DocumentManager-FileOpen.h"
#import "ImageViewerWC.h"

//Private
@interface DocumentManager ()
-(void)_setup;
@end


@implementation DocumentManager
@synthesize documents = _documents;

-(id)init{
	if (self = [super init]){
		[self _setup];
	}
	return self;
}

-(Class)documentClass{
	return [ImageViewerWC class];
}

-(NSArray *)documentExtensions{
	static NSMutableArray *supportedExtensions;
	supportedExtensions = [NSMutableArray array];
	
	if ([[self documentClass] respondsToSelector:@selector(documentExtensions)]){
		[supportedExtensions addObjectsFromArray:[[self documentClass] documentExtensions]];
	}
	
	return supportedExtensions;
}

-(void)addObject:(id)object{
	[_documents addObject:object];
}

-(void)removeObject:(id)object{
	[_documents removeObject:object];
}

-(IBAction)openDocument:(id)sender{
	NSLog(@"%s", __FUNCTION__);
	
	NSOpenPanel *openPanel = [NSOpenPanel openPanel];
	[openPanel setAllowsMultipleSelection:YES];
	[openPanel setCanChooseDirectories:NO];
	[openPanel setCanChooseFiles:YES];
	
	if ([openPanel runModalForTypes:[self documentExtensions]] == NSOKButton){
		for (NSString *aPath in [openPanel filenames]){
			[self openDocumentWithPath:aPath];
		}
	}
}

-(IBAction)newDocument:(id)sender{
	NSLog(@"%s", __FUNCTION__);
	
	id aDocument = [[[[self documentClass] alloc] init] autorelease];
	[self _resisterDocument:aDocument];
	
}

-(void)dealloc{
	self.documents = nil;
	[super dealloc];
}

#pragma mark Private 

-(void)_setup{
	_documents = [[NSMutableArray alloc] init];
	
	NSRect visibleFrame = [[NSScreen mainScreen] visibleFrame];
	_windowCascadePoint = NSMakePoint(0, NSMaxY(visibleFrame));
}
/*
-(void)_setup{
	_documents = [[NSMutableArray alloc] init];
	
	NSWindow *theWindow = [[NSApp windows] lastObject];
	NSSize theSize = [theWindow frame].size;
	NSRect visibleFrame = [[NSScreen mainScreen] visibleFrame];
	_windowCascadePoint = NSMakePoint(theSize.width, NSMaxY(visibleFrame));
}
*/
@end
