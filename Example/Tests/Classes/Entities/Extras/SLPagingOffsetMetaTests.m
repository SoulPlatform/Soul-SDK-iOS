//
//  SLPagingOffsetMetaTests.m
//  SoulSDK
//
//  Created by Mikhail on 07.03.16.
//  Copyright © 2016 Mikhail Shershnev. All rights reserved.
//

#import "SLTPagingOffsetMetaDataManager.h"

SpecBegin(SLPagingOffsetMeta)

describe(@"paging offset meta mapping", ^{

    // given
    SLTPagingOffsetMetaDataManager *offsetMetaData = [SLTPagingOffsetMetaDataManager new];

    NSInteger offsetInteger = [offsetMetaData offsetInteger];
    NSInteger limitInteger = [offsetMetaData limitInteger];
    NSInteger totalInteger = [offsetMetaData totalInteger];

    NSString *offsetString = [offsetMetaData offsetString];
    NSString *limitString = [offsetMetaData limitString];
    NSString *totalString = [offsetMetaData totalString];

    SLPagingOffsetMetaMapper *offsetMetaMapper = [SLPagingOffsetMetaMapper new];

    //
    it(@"mapping from nil dict", ^{

        NSDictionary *dict = nil;
        SLPagingOffsetMeta *meta = [offsetMetaMapper mapOffsetMeta:dict];

        expect(meta).to.beNil();
    });

    it(@"mapping from empty dict", ^{

        NSDictionary *dict = @{};
        SLPagingOffsetMeta *meta = [offsetMetaMapper mapOffsetMeta:dict];

        expect(meta).notTo.beNil();
        expect(meta.offset).to.beFalsy();
        expect(meta.limit).to.beFalsy();
        expect(meta.total).to.beFalsy();
    });

    it(@"mapping #1", ^{

        NSDictionary *dict = @{
                               kTOffsetKey: @(offsetInteger),
                               kTLimitKey: @(limitInteger),
                               kTTotalKey: @(totalInteger),
                               };

        SLPagingOffsetMeta *meta = [offsetMetaMapper mapOffsetMeta:dict];

        expect(meta).notTo.beNil();
        expect(meta.offset).to.equal(offsetInteger);
        expect(meta.limit).to.equal(limitInteger);
        expect(meta.total).to.equal(totalInteger);
    });

    it(@"mapping #2", ^{

        NSDictionary *dict = @{
                               kTOffsetKey: offsetString,
                               kTLimitKey: limitString,
                               kTTotalKey: totalString,
                               };

        SLPagingOffsetMeta *meta = [offsetMetaMapper mapOffsetMeta:dict];

        expect(meta).notTo.beNil();
        expect(meta.offset).to.equal(offsetInteger);
        expect(meta.limit).to.equal(limitInteger);
        expect(meta.total).to.equal(totalInteger);
    });

    it(@"mapping from NSNull", ^{

        NSDictionary *dict = @{
                               kTOffsetKey: [NSNull null],
                               kTLimitKey: [NSNull null],
                               kTTotalKey: [NSNull null],
                               };

        SLPagingOffsetMeta *meta = [offsetMetaMapper mapOffsetMeta:dict];

        expect(meta).notTo.beNil();
        expect(meta.offset).to.beFalsy();
        expect(meta.limit).to.beFalsy();
        expect(meta.total).to.beFalsy();
    });

});

SpecEnd