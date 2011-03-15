//
//  LTXRunLatexAction.h
//

#import <Cocoa/Cocoa.h>

@interface LTXRunLatexAction : NSObject {

}

- (id)initWithDictionary:(NSDictionary *)dictionary bundlePath:(NSString *)bundlePath;
- (void)dealloc;

- (BOOL)canPerformActionWithContext:(id)context;
- (BOOL)performActionWithContext:(id)context error:(NSError **)outError;

@end
