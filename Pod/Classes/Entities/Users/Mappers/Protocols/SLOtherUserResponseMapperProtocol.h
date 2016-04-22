//
//  SLOtherUserResponseMapperProtocol.h
//  Pods
//
//  Created by Mikhail on 06.04.16.
//
//

#import "SLObjectMapperProtocol.h"
#import "SLOtherUserResponse.h"

@protocol SLOtherUserResponseMapperProtocol <SLObjectMapperProtocol>

@required
- (SLOtherUserResponse *)mapOtherUserResponse:(id)dict;

@end