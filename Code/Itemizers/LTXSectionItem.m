//
//  LTXSectionItem.m
//  Latex
//
//  Created by Stefan on 21.04.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "LTXSectionItem.h"


@implementation LTXSectionItem

- (void)initializeWithCapturedZones:(NSDictionary *)captures recipeInfo:(NSDictionary *)recipeInfo
{
	[super initializeWithCapturedZones:captures recipeInfo:recipeInfo];
	name = [[[[captures objectForKey:@"name"] text] stringByReplacingOccurrencesOfString:@"\\\\" withString:@" "] retain];
}

- (void)dealloc
{
	[name release];
	name = nil;
	[super dealloc];
}

- (BOOL)transformIntoItem:(LTXSectionItem *)otherItem
{
	// Note: the passed argument can actually be any item class, but casting it to this specific class makes it easy to write the transformation code. The default (super) implementation takes care of checking the class, so this is perfectly valid.
	if (![super transformIntoItem:otherItem])
		return NO;

	// Clean up our own old values
	[name release];
	name = [[otherItem->name stringByReplacingOccurrencesOfString:@"\\\\" withString:@" "] retain];

	return YES;
}

- (BOOL)isDecorator
{
	return YES;
}

- (CEItemDecorationType)decorationType
{
	return CEItemDecorationDynamicTag;
}

- (NSColor *)backgroundColor
{
	return [NSColor blueColor];
}

- (NSImage *)image
{
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

@end
