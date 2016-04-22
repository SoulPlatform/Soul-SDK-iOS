//
//  SLEventReactionsMapperProtocol.h
//  Pods
//
//  Created by Mikhail on 16.03.16.
//
//

#import "SLObjectMapperProtocol.h"
#import "SLEventReactions.h"

@protocol SLEventReactionsMapperProtocol <SLObjectMapperProtocol>

@required
- (SLEventReactions *)mapEventReactions:(id)dict;

@end