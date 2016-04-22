//
//  SLUsersRecsResponseMapperProtocol.h
//  Pods
//
//  Created by Mikhail on 05.04.16.
//
//

#import "SLObjectMapperProtocol.h"
#import "SLUsersRecsResponse.h"

@protocol SLUsersRecsResponseMapperProtocol <SLObjectMapperProtocol>

@required
- (SLUsersRecsResponse *)mapUsersRecsResponse:(id)dict;

@end