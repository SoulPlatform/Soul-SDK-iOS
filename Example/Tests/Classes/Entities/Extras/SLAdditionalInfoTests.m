//
//  SLAdditionalInfoTests.m
//  SoulSDK
//
//  Created by Mikhail on 10.02.16.
//  Copyright © 2016 Mikhail Shershnev. All rights reserved.
//

SpecBegin(SLAdditionalInfo)

describe(@"additional info object mapping", ^{

    // given
    NSString *kSeverTimeKey = @"serverTime";

    double serverTimeDouble = 1248136308.401;
    NSNumber *serverTimeNumber = @(1248136308.401);
    NSString *serverTimeString = @"1248136308.401";

    SLAdditionalInfoMapper *infoMapper = [SLAdditionalInfoMapper new];

    //

    it(@"mapping from nil dict", ^{

        NSDictionary *dict = nil;

        SLAdditionalInfo *info = [infoMapper mapAdditionalInfo:dict];

        expect(info).to.beNil();
    });

    it(@"mapping from empty dict", ^{

        NSDictionary *dict = @{};

        SLAdditionalInfo *info = [infoMapper mapAdditionalInfo:dict];

        //
        expect(info.serverTime).to.beFalsy();
    });

    it(@"serverTime – mapping from double", ^{
        
        NSDictionary *dict = @{
                               kSeverTimeKey: @(serverTimeDouble),
                               };
        
        SLAdditionalInfo *info = [infoMapper mapAdditionalInfo:dict];
        
        //
        expect(info.serverTime).to.equal(serverTimeDouble);
    });

    it(@"serverTime – mapping from NSNumber", ^{

        NSDictionary *dict = @{
                               kSeverTimeKey: serverTimeNumber,
                               };

        SLAdditionalInfo *info = [infoMapper mapAdditionalInfo:dict];

        //
        expect(info.serverTime).to.equal(serverTimeDouble);
    });

    it(@"serverTime – mapping from NSString", ^{

        NSDictionary *dict = @{
                               kSeverTimeKey: serverTimeString,
                               };

        SLAdditionalInfo *info = [infoMapper mapAdditionalInfo:dict];

        //
        expect(info.serverTime).to.equal(serverTimeDouble);
    });

    it(@"serverTime – mapping from BOOL", ^{

        NSDictionary *dict = @{
                               kSeverTimeKey: @YES,
                               };

        SLAdditionalInfo *info = [infoMapper mapAdditionalInfo:dict];

        //
        expect(info.serverTime).to.equal(1);
    });

    it(@"serverTime – mapping from NSNull", ^{

        NSDictionary *dict = @{
                               kSeverTimeKey: [NSNull null],
                               };

        SLAdditionalInfo *info = [infoMapper mapAdditionalInfo:dict];

        //
        expect(info.serverTime).to.beFalsy();
    });

});

SpecEnd