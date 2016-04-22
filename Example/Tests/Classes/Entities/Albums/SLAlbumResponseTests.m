//
//  SLAlbumResponseTests.m
//  SoulSDK
//
//  Created by Mikhail on 01.04.16.
//  Copyright © 2016 Mikhail Shershnev. All rights reserved.
//

#import "SLTAlbumsResponseDataManager.h"
#import "SLTAlbumResponseDataManager.h"

SpecBegin(SLAlbumResponse)

describe(@"album object mapping", ^{

    // given
    SLTAlbumResponseDataManager *albumResponseData = [SLTAlbumResponseDataManager new];
    NSDictionary *responseDict = [albumResponseData albumResponse];

    NSObject <SLAlbumResponseMapperProtocol> *mapper = [SLAlbumResponseMapper new];

    it(@"mapping from nil dict", ^{

        NSDictionary *dict = nil;
        SLAlbumResponse *albumResponse = [mapper mapAlbumResponse:dict];

        expect(albumResponse).to.beNil();
    });

    it(@"mapping from empty dict", ^{

        NSDictionary *dict = @{};
        SLAlbumResponse *albumResponse = [mapper mapAlbumResponse:dict];

        expect(albumResponse).to.beNil();
    });

    it(@"normal mapping", ^{

        NSDictionary *dict = responseDict;
        SLAlbumResponse *albumResponse = [mapper mapAlbumResponse:dict];

        expect(albumResponse).notTo.beNil();
        expect(albumResponse.album).notTo.beNil();
        expect(albumResponse.additionalInfo).notTo.beNil();
    });
    
});

SpecEnd
