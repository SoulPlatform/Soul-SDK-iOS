//
//  SLApiBase.m
//  Pods
//
//  Created by Mikhail on 18.03.16.
//
//

#import "SLApiBase.h"

#import "SoulSDK.h"
#import "SLUploadRequest.h"
#import "SLErrorMapper.h"
#import "SLErrorResponse.h"
#import "SLResponseSerializer.h" // TODO

static NSString *const kVersion = @"v";

@implementation SLApiBase

- (nullable instancetype)initWithHttpClient:(nonnull NSObject <SLHttpClientProtocol> *)httpClient
                                    storage:(nullable NSObject <SLStorageProtocol> *)storage
                                     config:(nullable SLConfig *)config {

    self = [self init];

    if (self) {
        _config = config;
        _storage = storage;
        _httpClient = httpClient;
    }

    return self;
}

- (void)GET:(nonnull NSString *)endpoint
     params:(nullable NSDictionary *)params
    success:(nullable SLApiRequestSuccess)success
    failure:(nullable SLApiRequestFailure)failure {

    [self executeWithHttpMethod:SLHTTPMethodGET endpoint:endpoint params:params success:success failure:failure];
}

- (void)POST:(nonnull NSString *)endpoint
      params:(nullable NSDictionary *)params
     success:(nullable SLApiRequestSuccess)success
     failure:(nullable SLApiRequestFailure)failure {

    [self POST:endpoint isSecure:YES params:params success:success failure:failure];
}

- (void)POST:(nonnull NSString *)endpoint
    isSecure:(BOOL)isSecure
      params:(nullable NSDictionary *)params
     success:(nullable SLApiRequestSuccess)success
     failure:(nullable SLApiRequestFailure)failure {

    [self executeWithHttpMethod:SLHTTPMethodPOST isSecure:isSecure endpoint:endpoint params:params success:success failure:failure];
}

- (void)PUT:(nonnull NSString *)endpoint
     params:(nullable NSDictionary *)params
    success:(nullable SLApiRequestSuccess)success
    failure:(nullable SLApiRequestFailure)failure {

    [self executeWithHttpMethod:SLHTTPMethodPUT endpoint:endpoint params:params success:success failure:failure];
}

- (void)PATCH:(nonnull NSString *)endpoint
       params:(nullable NSDictionary *)params
      success:(nullable SLApiRequestSuccess)success
      failure:(nullable SLApiRequestFailure)failure {

    [self executeWithHttpMethod:SLHTTPMethodPATCH endpoint:endpoint params:params success:success failure:failure];
}

- (void)DELETE:(nonnull NSString *)endpoint
       params:(nullable NSDictionary *)params
      success:(nullable SLApiRequestSuccess)success
      failure:(nullable SLApiRequestFailure)failure {
    
    [self executeWithHttpMethod:SLHTTPMethodDELETE endpoint:endpoint params:params success:success failure:failure];
}

- (void)executeWithHttpMethod:(SLHTTPMethodType)httpMethod
                     endpoint:(nonnull NSString *)endpoint
                       params:(nullable NSDictionary *)params
                      success:(nullable SLApiRequestSuccess)success
                      failure:(nullable SLApiRequestFailure)failure {

    [self executeWithHttpMethod:httpMethod isSecure:YES endpoint:endpoint params:params success:success failure:failure];
}

- (void)executeWithHttpMethod:(SLHTTPMethodType)httpMethod
                     isSecure:(BOOL)isSecure
                     endpoint:(nonnull NSString *)endpoint
                       params:(nullable NSDictionary *)params
                      success:(nullable SLApiRequestSuccess)success
                      failure:(nullable SLApiRequestFailure)failure {

    SLHTTPRequest *request = [SLHTTPRequest requestWithHttpMethod:httpMethod
                                                 isSecure:isSecure
                                                 endpoint:endpoint
                                                   params:params];

    [self executeAtRequest:request success:success failure:failure];
}

// POST upload
- (void)uploadImage:(nonnull NSData *)imageData
           endpoint:(nonnull NSString *)endpoint
             params:(nullable NSDictionary *)params
            success:(nullable SLApiRequestSuccess)success
            failure:(nullable SLApiRequestFailure)failure {

    SLUploadRequest *uploadRequest = [SLUploadRequest requestWithHttpMethod:SLHTTPMethodPOST
                                                                   isSecure:YES
                                                                   endpoint:endpoint
                                                                     params:params];

    [uploadRequest addData:imageData name:@"photo"];
    [self executeAtRequest:uploadRequest success:success failure:failure];
}

- (void)executeAtRequest:(nonnull SLHTTPRequest *)request
                 success:(nullable SLApiRequestSuccess)success
                 failure:(nullable SLApiRequestFailure)failure {

    if (_httpClient == nil) {
        return;
    }

    [_httpClient executeAtRequest:request success:^(NSInteger statusCode, id _Nullable responseObject) {

        SLResponse *response = [SLResponse new];
        response.request = request;

        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            NSDictionary *dict = (NSDictionary *)responseObject;
            response.dict = dict;
        }

        if (success) {
            success(response);
        }

    } failure:^(NSError * _Nonnull nsError) {

        SLErrorResponse *response = [SLErrorResponse new];
        response.nsError = nsError;

        NSDictionary *userInfo = nsError.userInfo;
        NSString *errorString = userInfo[SLErrorKey];

        NSData *errorData = [errorString dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:errorData
                                                             options:NSJSONReadingMutableContainers
                                                               error:nil];

        SLError *slError;
        if ([dict isKindOfClass:[NSDictionary class]]) {
            NSObject <SLErrorMapperProtocol> *mapper = [SLErrorMapper new];
            slError = [mapper mapError:dict[@"error"]];
        }

        if (slError) {
            response.slError = slError;
        }
        else {
            NSLog(@"##########################################");
            NSLog(@"#### ↓↓↓ DEVELOPERS ARE FUCKED UP ↓↓↓ ####");
            NSLog(@"##########################################");
            NSLog(@"%@", errorString);
            NSLog(@"##########################################");
            NSLog(@"#### ↑↑↑ DEVELOPERS ARE FUCKED UP ↑↑↑ ####");
            NSLog(@"##########################################");
        }

        if (failure) {
            failure(response);
        }

    }];

}

- (nonnull NSString *)uriFrom:(nonnull NSString *)endpoint {
    return [self uriFrom:endpoint withQueryParams:nil];
}

- (nonnull NSString *)uriFrom:(nonnull NSString *)endpoint withQueryParams:(nullable NSDictionary *)query {

    NSMutableDictionary *extQuery = [NSMutableDictionary dictionary];

    if (query != nil) {
        [extQuery addEntriesFromDictionary:query];
    }

    // add default query params
    extQuery[kVersion] = _config.sdkVersion;

    NSMutableArray *pairs = [NSMutableArray array];
    for (NSString *key in extQuery.allKeys) {

        NSString *value = extQuery[key];
        NSString *pair = [NSString stringWithFormat:@"%@=%@", key, value];

        [pairs addObject:pair];
    }

    NSString *queryString = [pairs componentsJoinedByString:@"&"];
    NSMutableString *uri = [NSMutableString stringWithString:endpoint];

    if (queryString.length > 0) {
        [uri appendFormat:@"?%@", queryString];
    }

    return [uri copy];
}

@end
