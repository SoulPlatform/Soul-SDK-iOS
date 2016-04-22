//
//  SLEventTypeMapperProtocol.h
//  Pods
//
//  Created by Mikhail on 09.03.16.
//
//

#import "SLObjectMapperProtocol.h"
#import "SLEventType.h"

@protocol SLEventTypeMapperProtocol <SLObjectMapperProtocol>

@required
- (SLEventType *)mapEventType:(id)dict;

@end