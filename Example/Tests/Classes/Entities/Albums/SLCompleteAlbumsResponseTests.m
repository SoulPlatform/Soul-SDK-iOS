//
//  SLCompleteAlbumsResponseTests.m
//  SoulSDK
//
//  Created by Mikhail on 07.04.16.
//  Copyright © 2016 Mikhail Shershnev. All rights reserved.
//

#import "SLTAlbumsResponseDataManager.h"

SpecBegin(SLCompleteAlbumsResponse)

describe(@"complete albums mapping", ^{

    // given
    SLTAlbumsResponseDataManager *albumsResponseData = [SLTAlbumsResponseDataManager new];
    NSDictionary *responseDict = [albumsResponseData completeAlbumsResponse];

    NSObject <SLCompleteAlbumsResponseMapperProtocol> *mapper = [SLCompleteAlbumsResponseMapper new];

    it(@"mapping from nil dict", ^{

        NSDictionary *dict = nil;
        SLCompleteAlbumsResponse *completeAlbumsResponse = [mapper mapCompleteAlbumsResponse:dict];
        
        expect(completeAlbumsResponse).to.beNil();
    });

    it(@"mapping from empty dict", ^{

        NSDictionary *dict = @{};
        SLCompleteAlbumsResponse *completeAlbumsResponse = [mapper mapCompleteAlbumsResponse:dict];

        expect(completeAlbumsResponse).to.beNil();
    });

    it(@"normal mapping", ^{

        NSDictionary *dict = responseDict;
        SLCompleteAlbumsResponse *completeAlbumsResponse = [mapper mapCompleteAlbumsResponse:dict];

        expect(completeAlbumsResponse).notTo.beNil();
        expect(completeAlbumsResponse.albums).notTo.beNil();
        expect(completeAlbumsResponse.meta).notTo.beNil();
        expect(completeAlbumsResponse.additionalInfo).notTo.beNil();
    });

});

SpecEnd
