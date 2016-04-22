//
//  SLUploadRequest.m
//  Pods
//
//  Created by Mikhail on 05.04.16.
//
//

#import "SLUploadRequest.h"

@implementation SLUploadRequest

- (nullable instancetype)initWithHttpMethod:(SLHTTPMethodType)httpMethod
                                   isSecure:(BOOL)isSecure
                                   endpoint:(nonnull NSString *)endpoint
                                     params:(nullable NSDictionary *)params {

    self = [super initWithHttpMethod:httpMethod isSecure:isSecure endpoint:endpoint params:params];

    if (self) {
        _uploads = [NSMutableDictionary dictionary];
    }

    return self;
}

- (void)addData:(nonnull NSData *)data name:(nonnull NSString *)name {
    _uploads[name] = data;
}

@end
