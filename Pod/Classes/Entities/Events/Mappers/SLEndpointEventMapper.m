//
//  SLEndpointEventMapper.m
//  Pods
//
//  Created by Mikhail on 16.03.16.
//
//

#import "SLEndpointEventMapper.h"

#import "SLEventMapper.h"
#import "SLEndpointMapper.h"

static NSString *const kEndpointKey = @"endpoint";
static NSString *const kEndpointProp = @"endpoint";

@implementation SLEndpointEventMapper

+ (EKObjectMapping *)objectMapping {

    EKObjectMapping *mapper = [SLEventMapper eventMapperAtClass:[SLEndpointEvent class]];

    Class endpointClass = [SLEndpointMapper class];
    [mapper hasOne:endpointClass forKeyPath:kEndpointKey forProperty:kEndpointProp];

    return mapper;
}

@end
