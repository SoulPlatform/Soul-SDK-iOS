//
//  SLMeUserMapper.m
//  Pods
//
//  Created by Mikhail on 08.03.16.
//
//

#import "SLMeUserMapper.h"

#import "SLUserMapper.h"
#import "SLMeUser.h"

#import "SLNotificationTokensMapper.h"
#import "SLSubscriptionServicesMapper.h"

static NSString *const kTokensKey = @"notificationTokens";
static NSString *const kTokensProp = @"notificationTokens";

static NSString *const kServicesKey = @"subscriptionServices";
static NSString *const kServicesProp = @"subscriptionServices";

@implementation SLMeUserMapper

+ (EKObjectMapping *)objectMapping {

    EKObjectMapping *mapper = [SLUserMapper userMapperAtClass:[SLMeUser class]];

    Class tokensClass = [SLNotificationTokensMapper class];
    [mapper hasOne:tokensClass forKeyPath:kTokensKey forProperty:kTokensProp];

    Class servicesClass = [SLSubscriptionServicesMapper class];
    [mapper hasOne:servicesClass forKeyPath:kServicesKey forProperty:kServicesProp];

    return mapper;
}

@end
