//
//  SLSubscriptionDuration.h
//  Pods
//
//  Created by Mikhail on 26.02.16.
//
//

#import "SLObject.h"

@interface SLSubscriptionDuration :SLObject

typedef NS_ENUM(NSInteger, SLSubscriptionDurationUnit) {
    SLSubscriptionDurationUnitUnknown,
    SLSubscriptionDurationUnitWeek,
    SLSubscriptionDurationUnitMonth,
    SLSubscriptionDurationUnitYear,
};

@property (nonatomic, strong) NSNumber *number;
@property (nonatomic, assign) SLSubscriptionDurationUnit unit; // SLSubscriptionDurationUnit

@end