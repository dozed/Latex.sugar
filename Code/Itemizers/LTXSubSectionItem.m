//
//  LTXSubSectionItem.m
//  Latex
//
//  Created by Stefan on 22.04.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "LTXSubSectionItem.h"


@implementation LTXSubSectionItem

- (void)initializeWithCapturedZones:(NSDictionary *)captures recipeInfo:(NSDictionary *)recipeInfo
{
	[super initializeWithCapturedZones:captures recipeInfo:recipeInfo];
	
	name = [[[captures objectForKey:@"name"] text] retain];
	NSLog(@"captures: %@", captures);
	NSLog(@"capture zone: %@", name);
}

- (void)dealloc
{
	[name release];
	name = nil;
	[super dealloc];
}

- (BOOL)transformIntoItem:(LTXSubSectionItem *)otherItem
{
	// Note: the passed argument can actually be any item class, but casting it to this specific class makes it easy to write the transformation code. The default (super) implementation takes care of checking the class, so this is perfectly valid.
	if (![super transformIntoItem:otherItem])
		return NO;
	
	// Clean up our own old values
	[name release];
	name = nil;
	
	// Take over the new values from the other item
	name = [otherItem->name retain];
	
	return YES;
}

- (BOOL)isDecorator
{
	return YES;
}

- (CEItemDecorationType)decorationType
{
	//	return CEItemDecorationDefault;
	return CEItemDecorationDynamicTag;
}

- (NSColor *)backgroundColor
{
	return [NSColor yellowColor];
}

- (NSImage *)image
{
	NSString *path = [[NSBundle bundleForClass:[self class]] pathForResource:@"page_white_go" ofType:@"png"];
	NSImage *image = [[NSImage alloc] initWithContentsOfFile:path];
	[image autorelease];
	//	return image;
	return nil;
}

- (BOOL)isTextualizer
{
	return YES;
}

- (NSString *)title
{
	return name;
}

//- (BOOL)shouldAppendSecondaryDescriptionToTitle
//{
//	return YES;
//}

@end
