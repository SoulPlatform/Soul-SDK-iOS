//
//  SLSubscriptionServiceMapperProtocol.h
//  Pods
//
//  Created by Mikhail on 06.03.16.
//
//

#import "SLObjectMapperProtocol.h"
#import "SLSubscriptionService.h"

@protocol SLSubscriptionServiceMapperProtocol <SLObjectMapperProtocol>

@required
- (SLSubscriptionService *)mapService:(id)dict;

@end