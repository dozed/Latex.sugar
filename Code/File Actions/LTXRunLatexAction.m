//
//  LTXRunLatexAction.m
//

#import "LTXRunLatexAction.h"
#import <EspressoSDK.h>

@implementation LTXRunLatexAction

- (id)initWithDictionary:(NSDictionary *)dictionary bundlePath:(NSString *)bundlePath
{
	self = [super init];
	if (self == nil)
		return nil;
	
	pdflatexPath = [[dictionary objectForKey:@"pdflatex-path"] copy]; //a.g.
	
	return self;
}

//------------------------------------------------------------------------------------------------------------------------------------------

- (void)dealloc
{	
	[pdflatexPath release];
	[super dealloc];
}

//------------------------------------------------------------------------------------------------------------------------------------------

- (BOOL)canPerformActionWithContext:(id)context
{
	return ([[NSFileManager defaultManager] fileExistsAtPath:pdflatexPath] && 
			[[NSFileManager defaultManager] fileExistsAtPath:[[[context documentContext] fileURL] path]]);
}

//------------------------------------------------------------------------------------------------------------------------------------------

- (BOOL)performActionWithContext:(id)context error:(NSError **)outError
{
	NSTask *task = [[NSTask alloc] init];
	NSPipe *pipe = [NSPipe pipe];
	NSString *string;

	NSString* absolutePath = [[[context documentContext] fileURL] path];
	NSRange range = [absolutePath rangeOfString:@"/" options:NSBackwardsSearch];
	NSString* basePath = [absolutePath substringToIndex:range.location];
	
	[task setCurrentDirectoryPath:basePath];
    [task setLaunchPath:pdflatexPath];
    [task setArguments:[NSArray arrayWithObjects: @"-l", [[[context documentContext] fileURL] path], nil]];
    [task setStandardOutput:pipe];
	[task setStandardError:pipe];
    [task launch];
	
    string = [[NSString alloc] initWithData:[[pipe fileHandleForReading] readDataToEndOfFile] encoding:NSUTF8StringEncoding];
	[string release];
	[task release];
	
	return YES;
}

@end
