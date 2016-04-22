//
//  SLUsersFilterResponseTests.m
//  SoulSDK
//
//  Created by Mikhail on 05.04.16.
//  Copyright © 2016 Mikhail Shershnev. All rights reserved.
//

#import "SLTUsersResponseDataManager.h"

SpecBegin(SLUsersFilterResponse)

describe(@"users filter response object mapping", ^{

    // given
    SLTUsersResponseDataManager *usersResponseData = [SLTUsersResponseDataManager new];
    NSDictionary *usersFilterResponse = [usersResponseData usersFilterResponse];

    NSObject <SLUsersFilterResponseMapperProtocol> *mapper = [SLUsersFilterResponseMapper new];

    it(@"users filter response mapping from nil dict", ^{

        NSDictionary *dict = nil;
        SLUsersFilterResponse *usersFiler = [mapper mapUsersFilterResponse:dict];

        expect(usersFiler).to.beNil();
    });

    it(@"users filter response mapping from empty dict", ^{

        NSDictionary *dict = @{};
        SLUsersFilterResponse *usersFiler = [mapper mapUsersFilterResponse:dict];

        expect(usersFiler).to.beNil();
    });

    it(@"users filter response mapping", ^{

        NSDictionary *dict = usersFilterResponse;
        SLUsersFilterResponse *usersFiler = [mapper mapUsersFilterResponse:dict];

        expect(usersFiler).notTo.beNil();
        expect(usersFiler.meta).notTo.beNil();
        expect(usersFiler.users).notTo.beNil();
        expect(usersFiler.additionalInfo).notTo.beNil();
    });
});

SpecEnd