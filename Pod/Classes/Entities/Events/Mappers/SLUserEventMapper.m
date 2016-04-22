//
//  SLUserEventMapper.m
//  Pods
//
//  Created by Mikhail on 09.03.16.
//
//

#import "SLUserEventMapper.h"
#import "SLEventMapper.h"
#import "SLOtherUserMapper.h"

static NSString *const kUserKey = @"user";
static NSString *const kUserProp = @"user";

@implementation SLUserEventMapper

+ (EKObjectMapping *)objectMapping {

    EKObjectMapping *mapper = [SLEventMapper eventMapperAtClass:[SLUserEvent class]];

    Class userClass = [SLOtherUserMapper class];
    [mapper hasOne:userClass forKeyPath:kUserKey forProperty:kUserProp];

    return mapper;
}

@end
