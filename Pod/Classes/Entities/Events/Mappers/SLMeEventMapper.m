//
//  SLMeEventMapper.m
//  Pods
//
//  Created by Mikhail on 09.03.16.
//
//

#import "SLMeEventMapper.h"
#import "SLEventMapper.h"
#import "SLMeUserMapper.h"

static NSString *const kMeKey = @"me";
static NSString *const kMeProp = @"me";

@implementation SLMeEventMapper

+ (EKObjectMapping *)objectMapping {

    EKObjectMapping *mapper = [SLEventMapper eventMapperAtClass:[SLMeEvent class]];

    Class meClass = [SLMeUserMapper class];
    [mapper hasOne:meClass forKeyPath:kMeKey forProperty:kMeProp];

    return mapper;
}

@end
