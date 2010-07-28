//
//  AppDelegate.h
//  ColorInspector
//
//  Created by boreal-kiss.com on 10/07/26.
//  Copyright boreal-kiss.com 2010. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class DocumentManager;

@interface AppDelegate : NSObject <NSApplicationDelegate>{
	NSWindowController *_windowController;
	DocumentManager *_documentManager;
}
@property (nonatomic, retain) NSWindowController *windowController;
@property (nonatomic, retain) DocumentManager *documentManager;

@end

#import "AppDelegate-IBAction.h"