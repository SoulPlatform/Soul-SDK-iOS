//
//  SLHttpClientProtocol.h
//  Pods
//
//  Created by Mikhail on 26.03.16.
//
//

#import <Foundation/Foundation.h>

#import "SLConfig.h"
#import "SLHTTPRequest.h"
#import "SLUploadRequest.h"
#import "SLStorageProtocol.h"

typedef void (^SLHttpClientSuccess)(NSInteger statusCode, id _Nullable responseObject);
typedef void (^SLHttpClientFailure)(NSError * _Nonnull error);

@protocol SLHttpClientProtocol

@required
- (nullable instancetype)initWithApiConfig:(nonnull SLConfig *)config storage:(nullable NSObject <SLStorageProtocol> *)storage;
- (void)executeAtRequest:(nonnull SLHTTPRequest *)request success:(nullable SLHttpClientSuccess)success failure:(nullable SLHttpClientFailure)failure;

@end
