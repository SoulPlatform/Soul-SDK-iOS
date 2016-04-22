//
//  SLEventReactionsTests.m
//  SoulSDK
//
//  Created by Mikhail on 16.03.16.
//  Copyright © 2016 Mikhail Shershnev. All rights reserved.
//

SpecBegin(SLEventReactions)

describe(@"event reactions type object mapping", ^{

    // given
    NSString *kUserKey = @"user";
    NSString *kUserIdKey = @"id";
    NSString *kReactionsKey = @"receivedFromUser";

    NSString *userId = @"3vn2ivwm13z";

    NSDictionary *userDict = @{
                               kUserIdKey: userId,
                               };

    NSDictionary *receivedDict = @{
                                   @"liking": @{
                                           @"value": @"disliked",
                                           @"expiresTime": @(1447190239.492),
                                           },
                                   @"blocking": [NSNull null],
                               };

    NSObject<SLEventReactionsMapperProtocol> *reactionsMapper = [SLEventReactionsMapper new];
    NSObject<SLEventReactionsUserMapperProtocol> *userMapper = [SLEventReactionsUserMapper new];

    ////////////////////////////////////////////////////
    // SLEventReactionsUserMapper
    ////////////////////////////////////////////////////
    it(@"SLEventReactionsUser mapping from nil dict", ^{

        NSDictionary *dict = nil;

        SLEventReactionsUser *user = [userMapper mapEventReactionsUser:dict];
        expect(user).to.beNil();
    });
    
    it(@"SLEventReactionsUser mapping from empty dict", ^{

        NSDictionary *dict = @{};

        SLEventReactionsUser *user = [userMapper mapEventReactionsUser:dict];
        expect(user).to.beNil();
    });

    it(@"SLEventReactionsUser mapping", ^{

        NSDictionary *dict = userDict;

        SLEventReactionsUser *user = [userMapper mapEventReactionsUser:dict];

        expect(user).notTo.beNil();
        expect(user.userId).to.equal(userId);
    });
    
    it(@"SLEventReactionsUser mapping from NSNull", ^{
        
        NSDictionary *dict = @{
                               kUserIdKey: [NSNull null],
                               };
        SLEventReactionsUser *user = [userMapper mapEventReactionsUser:dict];

        expect(user).to.beNil();
    });

    ////////////////////////////////////////////////////
    // SLEventReactionsMapper
    ////////////////////////////////////////////////////
    it(@"SLEventReactions mapping from nil dict", ^{

        NSDictionary *dict = nil;

        SLEventReactions *reactions = [reactionsMapper mapEventReactions:dict];
        expect(reactions).to.beNil();
    });

    it(@"SLEventReactions mapping from empty dict", ^{

        NSDictionary *dict = @{};

        SLEventReactions *reactions = [reactionsMapper mapEventReactions:dict];
        expect(reactions).to.beNil();
    });

    it(@"SLEventReactions mapping", ^{

        NSDictionary *dict = @{
                               kUserKey: userDict,
                               kReactionsKey: receivedDict,
                               };

        SLEventReactions *reactions = [reactionsMapper mapEventReactions:dict];

        expect(reactions).notTo.beNil();
        expect(reactions.user).notTo.beNil();
        expect(reactions.received).notTo.beNil();
    });

    it(@"SLEventReactions mapping from NSNull", ^{

        NSDictionary *dict = @{
                               kUserKey: [NSNull null],
                               kReactionsKey: [NSNull null],
                               };

        SLEventReactions *reactions = [reactionsMapper mapEventReactions:dict];
        expect(reactions).to.beNil();
    });

});

SpecEnd