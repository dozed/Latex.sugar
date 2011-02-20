//
//  LTXRunLatexAction.h
//

#import <Cocoa/Cocoa.h>

@interface LTXRunLatexAction : NSObject {
	NSString *pdflatexPath;
}

- (id)initWithDictionary:(NSDictionary *)dictionary bundlePath:(NSString *)bundlePath;
- (void)dealloc;

- (BOOL)canPerformActionWithContext:(id)context;
- (BOOL)performActionWithContext:(id)context error:(NSError **)outError;

@end
