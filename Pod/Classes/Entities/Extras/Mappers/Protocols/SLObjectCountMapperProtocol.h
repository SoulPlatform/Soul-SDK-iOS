//
//  SLObjectCountMapperProtocol.h
//  Pods
//
//  Created by Mikhail on 26.02.16.
//
//

#import "SLObjectMapperProtocol.h"
#import "SLObjectCount.h"

@protocol SLObjectCountMapperProtocol <SLObjectMapperProtocol>

@required
- (SLObjectCount *)mapObjectCount:(id)dict;

@end
