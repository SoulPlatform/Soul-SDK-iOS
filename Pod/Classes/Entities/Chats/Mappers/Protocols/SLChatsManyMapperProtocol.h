//
//  SLChatsManyMapperProtocol.h
//  Pods
//
//  Created by Mikhail on 01.03.16.
//
//

#import "SLObjectMapperProtocol.h"
#import "SLChatsMany.h"

@protocol SLChatsManyMapperProtocol <SLObjectMapperProtocol>

@required
- (SLChatsMany *)mapChatsMany:(id)dict;

@end