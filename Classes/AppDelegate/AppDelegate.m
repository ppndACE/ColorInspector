//
//  AppDelegate.h
//  ColorInspector
//
//  Created by boreal-kiss.com on 10/07/26.
//  Copyright boreal-kiss.com 2010. All rights reserved.
//

#import "AppDelegate.h"
#import "ColorInspectorWC.h"
#import "DocumentManager.h"

@implementation AppDelegate
@synthesize windowController = _windowController;
@synthesize documentManager = _documentManager;

-(void)applicationDidFinishLaunching:(NSNotification *)aNotification{
	NSLog(@"%s", __FUNCTION__);
	
	_windowController = [[ColorInspectorWC alloc] init];
	[_windowController showWindow:self];
}

- (BOOL)application:(NSApplication *) theApplication openFile:(NSString *) filename{
	NSLog(@"%s", __FUNCTION__);
	
	if ([[_documentManager documentExtensions] containsObject:[filename pathExtension]]){
		[_documentManager openDocumentWithPath:filename];
		return YES;
	}
	return NO;
}

- (void)application:(NSApplication *) sender openFiles:(NSArray *) filenames{
	
}

- (BOOL)applicationShouldOpenUntitledFile:(NSApplication *) sender{
	return YES;
	//return NO;
}

- (BOOL)applicationOpenUntitledFile:(NSApplication *) theApplication{
	//NSLog(@"%s", __FUNCTION__);
	
	[self newDocument:self];
	return YES;
}

-(void)dealloc{
	self.windowController = nil;
	self.documentManager = nil;
	[super dealloc];
}

#pragma mark -
#pragma mark Accessors

-(DocumentManager *)documentManager{
	if (_documentManager == nil){
		_documentManager = [[DocumentManager alloc] init];
	}
	
	return _documentManager;
}


@end
