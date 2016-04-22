//
//  SLUserRecsMetaTests.m
//  SoulSDK
//
//  Created by Mikhail on 06.03.16.
//  Copyright © 2016 Mikhail Shershnev. All rights reserved.
//

SpecBegin(SLUserRecsMeta)

describe(@"user recs meta mapping", ^{

    // given
    NSString *kSessionNameKey = @"sessionName";
    NSString *kUniqueTokenKey = @"uniqueToken";

    NSString *sessionNameString = @"wpjewoifjwep0j3904";
    NSInteger sessionNameInteger = 123456;

    NSString *uniqueTokenString = @"32r22fg2g42r";
    NSInteger uniqueTokenInteger = 321654;

    SLUserRecsMetaMapper *userRecsMetaMapper = [SLUserRecsMetaMapper new];

    //
    it(@"mapping from nil dict", ^{

        NSDictionary *dict = nil;
        SLUserRecsMeta *meta = [userRecsMetaMapper mapMeta:dict];

        expect(meta).to.beNil();
    });

    it(@"mapping from empty dict", ^{

        NSDictionary *dict = @{};
        SLUserRecsMeta *meta = [userRecsMetaMapper mapMeta:dict];

        expect(meta).to.beNil();
    });

    it(@"mapping #1", ^{

        NSDictionary *dict = @{
                               kSessionNameKey: sessionNameString,
                               kUniqueTokenKey: uniqueTokenString,
                               };

        SLUserRecsMeta *meta = [userRecsMetaMapper mapMeta:dict];

        expect(meta).notTo.beNil();
        expect(meta.sessionName).to.equal(sessionNameString);
        expect(meta.uniqueToken).to.equal(uniqueTokenString);
    });

    it(@"mapping #2", ^{

        NSDictionary *dict = @{
                               kSessionNameKey: @(sessionNameInteger),
                               kUniqueTokenKey: @(uniqueTokenInteger),
                               };

        SLUserRecsMeta *meta = [userRecsMetaMapper mapMeta:dict];

        expect(meta).notTo.beNil();

        NSString *_sessionNameString = [NSString stringWithFormat:@"%d", sessionNameInteger];
        NSString *_uniqueTokenString = [NSString stringWithFormat:@"%d", uniqueTokenInteger];

        expect(meta.sessionName).to.equal(_sessionNameString);
        expect(meta.uniqueToken).to.equal(_uniqueTokenString);
    });

    it(@"mapping from NSNull", ^{

        NSDictionary *dict = @{
                               kSessionNameKey: [NSNull null],
                               kUniqueTokenKey: [NSNull null],
                               };

        SLUserRecsMeta *meta = [userRecsMetaMapper mapMeta:dict];

        expect(meta).to.beNil();
    });

});


SpecEnd