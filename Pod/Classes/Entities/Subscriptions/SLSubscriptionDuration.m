//
//  SLSubscriptionDuration.m
//  Pods
//
//  Created by Mikhail on 26.02.16.
//
//

#import "SLSubscriptionDuration.h"

@implementation SLSubscriptionDuration

+ (NSArray <NSString *> *)mandatoryFields {
    return @[
             @"number",
             @"unit",
             ];
}

@end
