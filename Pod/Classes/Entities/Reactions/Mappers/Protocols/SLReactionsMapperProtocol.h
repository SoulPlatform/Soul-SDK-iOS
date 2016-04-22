//
//  SLReactionsMapperProtocol.h
//  Pods
//
//  Created by Mikhail on 08.03.16.
//
//

#import "SLObjectMapperProtocol.h"
#import "SLReactions.h"

@protocol SLReactionsMapperProtocol <SLObjectMapperProtocol>

@required
- (SLReactions *)mapReactions:(id)dict;

@end