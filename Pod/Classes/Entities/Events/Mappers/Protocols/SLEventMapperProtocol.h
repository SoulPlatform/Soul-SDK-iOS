//
//  SLEventMapperProtocol.h
//  Pods
//
//  Created by Mikhail on 09.03.16.
//
//

#import "SLEvent.h"
#import "SLMeEvent.h"
#import "SLUserEvent.h"
#import "SLChatEvent.h"
#import "SLEndpointEvent.h"
#import "SLReactionsEvent.h"

@protocol SLEventMapperProtocol

@required
- (SLEvent *)mapEvent:(id)dict;
- (SLEvent *)_mapEvent:(id)dict;

- (SLMeEvent *)mapMeEvent:(id)dict;
- (SLUserEvent *)mapUserEvent:(id)dict;
- (SLChatEvent *)mapChatEvent:(id)dict;
- (SLEndpointEvent *)mapEndpointEvent:(id)dict;
- (SLReactionsEvent *)mapReactionsEvent:(id)dict;

@end