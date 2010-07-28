//
//  ColorInspectorWC-NSNotification.h
//  ColorInspector
//
//  Created by boreal-kiss.com on 10/07/26.
//  Copyright 2010 boreal-kiss.com. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "ColorInspectorWC.h"

@interface ColorInspectorWC (_NSNotification)

-(void)_subscribe;
-(void)_unsubscribe;
-(void)_notificationHandler:(NSNotification *)aNotification;
-(void)_setLabelText:(NSString *)aText withViewTag:(NSInteger)aTag;
@end
