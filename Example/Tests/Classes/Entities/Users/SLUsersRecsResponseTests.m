//
//  SLUsersRecsResponseTests.m
//  SoulSDK
//
//  Created by Mikhail on 05.04.16.
//  Copyright © 2016 Mikhail Shershnev. All rights reserved.
//

#import "SLTUsersResponseDataManager.h"

SpecBegin(SLUsersRecsResponse)

describe(@"users recs response object mapping", ^{

    // given
    SLTUsersResponseDataManager *usersResponseData = [SLTUsersResponseDataManager new];
    NSDictionary *usersRecsResponse = [usersResponseData usersRecsResponse];

    NSObject <SLUsersRecsResponseMapperProtocol> *mapper = [SLUsersRecsResponseMapper new];

    it(@"users recs response mapping from nil dict", ^{

        NSDictionary *dict = nil;
        SLUsersRecsResponse *usersRecs = [mapper mapUsersRecsResponse:dict];
        
        expect(usersRecs).to.beNil();
    });

    it(@"users recs response mapping from empty dict", ^{

        NSDictionary *dict = @{};
        SLUsersRecsResponse *usersRecs = [mapper mapUsersRecsResponse:dict];

        expect(usersRecs).to.beNil();
    });

    it(@"users recs response mapping", ^{

        NSDictionary *dict = usersRecsResponse;
        SLUsersRecsResponse *usersRecs = [mapper mapUsersRecsResponse:dict];

        expect(usersRecs).notTo.beNil();
        expect(usersRecs.meta).notTo.beNil();
        expect(usersRecs.users).notTo.beNil();
        expect(usersRecs.additionalInfo).notTo.beNil();
    });
});

SpecEnd