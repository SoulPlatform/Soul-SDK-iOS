//
//  SLSubscriptionServicesMapperProtocol.h
//  Pods
//
//  Created by Mikhail on 06.03.16.
//
//

#import "SLObjectMapperProtocol.h"
#import "SLSubscriptionServices.h"

@protocol SLSubscriptionServicesMapperProtocol <SLObjectMapperProtocol>

@required
- (SLSubscriptionServices *)mapServices:(id)dict;

@end