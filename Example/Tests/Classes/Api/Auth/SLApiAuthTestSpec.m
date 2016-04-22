//
//  SLApiAuthTestSpec.m
//  SoulSDK
//
//  Created by Mikhail on 18.03.16.
//  Copyright © 2016 Mikhail Shershnev. All rights reserved.
//

#import "SLTHttpClientMock.h"

SpecBegin(SLApiAuth)

describe(@"api auth", ^{

    NSObject<SLHttpClientProtocol> *httpClient;
    SLApiAuth *authApi = [[SLApiAuth alloc] initWithHttpClient:httpClient storage:nil config:nil];

    describe(@"logout", ^{

        NSInteger statusCode200 = 200;

        it(@"logout success", ^{

            authApi.httpClient = [SLTHttpClientMock executedSuccessfullyWithStatusCode:statusCode200 response:nil];

            [authApi logoutFull:YES
                     success:^ {
                         expect(YES).to.beTruthy();
                     }
                     failure:nil];
        });

        it(@"logout failure", ^{

            authApi.httpClient = [SLTHttpClientMock executedFailure];

            [authApi logoutFull:YES
                          success:nil
                          failure:^(NSError * _Nullable error) {
                              expect(error).notTo.beNil();
                          }];
        });

    });

});

SpecEnd