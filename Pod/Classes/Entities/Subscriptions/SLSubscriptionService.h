//
//  SLSubscriptionService.h
//  Pods
//
//  Created by Mikhail on 06.03.16.
//
//

#import "SLObject.h"

@interface SLSubscriptionService :SLObject

@property (nonatomic, strong) NSString *subscriptionId;
@property (nonatomic, strong) NSNumber *expiresTime;

@end