//
//  SLApiMeTestSpec.m
//  SoulSDK
//
//  Created by Mikhail on 29.03.16.
//  Copyright © 2016 Mikhail Shershnev. All rights reserved.
//

@class SLTHttpClientMock;
#import "SLTHttpClientMock.h"

#import "SLTErrorResponseDataManager.h"
#import "SLTUserResponseDataManager.h"
#import "SLTAvailableSubscriptionsDataManager.h"

#import "SLTAlbumsDataManager.h"
#import "SLTAdditionalInfoDataManager.h"
#import "SLTPagingOffsetMetaDataManager.h"

#import "SLTAlbumsResponseDataManager.h"
#import "SLTUserDataManager.h"
#import "SLNotificationTokensMapper.h"
#import "SLUserParametersMapper.h"

SpecBegin(SLApiMe)

describe(@"/me/ endpoints", ^{

    NSObject<SLHttpClientProtocol> *httpClient;
    SLApiMe *meApi = [[SLApiMe alloc] initWithHttpClient:httpClient storage:nil config:nil];

    NSInteger statusCode200 = 200;
    NSInteger statusCode400 = 401;

    SLTErrorResponseDataManager *errorResponseData = [SLTErrorResponseDataManager new];
    SLTUserResponseDataManager *userResponseData = [SLTUserResponseDataManager new];
    
    NSDictionary *errorResponse = [errorResponseData errorResponse];
    NSDictionary *meUserResponse = [userResponseData meUserResponse];

    describe(@"/me endpoint", ^{

        // GET
        it(@"GET current user successful", ^{

            meApi.httpClient = [SLTHttpClientMock executedSuccessfullyWithStatusCode:statusCode200 response:meUserResponse];

            [meApi loadWithSuccess:^(SLMeUserResponse * _Nonnull meEntity) {
                expect(meEntity).notTo.beNil();
                expect(meEntity.me).notTo.beNil();
                expect(meEntity.additionalInfo).notTo.beNil();
            } failure:nil];

        });

        it(@"GET current user failure", ^{

            meApi.httpClient = [SLTHttpClientMock executedSuccessfullyWithStatusCode:statusCode400 response:nil];

            [meApi loadWithSuccess:nil failure:^(NSError * _Nullable error) {
                expect(error).to.beNil();
            }];
            
        });

        // PATCH
        SLTUserDataManager *userData = [SLTUserDataManager new];

        NSDictionary *tokensDict = [userData tokens];
        NSObject <SLNotificationTokensMapperProtocol> *tokensMapper = [SLNotificationTokensMapper new];
        SLNotificationTokens *tokens = [tokensMapper mapNotificationTokens:tokensDict];

        //NSDictionary *parametersDict = [userData parameters];
        //NSObject <SLUserParametersMapperProtocol> *parametersMapper = [SLUserParametersMapper new];
        //SLUserParameters *parameters = [parametersMapper mapParameters:parametersDict];

        it(@"PATCH current user successful", ^{

            meApi.httpClient = [SLTHttpClientMock executedSuccessfullyWithStatusCode:statusCode200 response:meUserResponse];

            [meApi setTokens:tokens
                     success:^(SLMeUserResponse * _Nonnull meEntity) {

                         expect(meEntity).notTo.beNil();
                         expect(meEntity.me).notTo.beNil();
                         expect(meEntity.additionalInfo).notTo.beNil();

                     } failure:nil];
            
        });

        it(@"PATCH current user failure", ^{
            
            meApi.httpClient = [SLTHttpClientMock executedSuccessfullyWithStatusCode:statusCode400 response:errorResponse];
            
            [meApi setTokens:tokens
                     success:nil
                     failure:^(NSError * _Nullable error) {
                         expect(error).to.beNil();
                     }];
        });
        
    });

    describe(@"/me/products/subscriptions/available endpoint", ^{

        // GET
        it(@"GET available subscriptions products successful", ^{

            SLTAvailableSubscriptionsDataManager *productsData = [SLTAvailableSubscriptionsDataManager new];
            NSDictionary *productsDict = [productsData products];

            meApi.httpClient = [SLTHttpClientMock executedSuccessfullyWithStatusCode:statusCode200 response:productsDict];

            [meApi loadProductsWithSuccess:^(SLAvailableSubscriptions * _Nonnull products) {

                expect(products).notTo.beNil();
                expect(products.items).notTo.beNil();
                expect(products.items).to.haveCountOf(2);

            } failure:nil];

        });

        it(@"GET available subscriptions products failure", ^{

            meApi.httpClient = [SLTHttpClientMock executedSuccessfullyWithStatusCode:statusCode400 response:nil];

            [meApi loadProductsWithSuccess:nil failure:^(NSError * _Nullable error) {
                expect(error).to.beNil();
            }];
        });

    });

    describe(@"/me/albums endpoint", ^{

        NSNumber *offset = @(0);
        NSNumber *limit = @(20);

        // GET
        it(@"GET current user albums successful", ^{

            SLTAlbumsResponseDataManager *albumsResponseData = [SLTAlbumsResponseDataManager new];
            NSDictionary *miniAlbumsResponseDict = [albumsResponseData miniAlbumsResponse];

            meApi.httpClient = [SLTHttpClientMock executedSuccessfullyWithStatusCode:statusCode200 response:miniAlbumsResponseDict];

            [meApi loadAlbumsWithOffset:offset
                               limit:limit
                             success:^(SLMiniAlbumsResponse * _Nonnull albumsResponse) {

                                 expect(albumsResponse).notTo.beNil();
                                 expect(albumsResponse.meta).notTo.beNil();
                                 expect(albumsResponse.albums).notTo.beNil();
                                 expect(albumsResponse.additionalInfo).notTo.beNil();
                             }
                             failure:nil];

        });

        it(@"GET current user albums failure", ^{

            meApi.httpClient = [SLTHttpClientMock executedSuccessfullyWithStatusCode:statusCode400 response:nil];

            [meApi loadAlbumsWithOffset:offset
                                 limit:limit
                               success:nil
                               failure:^(NSError * _Nullable error) {
                                   expect(error).to.beNil();
                               }];
        });

        // POST
        NSString *albumName = @"New album";
        SLAlbumPrivacy privacy = SLAlbumPrivacyPrivate;
        NSDictionary *parameters = @{};

        it(@"POST create new albums successful", ^{

            meApi.httpClient = [SLTHttpClientMock executedSuccessfullyWithStatusCode:statusCode200 response:nil];

            [meApi addAlbumWithName:albumName
                         privacy:privacy
                      parameters:parameters
                         success:^{
                             expect(1).to.equal(@1);
                         }
                         failure:nil];

        });

        it(@"POST create new albums failure", ^{

            meApi.httpClient = [SLTHttpClientMock executedSuccessfullyWithStatusCode:statusCode400 response:errorResponse];

            [meApi addAlbumWithName:albumName
                         privacy:privacy
                      parameters:parameters
                         success:nil
                         failure:^(NSError * _Nullable error) {
                             expect(error).to.beNil();
                         }];
        });
    });

    describe(@"add receipt", ^{

        NSString *receipt = @"ewpfkwepoj{)Jofj90woefhjnwepf9hjwe9f[0jwef90whj3[409fgh4woghw40p9gh39ifjo34pfj34igl";
        NSString *signature = @"ewpofjwejf09j9fj230f[23jf23f0h32rj32or32jro32r";

        it(@"success", ^{

            meApi.httpClient = [SLTHttpClientMock executedSuccessfullyWithStatusCode:statusCode200 response:meUserResponse];

            [meApi addReceipt:receipt
                 signature:signature
                   success:^(SLMeUserResponse * _Nonnull meEntity) {

                       expect(meEntity).notTo.beNil();
                       expect(meEntity.me).notTo.beNil();
                       expect(meEntity.additionalInfo).notTo.beNil();

                   } failure:nil];

        });

        it(@"failure #1", ^{

            meApi.httpClient = [SLTHttpClientMock executedSuccessfullyWithStatusCode:statusCode400 response:errorResponse];

            [meApi addReceipt:receipt
                 signature:signature
                   success:nil
                   failure:^(NSError * _Nullable error) {
                       expect(error).to.beNil();
                   }];
        });

        it(@"failure #2", ^{

            meApi.httpClient = [SLTHttpClientMock executedSuccessfullyWithStatusCode:statusCode400 response:nil];

            [meApi addReceipt:receipt
                 signature:signature
                   success:nil
                   failure:^(NSError * _Nullable error) {
                       expect(error).to.beNil();
                   }];
        });

    });
});

SpecEnd