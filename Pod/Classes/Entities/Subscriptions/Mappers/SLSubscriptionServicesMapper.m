//
//  SLSubscriptionServicesMapper.m
//  Pods
//
//  Created by Mikhail on 06.03.16.
//
//

#import "SLSubscriptionServicesMapper.h"
#import "SLSubscriptionServiceMapper.h"

static NSString *const kMembershipKey = @"membership";
static NSString *const kMembershipProp = @"membership";

@implementation SLSubscriptionServicesMapper

+ (EKObjectMapping *)objectMapping {

    EKObjectMapping *mapper = [[EKObjectMapping alloc] initWithObjectClass:[SLSubscriptionServices class]];

    Class serviceClass = [SLSubscriptionServiceMapper class];
    [mapper hasOne:serviceClass forKeyPath:kMembershipKey forProperty:kMembershipProp];

    return mapper;
}

- (SLSubscriptionServices *)mapServices:(id)dict {
    SLSubscriptionServices *service = [self map:dict];
    return service;
}

@end
