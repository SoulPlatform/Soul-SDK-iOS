//
//  SLReactionTests.m
//  SoulSDK
//
//  Created by Mikhail on 08.03.16.
//  Copyright © 2016 Mikhail Shershnev. All rights reserved.
//

#import "SLTReactionsDataManager.h"

SpecBegin(SLReaction)

describe(@"reaction object mapping", ^{

    // given
    SLTReactionsDataManager *reactionsData = [SLTReactionsDataManager new];
    NSDictionary *sentByMeDict = [reactionsData sentByMe];
    NSDictionary *receivedDict = [reactionsData received];

    SLReactionMapper *mapper = [SLReactionMapper new];

    it(@"liking object mapping from nil dict", ^{

        NSDictionary *dict = nil;
        SLReaction *reaction = [mapper mapReaction:dict atType:nil];

        expect(reaction).to.beNil();
    });

    it(@"liking object mapping from empty dict", ^{

        NSDictionary *dict = @{};
        SLReaction *reaction = [mapper mapReaction:dict atType:nil];

        expect(reaction).to.beNil();
    });

    for (NSString *type in sentByMeDict.allKeys) {

        NSString *testName = [NSString stringWithFormat:@"sentByMe at type %@", type];

        it(testName, ^{

            NSDictionary *dict = sentByMeDict[type];
            SLReaction *reaction = [mapper mapReaction:dict atType:type];

            NSDictionary *nilDict = (NSDictionary *)[NSNull null];

            if (dict != nilDict) {
                expect(reaction).notTo.beNil();
                expect(reaction.value).notTo.beNil();
            }
            else {
                expect(reaction).to.beNil();
                expect(reaction.value).to.beNil();
            }

        });

    }

    for (NSString *type in receivedDict.allKeys) {

        NSString *testName = [NSString stringWithFormat:@"receivedDict at type %@", type];

        it(testName, ^{

            NSDictionary *dict = receivedDict[type];
            SLReaction *reaction = [mapper mapReaction:dict atType:nil];

            if (dict.allKeys) {
                expect(reaction).notTo.beNil();
                expect(reaction.value).notTo.beNil();
            }
            else {
                expect(reaction).to.beNil();
                expect(reaction.value).to.beNil();
            }

        });

    }

});

SpecEnd