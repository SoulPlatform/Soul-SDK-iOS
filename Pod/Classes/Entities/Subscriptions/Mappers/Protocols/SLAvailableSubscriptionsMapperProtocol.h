//
//  SLAvailableSubscriptionsMapperProtocol.h
//  Pods
//
//  Created by Mikhail on 29.02.16.
//
//

#import "SLObjectMapperProtocol.h"
#import "SLAvailableSubscriptions.h"

@protocol SLAvailableSubscriptionsMapperProtocol <SLObjectMapperProtocol>

@required
- (SLAvailableSubscriptions *)mapAvailableSubscriptions:(id)dict;

@end