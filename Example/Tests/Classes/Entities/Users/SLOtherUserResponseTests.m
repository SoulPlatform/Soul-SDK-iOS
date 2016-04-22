//
//  SLOtherUserResponseTests.m
//  SoulSDK
//
//  Created by Mikhail on 06.04.16.
//  Copyright © 2016 Mikhail Shershnev. All rights reserved.
//

//#import "SLTUserDataManager.h"
#import "SLTUserResponseDataManager.h"

SpecBegin(SLOtherUserResponse)

describe(@"other user response object mapping", ^{

    // given
    SLTUserResponseDataManager *userResponseData = [SLTUserResponseDataManager new];
    NSDictionary *userResponse = [userResponseData userResponse];

    NSObject<SLOtherUserResponseMapperProtocol> *mapper = [SLOtherUserResponseMapper new];

    it(@"other user response mapping from nil dict", ^{

        NSDictionary *dict = nil;
        SLOtherUserResponse *resp = [mapper mapOtherUserResponse:dict];

        expect(resp).to.beNil();
    });

    it(@"other user response mapping from empty dict", ^{

        NSDictionary *dict = @{};
        SLOtherUserResponse *resp = [mapper mapOtherUserResponse:dict];

        expect(resp).to.beNil();
    });

    it(@"other user response mapping", ^{

        NSDictionary *dict = userResponse;
        SLOtherUserResponse *resp = [mapper mapOtherUserResponse:dict];

        expect(resp).notTo.beNil();
        expect(resp.user).notTo.beNil();
        expect(resp.additionalInfo).notTo.beNil();
    });

});

SpecEnd