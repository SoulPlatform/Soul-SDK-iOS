//
//  SLChatEvent.h
//  Pods
//
//  Created by Mikhail on 09.03.16.
//
//

#import "SLEvent.h"
#import "SLChat.h"

@interface SLChatEvent :SLEvent

@property (nonatomic, strong) SLChat *chat;

@end