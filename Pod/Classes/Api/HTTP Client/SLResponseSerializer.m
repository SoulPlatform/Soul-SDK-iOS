//
//  SLResponseSerializer.m
//  Pods
//
//  Created by Mikhail on 21.04.16.
//
//

#import "SLResponseSerializer.h"

@implementation SLResponseSerializer

- (id)responseObjectForResponse:(NSURLResponse *)response
                           data:(NSData *)data
                          error:(NSError *__autoreleasing *)error {

    if (![self validateResponse:(NSHTTPURLResponse *)response data:data error:error]) {

        if (*error != nil) {

            NSString *errorString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];

            NSMutableDictionary *userInfo = [(*error).userInfo mutableCopy];
            userInfo[SLErrorKey] = errorString;

            NSError *newError = [NSError errorWithDomain:(*error).domain code:(*error).code userInfo:userInfo];
            (*error) = newError;
        }

        return (nil);
    }

    return ([super responseObjectForResponse:response data:data error:error]);
}

@end