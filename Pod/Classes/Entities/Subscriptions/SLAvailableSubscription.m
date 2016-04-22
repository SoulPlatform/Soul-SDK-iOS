//
//  SLAvailableSubscription.m
//  Pods
//
//  Created by Mikhail on 29.02.16.
//
//

#import "SLAvailableSubscription.h"

@implementation SLAvailableSubscription

+ (NSArray <NSString *> *)mandatoryFields {
    return @[
             @"duration",
             @"services",
             @"productName",
             @"autoRenewable",
             ];
}

@end
