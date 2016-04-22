//
//  SLLocationMapperProtocol.h
//  Pods
//
//  Created by Mikhail on 12.02.16.
//
//

#import "SLObjectMapperProtocol.h"
#import "SLLocation.h"

@protocol SLLocationMapperProtocol <SLObjectMapperProtocol>

@required
- (SLLocation *)mapLocation:(id)dict;

@end
