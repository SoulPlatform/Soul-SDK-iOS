//
//  SLMiniAlbumsResponseTests.m
//  SoulSDK
//
//  Created by Mikhail on 30.03.16.
//  Copyright © 2016 Mikhail Shershnev. All rights reserved.
//

#import "SLTAlbumsResponseDataManager.h"

SpecBegin(SLMiniAlbumsResponse)

describe(@"album object mapping", ^{

    // given
    SLTAlbumsResponseDataManager *albumsResponseData = [SLTAlbumsResponseDataManager new];
    NSDictionary *responseDict = [albumsResponseData miniAlbumsResponse];

    NSObject <SLMiniAlbumsResponseMapperProtocol> *mapper = [SLMiniAlbumsResponseMapper new];

    it(@"mapping from nil dict", ^{

        NSDictionary *dict = nil;
        SLMiniAlbumsResponse *miniAlbumsResponse = [mapper mapMiniAlbumsResponse:dict];

        expect(miniAlbumsResponse).to.beNil();
    });

    it(@"mapping from empty dict", ^{

        NSDictionary *dict = @{};
        SLMiniAlbumsResponse *miniAlbumsResponse = [mapper mapMiniAlbumsResponse:dict];

        expect(miniAlbumsResponse).to.beNil();
    });

    it(@"normal mapping", ^{

        NSDictionary *dict = responseDict;
        SLMiniAlbumsResponse *miniAlbumsResponse = [mapper mapMiniAlbumsResponse:dict];

        expect(miniAlbumsResponse).notTo.beNil();
    });

});

SpecEnd