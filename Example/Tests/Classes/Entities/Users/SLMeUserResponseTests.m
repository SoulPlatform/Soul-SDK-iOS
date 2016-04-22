//
//  SLMeUserResponseTests.m
//  SoulSDK
//
//  Created by Mikhail on 09.03.16.
//  Copyright © 2016 Mikhail Shershnev. All rights reserved.
//

#import "SLTUserDataManager.h"
#import "SLTUserResponseDataManager.h"

SpecBegin(SLMeUserResponse)

describe(@"me user response object mapping", ^{

    // given
    SLTUserResponseDataManager *userResponseData = [SLTUserResponseDataManager new];
    NSDictionary *meUserResponseDict = [userResponseData meUserResponse];

    NSObject<SLMeUserResponseMapperProtocol> *resMapper = [SLMeUserResponseMapper new];

    it(@"me user response mapping from nil dict", ^{

        NSDictionary *dict = nil;
        SLMeUserResponse *res = [resMapper mapMeUserResponse:dict];

        expect(res).to.beNil();
    });

    it(@"me user response mapping from empty dict", ^{

        NSDictionary *dict = @{};
        SLMeUserResponse *res = [resMapper mapMeUserResponse:dict];

        expect(res).to.beNil();
    });

    it(@"me user response mapping", ^{

        NSDictionary *dict = meUserResponseDict;
        SLMeUserResponse *res = [resMapper mapMeUserResponse:dict];

        expect(res).notTo.beNil();
        expect(res.me).notTo.beNil();
        expect(res.additionalInfo).notTo.beNil();
    });

    it(@"me user response mapping from NSNull", ^{

        NSDictionary *dict = @{
                               kMeKey: [NSNull null],
                               kInfoKey: [NSNull null],
                               };

        SLMeUserResponse *res = [resMapper mapMeUserResponse:dict];

        expect(res).to.beNil();
    });

});

SpecEnd