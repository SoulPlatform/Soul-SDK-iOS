//
//  SLChatsManyMapper.m
//  Pods
//
//  Created by Mikhail on 01.03.16.
//
//

#import "SLChatsManyMapper.h"
#import "SLChatsMany.h"
#import "SLChatMapper.h"
#import "SLAdditionalInfoMapper.h"
#import "SLPagingAfterMetaMapper.h"

@implementation SLChatsManyMapper

static NSString *const kChatsKey = @"chats";
static NSString *const kChatsProp = @"chats";

static NSString *const kMetaKey = @"_meta";
static NSString *const kMetaProp = @"meta";

static NSString *const kInfoKey = @"additionalInfo";
static NSString *const kInfoProp = @"additionalInfo";

+ (EKObjectMapping *)objectMapping {

    EKObjectMapping *mapper = [[EKObjectMapping alloc] initWithObjectClass:[SLChatsMany class]];

    Class chatClass = [SLChatMapper class];
    [mapper hasMany:chatClass forKeyPath:kChatsKey forProperty:kChatsProp];

    Class metaClass = [SLPagingAfterMetaMapper class];
    [mapper hasOne:metaClass forKeyPath:kMetaKey forProperty:kMetaProp];

    Class infoClass = [SLAdditionalInfoMapper class];
    [mapper hasOne:infoClass forKeyPath:kInfoKey forProperty:kInfoProp];

    return mapper;
}

- (SLChatsMany *)mapChatsMany:(id)dict {
    return [self map:dict];
}

@end