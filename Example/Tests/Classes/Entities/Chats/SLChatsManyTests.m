//
//  SLChatsManyTests.m
//  SoulSDK
//
//  Created by Mikhail on 01.03.16.
//  Copyright © 2016 Mikhail Shershnev. All rights reserved.
//

#import "SLTChatsDataManager.h"

SpecBegin(SLChatsMany)

describe(@"chats many object mapping", ^{

    // given
    NSString *kChatsKey = @"chats";
    NSString *kAdditionalInfoKey = @"additionalInfo";

    SLTChatsDataManager *chatsData = [SLTChatsDataManager new];
    NSDictionary *chatsResponse = [chatsData chatsResponse];

    SLChatsManyMapper *chatsManyMapper = [SLChatsManyMapper new];

    //
    it(@"mapping from nil dict", ^{

        NSDictionary *dict = nil;
        SLChatsMany *chatsMany = [chatsManyMapper mapChatsMany:dict];

        expect(chatsMany).to.beNil();
    });

    it(@"mapping from empty dict", ^{

        NSDictionary *dict = @{};
        SLChatsMany *chatsMany = [chatsManyMapper mapChatsMany:dict];

        expect(chatsMany).to.beNil();
    });
    
    it(@"normal mapping", ^{
        
        NSDictionary *dict = chatsResponse;
        SLChatsMany *chatsMany = [chatsManyMapper mapChatsMany:dict];
        
        expect(chatsMany).notTo.beNil();
        expect(chatsMany.chats).notTo.beNil();
        expect(chatsMany.meta).notTo.beNil();
        expect(chatsMany.additionalInfo).notTo.beNil();
    });
    
    it(@"mapping from NSNull", ^{
        
        NSDictionary *dict = @{
                               kChatsKey: [NSNull null],
                               kAdditionalInfoKey: [NSNull null],
                               };
        
        SLChatsMany *chatsMany = [chatsManyMapper mapChatsMany:dict];
        
        expect(chatsMany).to.beNil();
    });
    
});

SpecEnd