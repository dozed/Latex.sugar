//
//  LTXRunPreviewAction.m
//  Latex
//
//  Created by Stefan Ollinger on 24.02.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "LTXPreviewAction.h"
#import <EspressoSDK.h>

@implementation LTXPreviewAction

- (id)initWithDictionary:(NSDictionary *)dictionary bundlePath:(NSString *)bundlePath
{
	self = [super init];
	if (self == nil)
		return nil;
	
	return self;
}

//------------------------------------------------------------------------------------------------------------------------------------------

- (void)dealloc
{	
	[super dealloc];
}

//------------------------------------------------------------------------------------------------------------------------------------------

- (BOOL)canPerformActionWithContext:(id)context
{
	NSString* pdfFilename = [self getPdfFilename:[[[context documentContext] fileURL] path]];
	return [[NSFileManager defaultManager] fileExistsAtPath:pdfFilename];
}

//------------------------------------------------------------------------------------------------------------------------------------------

- (BOOL)performActionWithContext:(id)context error:(NSError **)outError
{
	NSString* pdfFilename = [self getPdfFilename:[[[context documentContext] fileURL] path]];
	
	NSURL* fileURL = [NSURL fileURLWithPath: pdfFilename];
	
	NSWorkspace* ws = [NSWorkspace sharedWorkspace];
	[ws openURL: fileURL];
	
	return YES;
}

- (NSString*)getPdfFilename:(NSString*) texFilename
{
	NSRange range = [texFilename rangeOfString:@".tex" options:NSBackwardsSearch];
	if (range.location == NSNotFound) return nil;
	NSString* baseFilename = [[texFilename substringToIndex:range.location] stringByAppendingString:@".pdf"];
	return baseFilename;
}

@end

