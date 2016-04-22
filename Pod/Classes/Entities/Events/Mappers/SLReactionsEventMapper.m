//
//  SLReactionsEventMapper.m
//  Pods
//
//  Created by Mikhail on 16.03.16.
//
//

#import "SLReactionsEventMapper.h"

#import "SLEventMapper.h"
#import "SLEventReactionsMapper.h"

static NSString *const kReactionsKey = @"reactions";
static NSString *const kReactionsProp = @"reactions";

@implementation SLReactionsEventMapper

+ (EKObjectMapping *)objectMapping {

    EKObjectMapping *mapper = [SLEventMapper eventMapperAtClass:[SLReactionsEvent class]];

    Class reactionsClass = [SLEventReactionsMapper class];
    [mapper hasOne:reactionsClass forKeyPath:kReactionsKey forProperty:kReactionsProp];

    return mapper;
}

@end
