//
//  SLMeUserResponseMapperProtocol.h
//  Pods
//
//  Created by Mikhail on 09.03.16.
//
//

#import "SLObjectMapperProtocol.h"
#import "SLMeUserResponse.h"

@protocol SLMeUserResponseMapperProtocol <SLObjectMapperProtocol>

@required
- (SLMeUserResponse *)mapMeUserResponse:(id)dict;

@end