//
//  SLOtherUserMapper.m
//  Pods
//
//  Created by Mikhail on 08.03.16.
//
//

#import "SLOtherUserMapper.h"

#import "SLUserMapper.h"
#import "SLUser.h"

#import "SLChatMapper.h"
#import "SLReactionsMapper.h"

static NSString *const kChatKey = @"chat";
static NSString *const kChatProp = @"chat";

static NSString *const kReactionsKey = @"reactions";
static NSString *const kReactionsProp = @"reactions";

@implementation SLOtherUserMapper

+ (EKObjectMapping *)objectMapping {

    EKObjectMapping *mapper = [SLUserMapper userMapperAtClass:[SLUser class]];

    Class chatClass = [SLChatMapper class];
    [mapper hasOne:chatClass forKeyPath:kChatKey forProperty:kChatProp];

    Class reactionsClass = [SLReactionsMapper class];
    [mapper hasOne:reactionsClass forKeyPath:kReactionsKey forProperty:kReactionsProp];

    return mapper;
}

@end
