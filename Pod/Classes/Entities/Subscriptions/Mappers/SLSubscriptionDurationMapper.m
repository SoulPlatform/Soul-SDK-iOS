//
//  SLSubscriptionDurationMapper.m
//  Pods
//
//  Created by Mikhail on 26.02.16.
//
//

#import "SLSubscriptionDurationMapper.h"

static NSString *const kNumberKey = @"number";
static NSString *const kNumberProperty = @"number";

static NSString *const kUnitKey = @"unit";
static NSString *const kUnitProperty = @"unit";

@implementation SLSubscriptionDurationMapper

+ (EKObjectMapping *)objectMapping {

    EKObjectMapping *mapper = [[EKObjectMapping alloc] initWithObjectClass:[SLSubscriptionDuration class]];

    EKMappingValueBlock integerBlock = [self integerValueBlock];

    [mapper mapKeyPath:kNumberKey toProperty:kNumberProperty withValueBlock:integerBlock];

    [mapper mapKeyPath:kUnitKey toProperty:kUnitKey withValueBlock:^id(NSString *key, id value) {

        SLSubscriptionDurationUnit unit = SLSubscriptionDurationUnitUnknown;

        if ([value isKindOfClass:[NSString class]]) {

            NSString *valueString = (NSString *)value;

            if ([valueString isEqualToString:@"week"]) {
                unit = SLSubscriptionDurationUnitWeek ;
            }
            else if ([valueString isEqualToString:@"month"]) {
                unit = SLSubscriptionDurationUnitMonth;
            }
            else if ([valueString isEqualToString:@"year"]) {
                unit = SLSubscriptionDurationUnitYear;
            }
            else {
                unit = SLSubscriptionDurationUnitUnknown;
            }
        }

        return @(unit);

    }];

    return mapper;
}

- (SLSubscriptionDuration *)mapSubscriptionDuration:(id)dict {
    return [self map:dict];
}

@end