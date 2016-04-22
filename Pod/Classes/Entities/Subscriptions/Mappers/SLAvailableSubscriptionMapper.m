//
//  SLAvailableSubscriptionMapper.m
//  Pods
//
//  Created by Mikhail on 29.02.16.
//
//

#import "SLAvailableSubscriptionMapper.h"
#import "SLSubscriptionDurationMapper.h"

//
static NSString *const kProductNameKey = @"productName";
static NSString *const kProductNameProperty = @"productName";

static NSString *const kAutoRenewableKey = @"autoRenewable";
static NSString *const kAutoRenewableProperty = @"autoRenewable";

static NSString *const kDurationKey = @"duration";
static NSString *const kDurationProperty = @"duration";

static NSString *const kServicesKey = @"services";
static NSString *const kServicesProperty = @"services";

@implementation SLAvailableSubscriptionMapper

+ (EKObjectMapping *)objectMapping {

    EKObjectMapping *mapper = [[EKObjectMapping alloc] initWithObjectClass:[SLAvailableSubscription class]];

    EKMappingValueBlock boolBlock = [self boolValueBlock];
    EKMappingValueBlock stringBlock = [self stringValueBlock];

    [mapper mapKeyPath:kProductNameKey toProperty:kProductNameProperty withValueBlock:stringBlock];
    [mapper mapKeyPath:kAutoRenewableKey toProperty:kAutoRenewableProperty withValueBlock:boolBlock];

    [mapper hasOne:[SLSubscriptionDurationMapper class] forKeyPath:kDurationKey forProperty:kDurationProperty];

    [mapper mapKeyPath:kServicesKey toProperty:kServicesProperty withValueBlock:^id(NSString *key, id value) {

        NSMutableArray *servicesArray = [NSMutableArray new];
        if ([value isKindOfClass:[NSArray class]]) {

            NSArray *srvArray = (NSArray *)value;
            for (id srv in srvArray) {

                if ([srv isKindOfClass:[NSString class]]) {

                    NSString *srvString = (NSString *)srv;

                    SLSubscriptionServiceType serviceType = [self serviceTypeAtString:srvString];
                    [servicesArray addObject:@(serviceType)];
                }
            }
        }

        return [NSArray arrayWithArray:servicesArray];
    }];

    return mapper;
}

+ (SLSubscriptionServiceType)serviceTypeAtString:(NSString *)serviceString {

    SLSubscriptionServiceType serviceType;

    if ([serviceString isEqualToString:@"membership"]) {
        serviceType = SLSubscriptionServiceMembershipType;
    }
    else {
        serviceType = SLSubscriptionServiceUnknownType;
    }

    return serviceType;
}

- (SLAvailableSubscription *)mapAvailableSubscription:(id)dict {
    return [self map:dict];
}

@end