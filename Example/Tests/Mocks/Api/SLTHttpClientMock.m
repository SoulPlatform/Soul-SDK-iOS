//
//  SLTHttpClientMock.m
//  SoulSDK
//
//  Created by Mikhail on 29.03.16.
//  Copyright © 2016 Mikhail Shershnev. All rights reserved.
//

#import "SLTHttpClientMock.h"

@implementation SLTHttpClientMock

+ (nonnull NSObject <SLHttpClientProtocol> *)executedSuccessfullyWithStatusCode:(NSInteger)statusCode
                                                                      response:(id _Nullable)response {

    NSObject <SLHttpClientProtocol> *httpClient = OCMProtocolMock(@protocol(SLHttpClientProtocol));

    OCMStub( [httpClient executeAtRequest:OCMOCK_ANY success:OCMOCK_ANY failure:OCMOCK_ANY] ).andDo(^(NSInvocation *invocation) {
        SLHttpClientSuccess successBlock;
        [invocation getArgument:&successBlock atIndex:3];
        successBlock(statusCode, response);
    });

    return httpClient;
}

+ (nonnull NSObject <SLHttpClientProtocol> *)executedFailure {
    NSError *error = [NSError new];
    return [self executedFailureWithError:error];
}

+ (nonnull NSObject <SLHttpClientProtocol> *)executedFailureWithError:(nonnull NSError *)error {

    NSObject <SLHttpClientProtocol> *httpClient = OCMProtocolMock(@protocol(SLHttpClientProtocol));

    OCMStub( [httpClient executeAtRequest:OCMOCK_ANY success:OCMOCK_ANY failure:OCMOCK_ANY] ).andDo(^(NSInvocation *invocation) {
        SLHttpClientFailure failureBlock;
        [invocation getArgument:&failureBlock atIndex:4];
        failureBlock(error);
    });

    return httpClient;
}

@end
