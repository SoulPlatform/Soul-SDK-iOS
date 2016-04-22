//
//  SLTChatsDataManager.m
//  SoulSDK
//
//  Created by Mikhail on 07.04.16.
//  Copyright © 2016 Mikhail Shershnev. All rights reserved.
//

#import "SLTChatsDataManager.h"
#import "SLTAdditionalInfoDataManager.h"
#import "SLTPagingAfterMetaDataManager.h"

@implementation SLTChatsDataManager

NSString *_Nonnull const kTChatsDataChatKey = @"chat";
NSString *_Nonnull const kTChatsDataChatsKey = @"chats";
NSString *_Nonnull const kTChatsDataMetaKey = @"_meta";
NSString *_Nonnull const kTChatsDataInfoKey = @"additionalInfo";

- (nonnull NSDictionary *)chatResponse {

    return @{
             kTChatsDataChatKey: [self chat],
             kTChatsDataMetaKey: [self meta],
             kTChatsDataInfoKey: [self additionalInfo],
             };
}

- (nonnull NSDictionary *)chatsResponse {

    return @{
             kTChatsDataChatsKey: [self chats],
             kTChatsDataMetaKey: [self meta],
             kTChatsDataInfoKey: [self additionalInfo],
             };
}

- (nonnull NSArray *)chats {
    NSDictionary *chat = [self chat];

    return @[chat, chat, chat, chat];
}

- (nonnull NSDictionary *)chat {

    return @{
             @"id": @"74gfl38ghe8",
             @"partnerId": @"irhs94b6os7",
             @"expiresTime": @(1447116497.321),
             @"deletedByMe": @(NO),
             @"deletedByPartner": @(NO),
             @"channelName": @"wkj0j9pj2fhp0923rj0230r9320r3j0"
             };
}

- (nonnull NSDictionary *)meta {
    SLTPagingAfterMetaDataManager *metaData = [SLTPagingAfterMetaDataManager new];
    return [metaData meta];
}

- (nonnull NSDictionary *)additionalInfo {
    SLTAdditionalInfoDataManager *additionalInfoData = [SLTAdditionalInfoDataManager new];
    return [additionalInfoData additionalInfo];
}

@end
