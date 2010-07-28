//
//  AppDelegate-IBAction.h
//  ColorInspector
//
//  Created by boreal-kiss.com on 10/07/27.
//  Copyright 2010 boreal-kiss.com. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "AppDelegate.h"

@interface AppDelegate (_IBAction)

-(IBAction)openDocument:(id)sender;
-(IBAction)newDocument:(id)sender;
-(IBAction)zoomIn:(id)sender;
-(IBAction)zoomOut:(id)sender;
-(IBAction)zoomEven:(id)sender;

@end
