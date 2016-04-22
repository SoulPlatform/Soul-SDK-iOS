//
//  SLAuthorizationTests.m
//  SoulSDK
//
//  Created by Mikhail on 24.02.16.
//  Copyright © 2016 Mikhail Shershnev. All rights reserved.
//

#import "SLTAuthorizationDataManager.h"

SpecBegin(SLAuthorization)

describe(@"authorization mapping", ^{

    // given
    SLTAuthorizationDataManager *authorizationDataManager = [SLTAuthorizationDataManager new];

    double expiresTimeDouble = [authorizationDataManager expiresTimeDouble];
    NSString *expiresTimeString = [authorizationDataManager expiresTimeString];

    NSString *sessionTokenString = [authorizationDataManager sessionToken];

    SLAuthorizationMapper *authorizationMapper = [SLAuthorizationMapper new];

    //
    it(@"mapping from nil dict", ^{

        NSDictionary *dict = nil;
        SLAuthorization *authorization = [authorizationMapper mapAuthorization:dict];

        expect(authorization).to.beNil();
    });

    it(@"mapping from empty dict", ^{

        NSDictionary *dict = @{};
        SLAuthorization *authorization = [authorizationMapper mapAuthorization:dict];

        //
        expect(authorization.sessionToken).to.beNil();
    });

    it(@"mapping #1", ^{
        
        NSDictionary *dict = @{
                               kExpiresTimeKey: @(expiresTimeDouble),
                               kSessionTokenKey: sessionTokenString,
                               };

        SLAuthorization *authorization = [authorizationMapper mapAuthorization:dict];

        //
        expect(authorization.expiresTime).to.equal(expiresTimeDouble);
        expect(authorization.sessionToken).to.equal(sessionTokenString);
    });

    it(@"mapping #2", ^{

        NSDictionary *dict = @{
                               kExpiresTimeKey: expiresTimeString,
                               kSessionTokenKey: sessionTokenString,
                               };

        SLAuthorization *authorization = [authorizationMapper mapAuthorization:dict];

        //
        expect(authorization.expiresTime).to.equal(expiresTimeDouble);
        expect(authorization.sessionToken).to.equal(sessionTokenString);
    });

    it(@"mapping from NSNull", ^{

        NSDictionary *dict = @{
                               kExpiresTimeKey: [NSNull null],
                               kSessionTokenKey: [NSNull null],
                               };

        SLAuthorization *authorization = [authorizationMapper mapAuthorization:dict];

        //
        expect(authorization.sessionToken).to.beNil();
    });
    
});

SpecEnd