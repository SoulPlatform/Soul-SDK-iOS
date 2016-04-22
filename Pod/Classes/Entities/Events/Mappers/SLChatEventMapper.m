//
//  SLChatEventMapper.m
//  Pods
//
//  Created by Mikhail on 09.03.16.
//
//

#import "SLChatEventMapper.h"

#import "SLEventMapper.h"
#import "SLChatMapper.h"

static NSString *const kChatKey = @"chat";
static NSString *const kChatProp = @"chat";

@implementation SLChatEventMapper

+ (EKObjectMapping *)objectMapping {

    EKObjectMapping *mapper = [SLEventMapper eventMapperAtClass:[SLChatEvent class]];

    Class chatClass = [SLChatMapper class];
    [mapper hasOne:chatClass forKeyPath:kChatKey forProperty:kChatProp];

    return mapper;
}

@end
