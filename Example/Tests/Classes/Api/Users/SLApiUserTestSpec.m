//
//  SLApiUserTestSpec.m
//  SoulSDK
//
//  Created by Mikhail on 06.04.16.
//  Copyright © 2016 Mikhail Shershnev. All rights reserved.
//

#import "SLTHttpClientMock.h"
#import "SLTUserResponseDataManager.h"
#import "SLTAlbumsResponseDataManager.h"
#import "SLTErrorResponseDataManager.h"

SpecBegin(SLApiUser)

describe(@"users endpoint", ^{

    NSObject<SLHttpClientProtocol> *httpClient;
    SLApiUser *userApi = [[SLApiUser alloc] initWithHttpClient:httpClient storage:nil config:nil];

    SLTUserResponseDataManager *userData = [SLTUserResponseDataManager new];
    SLTAlbumsResponseDataManager *albumsData = [SLTAlbumsResponseDataManager new];
    SLTErrorResponseDataManager *errorResponseData = [SLTErrorResponseDataManager new];

    NSDictionary *userResponse = [userData userResponse];
    NSDictionary *miniAlbumsResponse = [albumsData miniAlbumsResponse];
    NSDictionary *completeAlbumsResponse = [albumsData completeAlbumsResponse];
    NSDictionary *errorResponse = [errorResponseData errorResponse];

    NSString *userId = @"kru5porj05h";
    NSInteger statusCode200 = 200;
    NSInteger statusCode400 = 400;

    describe(@"load user by id", ^{

        it(@"success", ^{

            userApi.httpClient = [SLTHttpClientMock executedSuccessfullyWithStatusCode:statusCode200 response:userResponse];

            [userApi loadById:userId
                      success:^(SLOtherUserResponse * _Nonnull userResponse) {
                          expect(userResponse).notTo.beNil();
                          expect(userResponse.user).notTo.beNil();
                          expect(userResponse.additionalInfo).notTo.beNil();
                      }
                      failure:nil];

        });

        it(@"failure", ^{

            userApi.httpClient = [SLTHttpClientMock executedSuccessfullyWithStatusCode:statusCode400 response:nil];

            [userApi loadById:userId
                      success:nil
                      failure:^(NSError * _Nullable error) {
                          expect(error).to.beNil();
                      }];
        });
    });

    describe(@"add flag by userId", ^{

        NSString *comment = @"comercial purposes";

        it(@"success", ^{

            userApi.httpClient = [SLTHttpClientMock executedSuccessfullyWithStatusCode:statusCode200 response:userResponse];

            [userApi setFlagById:userId
                         comment:comment
                         success:^(SLOtherUserResponse * _Nonnull userResponse) {
                             expect(userResponse).notTo.beNil();
                             expect(userResponse.user).notTo.beNil();
                             expect(userResponse.additionalInfo).notTo.beNil();
                         }
                         failure:nil];
            
        });

        it(@"failure", ^{

            userApi.httpClient = [SLTHttpClientMock executedSuccessfullyWithStatusCode:statusCode400 response:nil];

            [userApi setFlagById:userId
                         comment:comment
                         success:nil
                         failure:^(NSError * _Nullable error) {
                             expect(error).to.beNil();
                         }];
        });

    });

    describe(@"remove flag by userId", ^{

        it(@"success", ^{

            userApi.httpClient = [SLTHttpClientMock executedSuccessfullyWithStatusCode:statusCode200 response:userResponse];

            [userApi removeFlagById:userId
                            success:^(SLOtherUserResponse * _Nonnull userResponse) {
                                expect(userResponse).notTo.beNil();
                                expect(userResponse.user).notTo.beNil();
                                expect(userResponse.additionalInfo).notTo.beNil();
                            }
                            failure:nil];
        });
        
        it(@"failure", ^{
            
            userApi.httpClient = [SLTHttpClientMock executedSuccessfullyWithStatusCode:statusCode400 response:nil];
            
            [userApi removeFlagById:userId
                            success:nil
                            failure:^(NSError * _Nullable error) {
                                expect(error).to.beNil();
                            }];
        });

    });

    describe(@"load albums by userId", ^{

        NSNumber *limit = @(20);
        NSNumber *offset = @(10);

        it(@"success", ^{

            userApi.httpClient = [SLTHttpClientMock executedSuccessfullyWithStatusCode:statusCode200 response:miniAlbumsResponse];

            [userApi loadAlbumsById:userId
                             offset:offset
                              limit:limit
                            success:^(SLMiniAlbumsResponse * _Nonnull albumsResponse) {
                                expect(albumsResponse).notTo.beNil();
                                expect(albumsResponse.albums).notTo.beNil();
                                expect(albumsResponse.meta).notTo.beNil();
                                expect(albumsResponse.additionalInfo).notTo.beNil();
                            }
                            failure:nil];
        });

        it(@"failure", ^{

            userApi.httpClient = [SLTHttpClientMock executedSuccessfullyWithStatusCode:statusCode400 response:nil];

            [userApi loadAlbumsById:userId
                             offset:offset
                              limit:limit
                            success:nil
                            failure:^(NSError * _Nullable error) {
                                expect(error).to.beNil();
                            }];
        });

    });

    describe(@"load photos by albumName and userId", ^{

        NSString *albumName = @"Best album ever";

        NSNumber *limit = @(20);
        NSNumber *offset = @(10);

        it(@"success", ^{

            userApi.httpClient = [SLTHttpClientMock executedSuccessfullyWithStatusCode:statusCode200 response:completeAlbumsResponse];

            [userApi loadPhotosByAlbum:albumName
                                userId:userId
                                offset:offset
                                 limit:limit
                               success:^(SLCompleteAlbumsResponse * _Nonnull albumsResponse) {
                                   expect(albumsResponse).notTo.beNil();
                                   expect(albumsResponse.albums).notTo.beNil();
                                   expect(albumsResponse.meta).notTo.beNil();
                                   expect(albumsResponse.additionalInfo).notTo.beNil();
                               } failure:nil];
        });

        it(@"failure", ^{

            userApi.httpClient = [SLTHttpClientMock executedSuccessfullyWithStatusCode:statusCode400 response:nil];

            [userApi loadPhotosByAlbum:albumName
                                userId:userId
                                offset:offset
                                 limit:limit
                               success:nil
                               failure:^(NSError * _Nullable error) {
                                   expect(error).to.beNil();
                               }];
        });

    });

    describe(@"reactions", ^{

        NSString *type = @"liking";
        NSString *userId = @"jwlf8ehfls3";

        NSString *value = @"disliked";
        NSNumber *expiresTime = @(1447190239.492);

        it(@"send success", ^{

            userApi.httpClient = [SLTHttpClientMock executedSuccessfullyWithStatusCode:statusCode200 response:userResponse];

            [userApi sendReaction:type
                            value:value
                           userId:userId
                      expiresTime:expiresTime
                                success:^(SLOtherUserResponse * _Nonnull userResponse) {

                                    expect(userResponse).notTo.beNil();
                                    expect(userResponse.user).notTo.beNil();
                                    expect(userResponse.additionalInfo).notTo.beNil();

                                } failure:nil];

        });

        it(@"send  failure #1", ^{

            userApi.httpClient = [SLTHttpClientMock executedSuccessfullyWithStatusCode:statusCode400 response:errorResponse];

            [userApi sendReaction:type
                            value:value
                           userId:userId
                      expiresTime:expiresTime
                                success:nil
                                failure:^(NSError * _Nullable error) {
                                    expect(error).to.beNil();
                                }];

        });

        it(@"send  failure #1", ^{

            userApi.httpClient = [SLTHttpClientMock executedSuccessfullyWithStatusCode:statusCode400 response:nil];

            [userApi sendReaction:type
                            value:value
                           userId:userId
                            expiresTime:expiresTime
                                success:nil
                                failure:^(NSError * _Nullable error) {
                                    expect(error).to.beNil();
                                }];
        });

        it(@"remove success", ^{

            userApi.httpClient = [SLTHttpClientMock executedSuccessfullyWithStatusCode:statusCode200 response:nil];

            [userApi removeReactionByType:type
                                userId:userId
                               success:^(SLResponse * _Nonnull response) {
                                   expect(response).notTo.beNil();
                               } failure:nil];
        });

        it(@"remove failure", ^{

            userApi.httpClient = [SLTHttpClientMock executedSuccessfullyWithStatusCode:statusCode400 response:nil];

            [userApi removeReactionByType:type
                                userId:userId
                               success:nil
                               failure:^(NSError * _Nullable error) {
                                   expect(error).to.beNil();
                               }];
        });

    });
});

SpecEnd