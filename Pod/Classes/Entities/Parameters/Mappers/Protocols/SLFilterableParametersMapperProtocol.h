//
//  SLFilterableParametersMapperProtocol.h
//  Pods
//
//  Created by Mikhail on 07.03.16.
//
//

#import "SLObjectMapperProtocol.h"
#import "SLFilterableParameters.h"

@protocol SLFilterableParametersMapperProtocol <SLObjectMapperProtocol>

@required
- (SLFilterableParameters *)mapFilterableParameters:(NSDictionary *)dict;

@end