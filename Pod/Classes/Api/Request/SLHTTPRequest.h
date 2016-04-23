//
//  SLRequest.h
//  Pods
//
//  Created by Mikhail on 18.03.16.
//
//

#import <Foundation/Foundation.h>
#import "SLError.h"
#import "SLResponse.h"

typedef NS_ENUM(NSInteger, SLHTTPMethodType) {
    SLHTTPMethodGET = 0,
    SLHTTPMethodPUT,
    SLHTTPMethodPOST,
    SLHTTPMethodPATCH,
    SLHTTPMethodDELETE,
};

@interface SLHTTPRequest :NSObject

@property (nonatomic, strong, readonly, nonnull) NSString *endpoint;
@property (nonatomic, strong, readonly, nullable) NSDictionary *params;
@property (nonatomic, assign, readonly) BOOL isSecure;
@property (nonatomic, assign, readonly) SLHTTPMethodType httpMethod;

+ (nullable instancetype)requestWithHttpMethod:(SLHTTPMethodType)httpMethod
                                      isSecure:(BOOL)isSecure
                                      endpoint:(nonnull NSString *)endpoint
                                        params:(nullable NSDictionary *)params;

- (nullable instancetype)initWithHttpMethod:(SLHTTPMethodType)httpMethod
                                   isSecure:(BOOL)isSecure
                                   endpoint:(nonnull NSString *)endpoint
                                     params:(nullable NSDictionary *)params;

- (nonnull NSString *)methodString;

@end
