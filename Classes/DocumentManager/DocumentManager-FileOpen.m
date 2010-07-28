//
//  DocumentManager-FileOpen.m
//  ColorInspector
//
//  Created by boreal-kiss.com on 10/07/26.
//  Copyright 2010 boreal-kiss.com. All rights reserved.
//

#import "DocumentManager-FileOpen.h"


@implementation DocumentManager (_FileOpen)

-(void)openDocumentWithPath:(NSString *)aPath{
	id newDocument = [self _existingDocumentWithPath:aPath];
	
	if (newDocument){
		//Makes the existed file key window.
		[[newDocument window] makeKeyAndOrderFront:self];
		return;
	}
	
	newDocument = [[[[self documentClass] alloc] initWithPath:aPath] autorelease];
	[self _resisterDocument:newDocument];
}

-(void)_resisterDocument:(id)aDocument{
	//[_documents addObject:aDocument];
	[self addObject:aDocument];
	
	if ([aDocument respondsToSelector:@selector(window)]){
		id window = [aDocument window];
		_windowCascadePoint = [window cascadeTopLeftFromPoint:_windowCascadePoint];
		[window makeKeyAndOrderFront:self];
	}
}

-(id)_existingDocumentWithPath:(NSString *)aPath{
	id result = nil;
	
	for (id aDocument in _documents){
		if ([aDocument respondsToSelector:@selector(documentPath)]){
			if ([[aDocument documentPath] isEqualToString:aPath]){
				result = aDocument;
			}
		}
	}
	
	return result;
}

@end
