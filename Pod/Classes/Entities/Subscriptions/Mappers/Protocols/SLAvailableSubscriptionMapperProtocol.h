//
//  SLAvailableSubscriptionMapperProtocol.h
//  Pods
//
//  Created by Mikhail on 29.02.16.
//
//

#import "SLObjectMapperProtocol.h"
#import "SLAvailableSubscription.h"

@protocol SLAvailableSubscriptionMapperProtocol <SLObjectMapperProtocol>

@required
- (SLAvailableSubscription *)mapAvailableSubscription:(id)dict;

@end