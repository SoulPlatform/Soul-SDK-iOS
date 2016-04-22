//
//  SLReactionsTests.m
//  SoulSDK
//
//  Created by Mikhail on 08.03.16.
//  Copyright © 2016 Mikhail Shershnev. All rights reserved.
//

#import "SLTReactionsDataManager.h"

SpecBegin(SLReactions)

describe(@"reactions object mapping", ^{

    // given
    SLTReactionsDataManager *reactionsData = [SLTReactionsDataManager new];
    NSDictionary *reactionsDict = [reactionsData reactions];

    SLReactionsMapper *mapper = [SLReactionsMapper new];

    it(@"reactions object mapping from nil dict", ^{

        NSDictionary *dict = nil;
        SLReactions *reactions = [mapper mapReactions:dict];

        expect(reactions).to.beNil();
    });

    it(@"reactions object mapping from empty dict", ^{

        NSDictionary *dict = @{};
        SLReactions *reactions = [mapper mapReactions:dict];

        expect(reactions).notTo.beNil();
        expect(reactions.sentByMe).notTo.beNil();
        expect(reactions.receivedFromUser).notTo.beNil();
    });

    it(@"reactions object mapping", ^{

        NSDictionary *dict = reactionsDict;
        SLReactions *reactions = [mapper mapReactions:dict];

        expect(reactions).notTo.beNil();
        expect(reactions.sentByMe).notTo.beNil();
        expect(reactions.receivedFromUser).notTo.beNil();
    });

});

SpecEnd