//
//  DocumentManager-FileOpen.h
//  ColorInspector
//
//  Created by boreal-kiss.com on 10/07/26.
//  Copyright 2010 boreal-kiss.com. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "DocumentManager.h"

@interface DocumentManager (_FileOpen)

-(void)openDocumentWithPath:(NSString *)aPath;
-(void)_resisterDocument:(id)aDocument;

/**
 * Returns a document already opened.
 */
-(id)_existingDocumentWithPath:(NSString *)aPath;
@end
