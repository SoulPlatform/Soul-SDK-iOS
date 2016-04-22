//
//  SLAdditionalInfoMapperProtocol.h
//  Pods
//
//  Created by Mikhail on 10.02.16.
//
//

#import "SLObjectMapperProtocol.h"
#import "SLAdditionalInfo.h"

@protocol SLAdditionalInfoMapperProtocol <SLObjectMapperProtocol>

@required
- (SLAdditionalInfo *)mapAdditionalInfo:(id)dict;

@end
