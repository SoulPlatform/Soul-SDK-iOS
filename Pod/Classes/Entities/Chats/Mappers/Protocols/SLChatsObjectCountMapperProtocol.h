//
//  SLChatsObjectCountMapperProtocol.h
//  Pods
//
//  Created by Mikhail on 26.02.16.
//
//

#import "SLObjectMapperProtocol.h"
#import "SLChatsObjectCount.h"

@protocol SLChatsObjectCountMapperProtocol <SLObjectMapperProtocol>

@required
- (SLChatsObjectCount *)mapChatsObjectCount:(id)dict;

@end
