//
//  SLNotificationTokensMapperProtocol.h
//  Pods
//
//  Created by Mikhail on 25.02.16.
//
//

#import "SLObjectMapperProtocol.h"
#import "SLNotificationTokens.h"

@protocol SLNotificationTokensMapperProtocol <SLObjectMapperProtocol>

@required
- (SLNotificationTokens *)mapNotificationTokens:(id)dict;

@end
