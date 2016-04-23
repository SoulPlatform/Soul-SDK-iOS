//
//  SLApiBase.h
//  Pods
//
//  Created by Mikhail on 18.03.16.
//
//

#import "SLError.h"
#import "SLConfig.h"
#import "SLHTTPRequest.h"
#import "SLResponse.h"
#import "SLErrorResponse.h"
#import "SLStorageProtocol.h"
#import "SLHttpClientProtocol.h"
#import "NSMutableDictionary+SLHelper.h"

typedef void (^SLApiRequestSuccess)(SLResponse *_Nonnull response);
typedef void (^SLApiRequestFailure)(SLErrorResponse *_Nullable response);

@interface SLApiBase :NSObject

- (void)GET:(nonnull NSString *)endpoint
      params:(nullable NSDictionary *)params
     success:(nullable SLApiRequestSuccess)success
     failure:(nullable SLApiRequestFailure)failure;

- (void)POST:(nonnull NSString *)endpoint
      params:(nullable NSDictionary *)params
     success:(nullable SLApiRequestSuccess)success
     failure:(nullable SLApiRequestFailure)failure;

- (void)POST:(nonnull NSString *)endpoint
    isSecure:(BOOL)isSecure
      params:(nullable NSDictionary *)params
     success:(nullable SLApiRequestSuccess)success
     failure:(nullable SLApiRequestFailure)failure;

- (void)PUT:(nonnull NSString *)endpoint
     params:(nullable NSDictionary *)params
    success:(nullable SLApiRequestSuccess)success
    failure:(nullable SLApiRequestFailure)failure;

- (void)PATCH:(nonnull NSString *)endpoint
       params:(nullable NSDictionary *)params
      success:(nullable SLApiRequestSuccess)success
      failure:(nullable SLApiRequestFailure)failure;

- (void)DELETE:(nonnull NSString *)endpoint
       params:(nullable NSDictionary *)params
      success:(nullable SLApiRequestSuccess)success
      failure:(nullable SLApiRequestFailure)failure;

- (void)uploadImage:(nonnull NSData *)imageData
           endpoint:(nonnull NSString *)endpoint
             params:(nullable NSDictionary *)params
            success:(nullable SLApiRequestSuccess)success
            failure:(nullable SLApiRequestFailure)failure;

@property (nonatomic, strong) SLConfig *_Nonnull config;
@property (nonatomic, strong) NSObject <SLStorageProtocol> *_Nullable storage;
@property (nonatomic, strong) NSObject <SLHttpClientProtocol> *_Nullable httpClient;

- (nullable instancetype)initWithHttpClient:(nonnull NSObject <SLHttpClientProtocol> *)httpClient
                                    storage:(nullable NSObject <SLStorageProtocol> *)storage
                                     config:(nullable SLConfig *)config;

- (nonnull NSString *)uriFrom:(nonnull NSString *)endpoint;
- (nonnull NSString *)uriFrom:(nonnull NSString *)endpoint withQueryParams:(nullable NSDictionary *)query;

@end
