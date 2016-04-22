//
//  SLSubscriptionService.m
//  Pods
//
//  Created by Mikhail on 06.03.16.
//
//

#import "SLSubscriptionService.h"

@implementation SLSubscriptionService

+ (NSArray <NSString *> *)mandatoryFields {
    return @[
             @"subscriptionId",
             @"expiresTime",
             ];
}

@end
