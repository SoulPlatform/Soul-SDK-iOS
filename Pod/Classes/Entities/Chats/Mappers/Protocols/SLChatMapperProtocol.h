//
//  SLChatMapperProtocol.h
//  Pods
//
//  Created by Mikhail on 01.03.16.
//
//

#import "SLObjectMapperProtocol.h"
#import "SLChat.h"

@protocol SLChatMapperProtocol <SLObjectMapperProtocol>

@required
- (SLChat *)mapChat:(id)dict;

@end