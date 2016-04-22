//
//  SLSubscriptionServiceMapper.m
//  Pods
//
//  Created by Mikhail on 06.03.16.
//
//

#import "SLSubscriptionServiceMapper.h"

static NSString *const kSubscriptionIdKey = @"subscriptionId";
static NSString *const kSubscriptionIdProp = @"subscriptionId";

static NSString *const kExpiresTimeKey = @"expiresTime";
static NSString *const kExpiresTimeProp = @"expiresTime";

@implementation SLSubscriptionServiceMapper

+ (EKObjectMapping *)objectMapping {

    EKObjectMapping *mapper = [[EKObjectMapping alloc] initWithObjectClass:[SLSubscriptionService class]];

    EKMappingValueBlock doubleBlock = [self doubleValueBlock];
    EKMappingValueBlock stringBlock = [self stringValueBlock];

    [mapper mapKeyPath:kSubscriptionIdKey toProperty:kSubscriptionIdProp withValueBlock:stringBlock];
    [mapper mapKeyPath:kExpiresTimeKey toProperty:kExpiresTimeProp withValueBlock:doubleBlock];

    return mapper;
}

- (SLSubscriptionService *)mapService:(id)dict {
    return [self map:dict];
}

@end