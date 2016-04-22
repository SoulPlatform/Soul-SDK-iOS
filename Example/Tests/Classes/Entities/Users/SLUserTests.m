//
//  SLUserTests.m
//  SoulSDK
//
//  Created by Mikhail on 08.03.16.
//  Copyright © 2016 Mikhail Shershnev. All rights reserved.
//

#import "SLTUserDataManager.h"

SpecBegin(SLUser)

describe(@"user object mapping", ^{

    // given
    SLTUserDataManager *userDataManager = [SLTUserDataManager new];

    NSDictionary *meUserDict = [userDataManager meUser];
    NSDictionary *otherUserDict = [userDataManager user];

    SLUserMapper *userMapper = [SLUserMapper new];
    
    ////////////////////////////////////////////////////
    // SLMeUser
    ////////////////////////////////////////////////////

    it(@"me user mapping from nil dict", ^{

        NSDictionary *dict = nil;
        SLMeUser *meUser = [userMapper mapMeUser:dict];

        expect(meUser).to.beNil();
    });
    
    it(@"me user mapping from empty dict", ^{
        
        NSDictionary *dict = @{};
        SLMeUser *meUser = [userMapper mapMeUser:dict];

        expect(meUser).to.beNil();
    });
    
    it(@"me user mapping", ^{
        
        NSDictionary *dict = meUserDict;
        SLMeUser *meUser = [userMapper mapMeUser:dict];

        expect(meUser).notTo.beNil();
        expect(meUser.albums).notTo.beNil();
        expect(meUser.parameters).notTo.beNil();

        expect(meUser.notificationTokens).notTo.beNil();
        expect(meUser.subscriptionServices).notTo.beNil();
    });

    it(@"me user mapping from NSNull", ^{
        
        NSDictionary *dict = @{
                               kIdKey: [NSNull null],
                               kTokensKey: [NSNull null],
                               kServicesKey: [NSNull null],
                               kParametersKey: [NSNull null],
                               kAlbumsKey: [NSNull null],
                               };
        
        SLMeUser *meUser = [userMapper mapMeUser:dict];
        
        expect(meUser).to.beNil();
    });
    
    ////////////////////////////////////////////////////
    // SLUser
    ////////////////////////////////////////////////////

    it(@"other user mapping from nil dict", ^{

        NSDictionary *dict = nil;
        SLUser *otherUser = [userMapper mapOtherUser:dict];

        expect(otherUser).to.beNil();
    });

    it(@"other user mapping from empty dict", ^{

        NSDictionary *dict = @{};
        SLUser *otherUser = [userMapper mapOtherUser:dict];

        expect(otherUser).to.beNil();
    });

    it(@"other user mapping", ^{

        NSDictionary *dict = otherUserDict;
        SLUser *otherUser = [userMapper mapOtherUser:dict];

        expect(otherUser).notTo.beNil();
        expect(otherUser.albums).notTo.beNil();
        expect(otherUser.parameters).notTo.beNil();

        expect(otherUser.chat).notTo.beNil();
        expect(otherUser.reactions).notTo.beNil();
    });

    it(@"other user mapping from NSNull", ^{

        NSDictionary *dict = @{
                               kIdKey: [NSNull null],
                               kRecordIdKey: [NSNull null],
                               kChatKey: [NSNull null],
                               kReactionsKey: [NSNull null],
                               kParametersKey: [NSNull null],
                               kAlbumsKey: [NSNull null],
                               };

        SLUser *otherUser = [userMapper mapOtherUser:dict];

        expect(otherUser).to.beNil();
    });

});

SpecEnd