//
//  SLApiPhotoTestSpec.m
//  SoulSDK
//
//  Created by Mikhail on 05.04.16.
//  Copyright © 2016 Mikhail Shershnev. All rights reserved.
//

#import "SLTHttpClientMock.h"
#import "SLTPhotoDataManager.h"

SpecBegin(SLApiPhoto)

describe(@"photo endpoint", ^{

    NSObject<SLHttpClientProtocol> *httpClient;
    SLApiPhoto *photoApi = [[SLApiPhoto alloc] initWithHttpClient:httpClient storage:nil config:nil];

    SLTPhotoDataManager *photoData = [SLTPhotoDataManager new];
    NSDictionary *photoResponse = [photoData photoResponse];

    NSInteger statusCode200 = 200;
    NSInteger statusCode400 = 400;

    NSString *photoId = @"";
    NSString *albumName = @"";
    
    describe(@"get photo album", ^{

        it(@"loading success", ^{

            photoApi.httpClient = [SLTHttpClientMock executedSuccessfullyWithStatusCode:statusCode200 response:photoResponse];

            [photoApi loadById:photoId
                     fromAlbum:albumName
                       success:^(SLPhotoResponse * _Nonnull photoResponse) {
                           expect(photoResponse).notTo.beNil();
                           expect(photoResponse.photo).notTo.beNil();
                           expect(photoResponse.additionalInfo).notTo.beNil();
                       }
                       failure:nil];
        });

        it(@"loading failure", ^{

            photoApi.httpClient = [SLTHttpClientMock executedSuccessfullyWithStatusCode:statusCode400 response:nil];

            [photoApi loadById:photoId
                     fromAlbum:albumName
                       success:nil
                       failure:^(NSError * _Nullable error) {
                           expect(error).to.beNil();
                       }];
        });
    });

    describe(@"update photo info", ^{

        NSNumber *expiresTime = @(1447196497.291);

        it(@"updated successful", ^{

            photoApi.httpClient = [SLTHttpClientMock executedSuccessfullyWithStatusCode:statusCode200 response:photoResponse];

            [photoApi updateById:photoId
                       fromAlbum:albumName
                  setExpiresTime:expiresTime
                         success:^(SLPhotoResponse * _Nonnull photoResponse) {
                             expect(photoResponse).notTo.beNil();
                             expect(photoResponse.photo).notTo.beNil();
                             expect(photoResponse.additionalInfo).notTo.beNil();
                         }
                         failure:nil];
        });

        it(@"updated failure", ^{

            photoApi.httpClient = [SLTHttpClientMock executedSuccessfullyWithStatusCode:statusCode400 response:nil];

            [photoApi updateById:photoId
                       fromAlbum:albumName
                  setExpiresTime:expiresTime
                         success:nil
                         failure:^(NSError * _Nullable error) {
                             expect(error).to.beNil();
                         }];
        });

    });

    describe(@"remove photo", ^{

        it(@"remove successful", ^{

            photoApi.httpClient = [SLTHttpClientMock executedSuccessfullyWithStatusCode:statusCode200 response:nil];

            [photoApi removeById:photoId
                       fromAlbum:albumName
                         success:^{
                             expect(YES).to.beTruthy();
                         }
                         failure:nil];
        });

        it(@"remove failure", ^{

            photoApi.httpClient = [SLTHttpClientMock executedSuccessfullyWithStatusCode:statusCode400 response:nil];

            [photoApi removeById:photoId
                       fromAlbum:albumName
                         success:nil
                         failure:^(NSError * _Nullable error) {
                             expect(error).to.beNil();
                         }];
        });

    });
    
});

SpecEnd