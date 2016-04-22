//
//  SLApiAlbumTestSpec.m
//  SoulSDK
//
//  Created by Mikhail on 01.04.16.
//  Copyright © 2016 Mikhail Shershnev. All rights reserved.
//

#import "SLTHttpClientMock.h"
#import "SLTPhotoDataManager.h"
#import "SLTAlbumResponseDataManager.h"
#import "SLTErrorResponseDataManager.h"

SpecBegin(SLApiAlbum)

describe(@"album endpoint", ^{

    NSObject<SLHttpClientProtocol> *httpClient;
    SLApiAlbum *albumApi = [[SLApiAlbum alloc] initWithHttpClient:httpClient storage:nil config:nil];

    SLTAlbumResponseDataManager *albumResponseData = [SLTAlbumResponseDataManager new];
    NSDictionary *albumResponse = [albumResponseData albumResponse];

    NSString *albumName = @"Best album ever";

    NSInteger statusCode200 = 200;
    NSInteger statusCode400 = 400;

    describe(@"load album", ^{

        it(@"loading success", ^{

            albumApi.httpClient = [SLTHttpClientMock executedSuccessfullyWithStatusCode:statusCode200 response:albumResponse];

            [albumApi loadByName:albumName
                         success:^(SLAlbumResponse * _Nonnull albumResponse) {
                             expect(albumResponse).notTo.beNil();
                             expect(albumResponse.album).notTo.beNil();
                             expect(albumResponse.additionalInfo).notTo.beNil();
            } failure:nil];
        });
        
        it(@"loading failure", ^{

            albumApi.httpClient = [SLTHttpClientMock executedSuccessfullyWithStatusCode:statusCode400 response:nil];

            [albumApi loadByName:albumName
                         success:nil
                         failure:^(NSError * _Nullable error) {
                             expect(error).to.beNil();
                         }];
        });

    });
    
    describe(@"update album info", ^{

        NSString *newAlbumName = @"New album";
        SLAlbumPrivacy privacy = SLAlbumPrivacyPrivate;
        NSDictionary *parameters = @{};

        it(@"updated successful", ^{

            albumApi.httpClient = [SLTHttpClientMock executedSuccessfullyWithStatusCode:statusCode200 response:nil];

            [albumApi updateByName:newAlbumName privacy:privacy parameters:parameters success:^{
                expect(YES).to.beTruthy();
            } failure:nil];
        });

        it(@"updated failure", ^{

            albumApi.httpClient = [SLTHttpClientMock executedSuccessfullyWithStatusCode:statusCode400 response:nil];

            [albumApi updateByName:newAlbumName
                           privacy:privacy
                        parameters:parameters
                           success:nil
                           failure:^(NSError * _Nullable error) {
                               expect(error).to.beNil();
                           }];
        });

    });

    describe(@"remove album", ^{

        it(@"remove successful", ^{

            albumApi.httpClient = [SLTHttpClientMock executedSuccessfullyWithStatusCode:statusCode200 response:nil];

            [albumApi removeByName:albumName success:^{
                expect(YES).to.beTruthy();
            } failure:nil];
        });

        it(@"remove failure", ^{

            albumApi.httpClient = [SLTHttpClientMock executedSuccessfullyWithStatusCode:statusCode400 response:nil];

            [albumApi removeByName:albumName
                           success:nil
                           failure:^(NSError * _Nullable error) {
                               expect(error).to.beNil();
                           }];
        });

    });

    describe(@"add photo to album", ^{

        NSData *imageData = [NSData new];

        it(@"adding successful", ^{

            SLTPhotoDataManager *photoData = [SLTPhotoDataManager new];
            NSDictionary *photoResponse = [photoData photoResponse];

            albumApi.httpClient = [SLTHttpClientMock executedSuccessfullyWithStatusCode:statusCode200 response:photoResponse];

            [albumApi addPhoto:imageData
                       toAlbum:albumName
                       success:^(SLPhotoResponse * _Nonnull photoResponse) {
                           expect(photoResponse).notTo.beNil();
                           expect(photoResponse.photo).notTo.beNil();
                           expect(photoResponse.additionalInfo).notTo.beNil();
                       } failure:nil];
        });

        it(@"adding failure #1", ^{

            SLTErrorResponseDataManager *errorResponseData = [SLTErrorResponseDataManager new];
            NSDictionary *photoResponse = [errorResponseData errorResponse];

            albumApi.httpClient = [SLTHttpClientMock executedSuccessfullyWithStatusCode:statusCode400 response:photoResponse];

            [albumApi addPhoto:imageData
                      toAlbum:albumName
                       success:nil
                       failure:^(NSError * _Nullable error) {
                           expect(error).to.beNil();
                       }];
        });

        it(@"adding failure #2", ^{

            albumApi.httpClient = [SLTHttpClientMock executedSuccessfullyWithStatusCode:statusCode400 response:nil];

            [albumApi addPhoto:imageData
                      toAlbum:albumName
                       success:nil
                       failure:^(NSError * _Nullable error) {
                           expect(error).to.beNil();
                       }];
        });

    });

});

SpecEnd