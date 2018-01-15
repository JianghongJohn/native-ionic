#import "PhoneDialer.h"

@implementation PhoneDialer

- (void) dialPhone:(CDVInvokedUrlCommand*)command   {
    NSString* url;
    NSString* NumberToDial = [command.arguments objectAtIndex:0];
    if( [NumberToDial hasPrefix:@"tel:"] )  {
        url = NumberToDial;
    }   else    {
        url = [NSString stringWithFormat:@"tel:%@", [NumberToDial stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    }
    if( ![[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]] )  {
        NSLog( @"openURL failed, %@, %@", [[UIDevice currentDevice] model], url );
    }
}

@end
