//
//  LTXRunPreviewAction.h
//  Latex
//
//  Created by Stefan Ollinger on 24.02.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface LTXPreviewAction  : NSObject {
}

- (id)initWithDictionary:(NSDictionary *)dictionary bundlePath:(NSString *)bundlePath;
- (void)dealloc;

- (BOOL)canPerformActionWithContext:(id)context;
- (BOOL)performActionWithContext:(id)context error:(NSError **)outError;

- (NSString*)getPdfFilename:(NSString*)texFilename;

@end