//
//  SLRequest.m
//  Pods
//
//  Created by Mikhail on 18.03.16.
//
//

#import "SLRequest.h"

@implementation SLRequest

+ (nullable instancetype)requestWithHttpMethod:(SLHTTPMethodType)httpMethod
                                      isSecure:(BOOL)isSecure
                                      endpoint:(nonnull NSString *)endpoint
                                        params:(nullable NSDictionary *)params {

    return [[self alloc] initWithHttpMethod:httpMethod isSecure:isSecure endpoint:endpoint params:params];
}
- (nullable instancetype)initWithHttpMethod:(SLHTTPMethodType)httpMethod
                                   isSecure:(BOOL)isSecure
                                   endpoint:(nonnull NSString *)endpoint
                                     params:(nullable NSDictionary *)params {

    self = [self init];

    if (self) {
        _params = params;
        _endpoint = endpoint;
        _isSecure = isSecure;
        _httpMethod = httpMethod;
    }

    return self;
}

- (NSString *)methodString {

    NSString *methodString;

    switch (_httpMethod) {
        case SLHTTPMethodGET:
            methodString = @"GET";
            break;
        case SLHTTPMethodPUT:
            methodString = @"PUT";
            break;
        case SLHTTPMethodPOST:
            methodString = @"POST";
            break;
        case SLHTTPMethodPATCH:
            methodString = @"PATCH";
            break;
        case SLHTTPMethodDELETE:
            methodString = @"DELETE";
            break;
    }

    return methodString;
}

@end
