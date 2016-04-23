//
//  SLHttpClient.m
//  Pods
//
//  Created by Mikhail on 26.03.16.
//
//

#import "SLHttpClient.h"
#import "SLHTTPHeadersManager.h"
#import "SLResponseSerializer.h"
#import <AFNetworking/AFHTTPSessionManager.h>

typedef void (^SLHttpClientAFSuccess)(NSURLSessionDataTask * _Nonnull, id _Nullable);
typedef void (^SLHttpClientAFFailure)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull);

@interface SLHttpClient ()

@property (nonatomic, strong) SLConfig *config;
@property (nonatomic, strong) NSObject <SLStorageProtocol> *storage;

@property (nonatomic, strong) SLHTTPHeadersManager *headersManager;

@end

@implementation SLHttpClient

- (nullable instancetype)initWithApiConfig:(nonnull SLConfig *)config storage:(nullable NSObject <SLStorageProtocol> *)storage {
    self = [self init];

    if (self) {
        _config = config;
        _storage = storage;

        _headersManager = [[SLHTTPHeadersManager alloc] initWithStorage:_storage];
    }

    return self;
}

- (void)executeAtRequest:(nonnull SLHTTPRequest *)request success:(nullable SLHttpClientSuccess)success failure:(nullable SLHttpClientFailure)failure {

    NSString *endpoint = request.endpoint;
    NSDictionary *params = request.params;

    SLHttpClientAFSuccess afSuccess = ^(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject) {

        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)task.response;
        NSInteger statusCode = httpResponse.statusCode;

        if (success) {
            success(statusCode, responseObject);
        }
    };

    SLHttpClientAFFailure afFailure = ^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {

        //
        if (failure) {
            failure(error);
        }

    };

    AFHTTPSessionManager *manager = [self httpManagerByRequest:request];

    switch (request.httpMethod) {
        case SLHTTPMethodGET:
            [manager GET:endpoint parameters:params progress:nil success:afSuccess failure:afFailure];
            break;

        case SLHTTPMethodPUT:
            [manager PUT:endpoint parameters:params success:afSuccess failure:afFailure];
            break;

        case SLHTTPMethodPOST:
            if ([request isMemberOfClass:[SLUploadRequest class]]) {

                SLUploadRequest *uploadRequest = (SLUploadRequest *)request;

                [manager POST:endpoint parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
                    
                    for (NSString *name in uploadRequest.uploads.allKeys) {
                        NSData *data = uploadRequest.uploads[name];
                        [formData appendPartWithFileData:data name:name fileName:name mimeType:@"image/png"];
                    }

                } progress:nil success:afSuccess failure:afFailure];
            }
            else {
                [manager POST:endpoint parameters:params progress:nil success:afSuccess failure:afFailure];
            }

            break;

        case SLHTTPMethodPATCH:
            [manager PATCH:endpoint parameters:params success:afSuccess failure:afFailure];
            break;

        case SLHTTPMethodDELETE:
            [manager DELETE:endpoint parameters:params success:afSuccess failure:afFailure];
            break;
    }

}

- (AFHTTPSessionManager *)httpManagerByRequest:(SLHTTPRequest *)request {

    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:_config.baseURL];
    AFJSONRequestSerializer *requestSerializer = [AFJSONRequestSerializer serializer];

    manager.responseSerializer = [SLResponseSerializer serializer];

    NSString *body = [self bodyByRequest:request];
    NSDictionary *headers = [_headersManager headersByRequest:request andBody:body];

    for (NSString *field in headers.allKeys) {

        NSString *header = headers[field];
        [requestSerializer setValue:header forHTTPHeaderField:field];
    }

    manager.requestSerializer = requestSerializer;
    return manager;
}

- (NSString *)bodyByRequest:(SLHTTPRequest *)request {

    NSMutableURLRequest *fakeRequest = [NSMutableURLRequest new];
    fakeRequest.HTTPMethod = [request methodString];

    AFJSONRequestSerializer *requestSerializer = [AFJSONRequestSerializer serializer];
    NSURLRequest *httpRequest = [requestSerializer requestBySerializingRequest:fakeRequest withParameters:request.params error:nil];
    NSData *bodyData = httpRequest.HTTPBody;
    NSString *bodyString = [[NSString alloc] initWithData:bodyData encoding:NSUTF8StringEncoding];

    return bodyString;
}
@end