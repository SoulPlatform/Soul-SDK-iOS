//
//  SLApiPhoneAuthTests.m
//  SoulSDK
//
//  Created by Mikhail on 18.03.16.
//  Copyright © 2016 Mikhail Shershnev. All rights reserved.
//

#import "SLTPhoneAuthVerifyDataManager.h"
#import "SLTPhoneAuthRequestDataManager.h"
#import "SLTErrorResponseDataManager.h"

#import "SLTHttpClientMock.h"

SpecBegin(SLApiPhoneAuth)

describe(@"api phone auth", ^{

    NSObject<SLHttpClientProtocol> *httpClient;
    SLApiAuth *authApi = [[SLApiAuth alloc] initWithHttpClient:httpClient storage:nil config:nil];

    NSString *kPhoneNumber = @"+79051234567";
    SLApiPhoneAuth *phoneAuth = [SLApiPhoneAuth new];

    SLTErrorResponseDataManager *errorResponseData = [SLTErrorResponseDataManager new];
    NSDictionary *errorResponseDict = [errorResponseData errorResponse];

    describe(@"send code by sms", ^{

        it(@"send code success", ^{

            SLTPhoneAuthRequestDataManager *phoneAuthRequestData = [SLTPhoneAuthRequestDataManager new];
            NSDictionary *phoneAuthRequestDict = [phoneAuthRequestData phoneAuthRequest];
            
            authApi.httpClient = [SLTHttpClientMock executedSuccessfullyWithStatusCode:200 response:phoneAuthRequestDict];

            [phoneAuth getCode:kPhoneNumber
                       success:^(SLPhoneAuthRequest * _Nonnull requestEntity) {
                           expect(requestEntity).notTo.beNil();
                       }
                       failure:nil];

        });

        it(@"send code failure #1", ^{

            authApi.httpClient = [SLTHttpClientMock executedSuccessfullyWithStatusCode:400 response:errorResponseDict];

            [phoneAuth getCode:kPhoneNumber
                          success:nil
                          failure:^(NSError * _Nullable error) {
                              expect(error).to.beNil();
                          }];

        });

        it(@"send code failure #2", ^{

            authApi.httpClient = [SLTHttpClientMock executedFailure];

            [phoneAuth getCode:kPhoneNumber
                          success:nil
                          failure:^(NSError * _Nullable error) {

                              expect(error).notTo.beNil();
                          }];

        });

    });

    describe(@"verify and login", ^{

        NSString *code = @"287132";

        NSInteger statusCode200 = 200;
        NSInteger statusCode400 = 400;

        NSDictionary *failureDict = errorResponseDict;

        SLTPhoneAuthVerifyDataManager *phoneAuthVerifyData = [SLTPhoneAuthVerifyDataManager new];
        NSDictionary *phoneAuthVerifyDict = [phoneAuthVerifyData phoneAuthVerify];

        it(@"verify code success", ^{

            authApi.httpClient = [SLTHttpClientMock executedSuccessfullyWithStatusCode:statusCode200 response:phoneAuthVerifyDict];

            [phoneAuth verify:kPhoneNumber
                         code:code
                      success:^(SLPhoneAuthVerify *_Nonnull verifyEntity) {
                          expect(verifyEntity).notTo.beNil();
                      } failure:nil];
        });

        it(@"verify code failure #1", ^{

            authApi.httpClient = [SLTHttpClientMock executedSuccessfullyWithStatusCode:statusCode400 response:failureDict];

            [phoneAuth verify:kPhoneNumber
                         code:code
                      success:nil
                      failure:^(NSError * _Nullable error) {

                                expect(error).to.beNil();
                            }];
        });

        it(@"verify code failure #2", ^{

            authApi.httpClient = [SLTHttpClientMock executedFailure];

            [phoneAuth verify:kPhoneNumber
                         code:code
                      success:nil
                      failure:^(NSError * _Nullable error) {
                                expect(error).notTo.beNil();
                            }];
            
        });

        // login
        it(@"login code success", ^{

            authApi.httpClient = [SLTHttpClientMock executedSuccessfullyWithStatusCode:statusCode200 response:phoneAuthVerifyDict];

            NSString *accessToken = @"ewifjowep0f9jp23r23f23ofj23f3fj";

            [phoneAuth refreshToken:accessToken
                        phoneNumber:kPhoneNumber
                               code:code
                           success:^(SLPhoneAuthVerify *_Nonnull verifyEntity) {
                               expect(verifyEntity).notTo.beNil();
                           }
                           failure:nil];
        });

        it(@"login code failure #1", ^{

            authApi.httpClient = [SLTHttpClientMock executedSuccessfullyWithStatusCode:statusCode400 response:failureDict];

            NSString *accessToken = nil;

            [phoneAuth refreshToken:accessToken
                        phoneNumber:kPhoneNumber
                               code:code
                            success:nil
                            failure:^(NSError * _Nullable error) {
                               expect(error).to.beNil();
                           }];
        });

        it(@"login code failure #2", ^{

            authApi.httpClient = [SLTHttpClientMock executedFailure];

            NSString *accessToken = nil;

            [phoneAuth refreshToken:accessToken
                        phoneNumber:kPhoneNumber
                               code:code
                           success:nil
                           failure:^(NSError * _Nullable error) {
                               expect(error).notTo.beNil();
                           }];
        });

    });

});

SpecEnd




