//
//  SLErrorMapperProtocol.h
//  Pods
//
//  Created by Mikhail on 12.02.16.
//
//

#import "SLObjectMapperProtocol.h"
#import "SLError.h"

@protocol SLErrorMapperProtocol <SLObjectMapperProtocol>

@required
- (SLError *)mapError:(id)dict;

@end
