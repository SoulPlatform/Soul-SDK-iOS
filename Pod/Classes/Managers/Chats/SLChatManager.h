//
//  SLChatManager.h
//  Pods
//
//  Created by Mikhail on 18.04.16.
//
//

#import <Foundation/Foundation.h>
#import "SLChat.h"
#import "SLConfig.h"
#import "SLStorageProtocol.h"
#import "SLTextMessage.h"

@protocol SLChatManagerProtocol
- (void)messageReceived:(SLTextMessage *)message;
@end

typedef void (^SLGetHistorySuccess)(NSArray <SLTextMessage *> *messages);
typedef void (^SLGetHistoryFailure)(void);

typedef void (^SLSendMessageSuccess)(SLTextMessage *message);
typedef void (^SLSendMessageFailure)(void);

@interface SLChatManager :NSObject

- (instancetype)initWithChat:(SLChat *)chat storage:(NSObject<SLStorageProtocol> *)storage config:(SLConfig *)config;

- (void)sendMessage:(NSString *)text;
- (void)sendMessage:(NSString *)text success:(SLSendMessageSuccess)success failure:(SLSendMessageFailure)failure;

- (void)getHistory:(SLGetHistorySuccess)success failure:(SLGetHistoryFailure)failure;

@property (nonatomic, weak) NSObject <SLChatManagerProtocol> *delegate;

@end
