//
//  SLTAvailableSubscriptionsDataManager.m
//  SoulSDK
//
//  Created by Mikhail on 30.03.16.
//  Copyright © 2016 Mikhail Shershnev. All rights reserved.
//

#import "SLTAvailableSubscriptionsDataManager.h"

NSString *_Nonnull const kAvailableSubscriptions = @"availableSubscriptions";

@implementation SLTAvailableSubscriptionsDataManager

- (nonnull NSDictionary *)products {

    NSDictionary *productA = [self productA];
    NSDictionary *productB = [self productB];

    return @{
             kAvailableSubscriptions: @[productA, productB]
             };
}

- (nonnull NSDictionary *)productA {
    return @{
             @"productName": @"org.acme.MonthlyMembership",
             @"duration": @{
                     @"number": @(2),
                     @"unit": @"month"
                     },
             @"services": @[@"membership"],
             @"autoRenewable": @(YES)
             };
}

- (nonnull NSDictionary *)productB {
    return @{
             @"productName": @"org.acme.YearlyGoldMembership",
             @"duration": @{
                     @"number": @(1),
                     @"unit": @"year"
                     },
             @"services": @[@"membership", @"invisibility"],
             @"autoRenewable": @(YES)
             };
}

@end
