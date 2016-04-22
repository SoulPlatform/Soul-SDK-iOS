//
//  SLChatMapper.m
//  Pods
//
//  Created by Mikhail on 01.03.16.
//
//

#import "SLChatMapper.h"

//
static NSString *const kChatIdKey = @"id";
static NSString *const kChatIdProperty = @"chatId";

static NSString *const kPartnerIdKey = @"partnerId";
static NSString *const kPartnerIdProperty = @"partnerId";

static NSString *const kChannelNameKey = @"channelName";
static NSString *const kChannelNameProperty = @"channelName";

//
static NSString *const kExpiresTimeKey = @"expiresTime";
static NSString *const kExpiresTimeProperty = @"expiresTime";

static NSString *const kDeletedByMeKey = @"deletedByMe";
static NSString *const kDeletedByMeProperty = @"deletedByMe";

static NSString *const kDeletedByPartnerKey = @"deletedByPartner";
static NSString *const kDeletedByPartnerProperty = @"deletedByPartner";

@implementation SLChatMapper

+ (EKObjectMapping *)objectMapping {

    EKObjectMapping *mapper = [[EKObjectMapping alloc] initWithObjectClass:[SLChat class]];

    EKMappingValueBlock stringBlock    = [self stringValueBlock];
    EKMappingValueBlock doubleBlock    = [self doubleValueBlock];
    EKMappingValueBlock boolValueBlock = [self boolValueBlock];

    [mapper mapKeyPath:kChatIdKey      toProperty:kChatIdProperty      withValueBlock:stringBlock];
    [mapper mapKeyPath:kPartnerIdKey   toProperty:kPartnerIdProperty   withValueBlock:stringBlock];
    [mapper mapKeyPath:kChannelNameKey toProperty:kChannelNameProperty withValueBlock:stringBlock];

    [mapper mapKeyPath:kExpiresTimeKey      toProperty:kExpiresTimeProperty      withValueBlock:doubleBlock];
    [mapper mapKeyPath:kDeletedByMeKey      toProperty:kDeletedByMeProperty      withValueBlock:boolValueBlock];
    [mapper mapKeyPath:kDeletedByPartnerKey toProperty:kDeletedByPartnerProperty withValueBlock:boolValueBlock];

    return mapper;
}

- (SLChat *)mapChat:(id)dict {
    return [self map:dict];
}

@end
