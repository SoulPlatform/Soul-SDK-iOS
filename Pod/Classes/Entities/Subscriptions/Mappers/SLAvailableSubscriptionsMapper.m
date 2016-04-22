//
//  SLAvailableSubscriptionsMapper.m
//  Pods
//
//  Created by Mikhail on 29.02.16.
//
//

#import "SLAvailableSubscriptionsMapper.h"
#import "SLAvailableSubscriptionMapper.h"

static NSString *const kSubscriptionsKey = @"availableSubscriptions";
static NSString *const kSubscriptionsProperty = @"items";

@implementation SLAvailableSubscriptionsMapper

+ (EKObjectMapping *)objectMapping {

    EKObjectMapping *mapper = [[EKObjectMapping alloc] initWithObjectClass:[SLAvailableSubscriptions class]];

    [mapper hasMany:[SLAvailableSubscriptionMapper class] forKeyPath:kSubscriptionsKey forProperty:kSubscriptionsProperty];

    return mapper;
}

- (SLAvailableSubscriptions *)mapAvailableSubscriptions:(id)dict {
   SLAvailableSubscriptions *products = [self map:dict];
    return products;
}

@end
