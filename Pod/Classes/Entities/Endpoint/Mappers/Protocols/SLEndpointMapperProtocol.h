//
//  SLEndpointMapperProtocol.h
//  Pods
//
//  Created by Mikhail on 16.03.16.
//
//

#import "SLObjectMapperProtocol.h"
#import "SLEndpoint.h"

@protocol SLEndpointMapperProtocol <SLObjectMapperProtocol>

@required
- (SLEndpoint *)mapEndpoint:(id)dict;

@end