//
//  SLSubscriptionDurationMapperProtocol.h
//  Pods
//
//  Created by Mikhail on 26.02.16.
//
//

#import "SLObjectMapperProtocol.h"
#import "SLSubscriptionDuration.h"

@protocol SLSubscriptionDurationMapperProtocol <SLObjectMapperProtocol>

@required
- (SLSubscriptionDuration *)mapSubscriptionDuration:(id)dict;

@end
