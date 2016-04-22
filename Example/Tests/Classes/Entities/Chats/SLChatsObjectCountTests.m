//
//  SLChatsObjectCountTests.m
//  SoulSDK
//
//  Created by Mikhail on 26.02.16.
//  Copyright © 2016 Mikhail Shershnev. All rights reserved.
//

SpecBegin(SLChatsObjectCount)

describe(@"chats object count mapping", ^{

    // given
    NSString *kNotDeletedByMeKey = @"notDeletedByMe";
    NSString *kNotDeletedByAnyoneKey = @"notDeletedByAnyone";
    NSString *kNotExpiredAndNotDeletedByAnyoneKey = @"notExpiredAndNotDeletedByAnyone";

    //
    NSInteger notDeletedByMeInteger = 11;
    NSInteger notDeletedByAnyoneKeyInteger = 7;
    NSInteger notExpiredAndNotDeletedByAnyoneInteger = 4;

    SLChatsObjectCountMapper *chatsObjectCountMapper = [SLChatsObjectCountMapper new];

    //
    it(@"mapping from nil dict", ^{

        NSDictionary *dict = nil;
        SLChatsObjectCount *chatsObjectCount = [chatsObjectCountMapper mapChatsObjectCount:dict];

        expect(chatsObjectCount).to.beNil();
    });
    
    it(@"mapping from empty dict", ^{

        NSDictionary *dict = @{};
        SLChatsObjectCount *chatsObjectCount = [chatsObjectCountMapper mapChatsObjectCount:dict];

        expect(chatsObjectCount).notTo.beNil();
    });
    
    it(@"normal mapping", ^{

        NSDictionary *dict = @{
                               kNotDeletedByMeKey: @(notDeletedByMeInteger),
                               kNotDeletedByAnyoneKey: @(notDeletedByAnyoneKeyInteger),
                               kNotExpiredAndNotDeletedByAnyoneKey: @(notExpiredAndNotDeletedByAnyoneInteger),
                               };

        SLChatsObjectCount *chatsObjectCount = [chatsObjectCountMapper mapChatsObjectCount:dict];

        //
        expect(chatsObjectCount).notTo.beNil();
        expect(chatsObjectCount.notDeletedByMe).to.equal(@(notDeletedByMeInteger));
        expect(chatsObjectCount.notDeletedByAnyone).to.equal(@(notDeletedByAnyoneKeyInteger));
        expect(chatsObjectCount.notExpiredAndNotDeletedByAnyone).to.equal(@(notExpiredAndNotDeletedByAnyoneInteger));
    });
    
    it(@"mapping from NSNull", ^{
        
        NSDictionary *dict = @{
                               kNotDeletedByMeKey: [NSNull null],
                               kNotDeletedByAnyoneKey: [NSNull null],
                               kNotExpiredAndNotDeletedByAnyoneKey: [NSNull null],
                               };

        SLChatsObjectCount *chatsObjectCount = [chatsObjectCountMapper mapChatsObjectCount:dict];

        //
        expect(chatsObjectCount).notTo.beNil();
    });

});

SpecEnd