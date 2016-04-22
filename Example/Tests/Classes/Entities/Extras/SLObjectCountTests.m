//
//  SLObjectCountTests.m
//  SoulSDK
//
//  Created by Mikhail on 26.02.16.
//  Copyright © 2016 Mikhail Shershnev. All rights reserved.
//

#import "SLTObjectCountDataManager.h"

SpecBegin(SLObjectCount)

describe(@"object count mapping", ^{

    // given
    SLTObjectCountDataManager *objectCountDataManager = [SLTObjectCountDataManager new];
    NSDictionary *objectCountDict = [objectCountDataManager objectCount];

    //
    NSInteger notDeletedByMe = [objectCountDataManager notDeletedByMe];
    NSInteger notDeletedByAnyone = [objectCountDataManager notDeletedByAnyone];
    NSInteger notExpiredAndNotDeletedByAnyone = [objectCountDataManager notExpiredAndNotDeletedByAnyone];

    SLObjectCountMapper *objectCountMapper = [SLObjectCountMapper new];

    //
    it(@"mapping from nil dict", ^{

        NSDictionary *dict = nil;
        SLObjectCount *objectCount = [objectCountMapper mapObjectCount:dict];

        expect(objectCount).to.beNil();
    });

    it(@"mapping from empty dict", ^{

        NSDictionary *dict = @{};
        SLObjectCount *objectCount = [objectCountMapper mapObjectCount:dict];

        expect(objectCount).to.beNil();
    });

    it(@"mapping from empty chats dict", ^{

        NSDictionary *dict = @{
                               kChatsKey: @{}
                               };
        SLObjectCount *objectCount = [objectCountMapper mapObjectCount:dict];

        expect(objectCount).toNot.beNil();
        expect(objectCount.chats).notTo.beNil();
        expect(objectCount.chats.notDeletedByMe).to.beFalsy();
        expect(objectCount.chats.notDeletedByAnyone).to.beFalsy();
        expect(objectCount.chats.notExpiredAndNotDeletedByAnyone).to.beFalsy();
    });

    it(@"normal mapping", ^{

        NSDictionary *dict = objectCountDict;
        SLObjectCount *objectCount = [objectCountMapper mapObjectCount:dict];

        //
        expect(objectCount).notTo.beNil();
        expect(objectCount.chats).notTo.beNil();
        expect(objectCount.chats.notDeletedByMe).to.equal( @(notDeletedByMe) );
        expect(objectCount.chats.notDeletedByAnyone).to.equal( @(notDeletedByAnyone) );
        expect(objectCount.chats.notExpiredAndNotDeletedByAnyone).to.equal( @(notExpiredAndNotDeletedByAnyone) );
    });
    
    it(@"mapping from NSNull", ^{

        NSDictionary *dict = @{
                               kChatsKey: [NSNull null],
                               };

        SLObjectCount *objectCount = [objectCountMapper mapObjectCount:dict];

        expect(objectCount).to.beNil();
    });
    
});

SpecEnd
