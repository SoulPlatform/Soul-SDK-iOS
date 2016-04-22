//
//  SLEventsResponseMapperProtocol.h
//  Pods
//
//  Created by Mikhail on 11.04.16.
//
//

#import "SLObjectMapperProtocol.h"
#import "SLEventsResponse.h"

@protocol SLEventsResponseMapperProtocol <SLObjectMapperProtocol>

@required
- (SLEventsResponse *)mapEventsResponse:(id)dict;

@end