//
//  SLAvailableSubscription.h
//  Pods
//
//  Created by Mikhail on 29.02.16.
//
//

#import "SLObject.h"
#import "SLSubscriptionDuration.h"

typedef NS_ENUM(NSInteger, SLSubscriptionServiceType) {
    SLSubscriptionServiceUnknownType = 0,
    SLSubscriptionServiceMembershipType,
};

@interface SLAvailableSubscription :SLObject

@property (nonatomic, strong) NSNumber *autoRenewable;
@property (nonatomic, strong) NSString *productName;
@property (nonatomic, strong) NSArray <NSNumber *> *services; // @[ @(SLSubscriptionServiceType) ]
@property (nonatomic, strong) SLSubscriptionDuration *duration;

@end