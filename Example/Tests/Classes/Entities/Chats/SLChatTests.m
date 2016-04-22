//
//  SLChatTests.m
//  SoulSDK
//
//  Created by Mikhail on 01.03.16.
//  Copyright © 2016 Mikhail Shershnev. All rights reserved.
//

SpecBegin(SLChat)

describe(@"chat object mapping", ^{

    // given
    NSString *kChatIdKey = @"id";
    NSString *kPartnerIdKey = @"partnerId";
    NSString *kChannelNameKey = @"channelName";

    NSString *kExpiresTimeKey = @"expiresTime";
    NSString *kDeletedByMeKey = @"deletedByMe";
    NSString *kDeletedByPartnerKey = @"deletedByPartner";

    //
    NSString *chatIdString = @"74gfl38ghe8";
    NSInteger chatIdInteger = 123;

    NSString *partnerIdString = @"irhs94b6os7";
    NSInteger partnerIdInteger = 321;

    NSString *channelNameString = @"wkj0j9pj2fhp0923rj0230r9320r3j0";
    NSInteger channelNameInteger = 456;

    BOOL deletedByMeBool = YES;
    NSString *deletedByMeString = @"true";

    BOOL deletedByPartnerBool = YES;
    NSString *deletedByPartnerString = @"yes";

    double expiresTimeDouble = 1447116497.321;
    NSString *expiresTimeString = @"1447116497.321";

    SLChatMapper *chatMapper = [SLChatMapper new];

    //
    it(@"mapping from nil dict", ^{

        NSDictionary *dict = nil;
        SLChat *chat = [chatMapper mapChat:dict];

        expect(chat).to.beNil();
    });

    it(@"mapping from empty dict", ^{

        NSDictionary *dict = @{};
        SLChat *chat = [chatMapper mapChat:dict];
        
        expect(chat).to.beNil();
    });

    it(@"mapping #1", ^{

        NSDictionary *dict = @{
                               kChatIdKey: chatIdString,
                               kPartnerIdKey: partnerIdString,
                               kChannelNameKey: channelNameString,

                               kExpiresTimeKey: @(expiresTimeDouble),
                               kDeletedByMeKey: @(deletedByMeBool),
                               kDeletedByPartnerKey: @(deletedByPartnerBool),
                               };

        SLChat *chat = [chatMapper mapChat:dict];

        expect(chat).notTo.beNil();
        expect(chat.chatId).to.equal(chatIdString);
        expect(chat.partnerId).to.equal(partnerIdString);
        expect(chat.channelName).to.equal(channelNameString);

        expect(chat.expiresTime).to.equal( @(expiresTimeDouble) );
        expect(chat.deletedByMe).to.equal( @(deletedByMeBool) );
        expect(chat.deletedByPartner).to.equal( @(deletedByPartnerBool) );
    });

    it(@"mapping #2", ^{

        NSDictionary *dict = @{
                               kChatIdKey: @(chatIdInteger),
                               kPartnerIdKey: @(partnerIdInteger),
                               kChannelNameKey: @(channelNameInteger),

                               kExpiresTimeKey: expiresTimeString,
                               kDeletedByMeKey: deletedByMeString,
                               kDeletedByPartnerKey: deletedByPartnerString,
                               };

        SLChat *chat = [chatMapper mapChat:dict];

        expect(chat).notTo.beNil();

        NSString *_chatIdString = [NSString stringWithFormat:@"%ld", (long)chatIdInteger];
        NSString *_partnerIdInteger = [NSString stringWithFormat:@"%ld", (long)partnerIdInteger];
        NSString *_channelNameInteger = [NSString stringWithFormat:@"%ld", (long)channelNameInteger];

        expect(chat.chatId).to.equal( _chatIdString );
        expect(chat.partnerId).to.equal( _partnerIdInteger );
        expect(chat.channelName).to.equal( _channelNameInteger );

        expect(chat.expiresTime).to.equal( @(expiresTimeDouble) );
        expect(chat.deletedByMe).to.equal( @(deletedByMeBool) );
        expect(chat.deletedByPartner).to.equal( @(deletedByPartnerBool) );
    });

    it(@"mapping from NSNull", ^{

        NSDictionary *dict = @{
                               kChatIdKey: [NSNull null],
                               kPartnerIdKey: [NSNull null],
                               kChannelNameKey: [NSNull null],
                               };

        SLChat *chat = [chatMapper mapChat:dict];

        expect(chat).to.beNil();
    });

});

SpecEnd