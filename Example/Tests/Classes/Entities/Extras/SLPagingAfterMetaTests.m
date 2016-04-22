//
//  SLPagingAfterMetaTests.m
//  SoulSDK
//
//  Created by Mikhail on 07.03.16.
//  Copyright © 2016 Mikhail Shershnev. All rights reserved.
//

SpecBegin(SLPagingAfterMeta)

describe(@"paging after meta mapping", ^{

    // given
    NSString *kAfterKey = @"after";
    NSString *kLimitKey = @"limit";
    NSString *kTotalKey = @"total";

    NSInteger afterInteger = 123456;
    NSString *afterString = @"123456";

    NSInteger limitInteger = 654321;
    NSString *limitString = @"654321";

    NSInteger totalInteger = 321456;
    NSString *totalString = @"321456";

    SLPagingAfterMetaMapper *afterMetaMapper = [SLPagingAfterMetaMapper new];

    //
    it(@"mapping from nil dict", ^{

        NSDictionary *dict = nil;
        SLPagingAfterMeta *meta = [afterMetaMapper mapAfterMeta:dict];

        expect(meta).to.beNil();
    });

    it(@"mapping from empty dict", ^{

        NSDictionary *dict = @{};
        SLPagingAfterMeta *meta = [afterMetaMapper mapAfterMeta:dict];

        expect(meta).notTo.beNil();
        expect(meta.after).to.beFalsy();
        expect(meta.limit).to.beFalsy();
        expect(meta.total).to.beFalsy();
    });

    it(@"mapping #1", ^{

        NSDictionary *dict = @{
                               kAfterKey: @(afterInteger),
                               kLimitKey: @(limitInteger),
                               kTotalKey: @(totalInteger),
                               };

        SLPagingAfterMeta *meta = [afterMetaMapper mapAfterMeta:dict];

        expect(meta).notTo.beNil();
        expect(meta.after).to.equal(afterInteger);
        expect(meta.limit).to.equal(limitInteger);
        expect(meta.total).to.equal(totalInteger);
    });

    it(@"mapping #2", ^{

        NSDictionary *dict = @{
                               kAfterKey: afterString,
                               kLimitKey: limitString,
                               kTotalKey: totalString,
                               };

        SLPagingAfterMeta *meta = [afterMetaMapper mapAfterMeta:dict];
        
        expect(meta).notTo.beNil();
        expect(meta.after).to.equal(afterInteger);
        expect(meta.limit).to.equal(limitInteger);
        expect(meta.total).to.equal(totalInteger);
    });

    it(@"mapping from NSNull", ^{

        NSDictionary *dict = @{
                               kAfterKey: [NSNull null],
                               kLimitKey: [NSNull null],
                               kTotalKey: [NSNull null],
                               };

        SLPagingAfterMeta *meta = [afterMetaMapper mapAfterMeta:dict];

        expect(meta).notTo.beNil();
        expect(meta.after).to.beFalsy();
        expect(meta.limit).to.beFalsy();
        expect(meta.total).to.beFalsy();
    });
    
});

SpecEnd