//
//  SLUsersFilterResponseMapperProtocol.h
//  Pods
//
//  Created by Mikhail on 05.04.16.
//
//

#import "SLObjectMapperProtocol.h"
#import "SLUsersFilterResponse.h"

@protocol SLUsersFilterResponseMapperProtocol <SLObjectMapperProtocol>

@required
- (SLUsersFilterResponse *)mapUsersFilterResponse:(id)dict;

@end