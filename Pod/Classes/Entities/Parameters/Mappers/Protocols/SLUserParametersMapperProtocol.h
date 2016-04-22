//
//  SLUserParametersMapperProtocol.h
//  Pods
//
//  Created by Mikhail on 07.03.16.
//
//

#import "SLObjectMapperProtocol.h"
#import "SLUserParameters.h"

@protocol SLUserParametersMapperProtocol <SLObjectMapperProtocol>

@required
- (SLUserParameters *)mapParameters:(NSDictionary *)dict;

@end