//
//  SLChatsOneTests.m
//  SoulSDK
//
//  Created by Mikhail on 01.03.16.
//  Copyright © 2016 Mikhail Shershnev. All rights reserved.
//

SpecBegin(SLChatsOne)

describe(@"chats one object mapping", ^{

    // given
    NSString *kChatKey = @"chat";
    NSString *kAdditionalInfoKey = @"additionalInfo";

    SLChatsOneMapper *chatsOneMapper = [SLChatsOneMapper new];

    //
    it(@"mapping from nil dict", ^{

        NSDictionary *dict = nil;
        SLChatsOne *chatsOne = [chatsOneMapper mapChatsOne:dict];

        expect(chatsOne).to.beNil();
    });

    it(@"mapping from empty dict", ^{

        NSDictionary *dict = @{};
        SLChatsOne *chatsOne = [chatsOneMapper mapChatsOne:dict];

        expect(chatsOne).to.beNil();
    });

    it(@"normal mapping", ^{

        NSDictionary *dict = @{
                               kChatKey: @{
                                       @"id": @"74gfl38ghe8",
                                       @"partnerId": @"irhs94b6os7",
                                       @"channelName": @"wkj0j9pj2fhp0923rj0230r9320r3j0",
                                       @"expiresTime": @(1447116497.321),
                                       @"deletedByMe": @"true",
                                       @"deletedByPartner": @(NO),
                                       },
                               kAdditionalInfoKey: @{
                                       @"serverTime": @(1248136307.401)
                                       },
                               };

        SLChatsOne *chatsOne = [chatsOneMapper mapChatsOne:dict];

        expect(chatsOne).notTo.beNil();
        expect(chatsOne.chat).notTo.beNil();
        expect(chatsOne.additionalInfo).notTo.beNil();
    });

    it(@"mapping from NSNull", ^{

        NSDictionary *dict = @{
                               kChatKey: [NSNull null],
                               kAdditionalInfoKey: [NSNull null],
                               };

        SLChatsOne *chatsOne = [chatsOneMapper mapChatsOne:dict];

        expect(chatsOne).to.beNil();
    });
    
});

SpecEnd