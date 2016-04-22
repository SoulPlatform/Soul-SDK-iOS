//
//  SLAuthorizationMapperProtocol.h
//  Pods
//
//  Created by Mikhail on 12.02.16.
//
//

#import "SLObjectMapperProtocol.h"
#import "SLAuthorization.h"

@protocol SLAuthorizationMapperProtocol <SLObjectMapperProtocol>

@required
- (SLAuthorization *)mapAuthorization:(id)dict;

@end
