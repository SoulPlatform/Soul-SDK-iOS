//
//  SLChatManager.m
//  Pods
//
//  Created by Mikhail on 18.04.16.
//
//

#import "SLChatManager.h"
#import <PubNub/PubNub.h>
#import "SLTextMessage.h"

@interface SLChatManager () <PNObjectEventListener>

@property (nonatomic, strong) SLChat *chat;
@property (nonatomic, strong) SLConfig *config;
@property (nonatomic, strong) NSObject<SLStorageProtocol> *storage;

@property (nonatomic, strong) PubNub *client;

@end

@implementation SLChatManager

- (instancetype)initWithChat:(SLChat *)chat storage:(NSObject<SLStorageProtocol> *)storage config:(SLConfig *)config {
    self = [self init];

    if (self) {
        _chat = chat;
        _config = config;
        _storage = storage;

        {
            PNConfiguration *config = [PNConfiguration configurationWithPublishKey:_config.pubKey
                                                                      subscribeKey:_config.subKey];
            _client = [PubNub clientWithConfiguration:config];

            [_client addListener:self];
            [_client subscribeToChannels:@[_chat.channelName] withPresence:NO];
        }
    }

    return self;
}

- (void)sendMessage:(NSString *)text {
    [self sendMessage:text success:nil failure:nil];
}

- (void)sendMessage:(NSString *)text success:(SLSendMessageSuccess)success failure:(SLSendMessageFailure)failure {

    SLTextMessage *msg = [SLTextMessage messageWithText:text];

    msg.userId = _storage.userId;
    msg.timestamp = [self timestamp];
    msg.messageId = [self nextMessageId];

    NSDictionary *dict = [msg toDictionary];

    [_client publish:dict
           toChannel:_chat.channelName
          compressed:NO
      withCompletion:^(PNPublishStatus * _Nonnull status) {

          if (!status.isError) {

              if (success) {
                  success(msg);
              }
          }
          else {

              if (failure) {
                  failure();
              }
          }
    }];
}

- (void)getHistory:(SLGetHistorySuccess)success failure:(SLGetHistoryFailure)failure {

    [_client historyForChannel:_chat.channelName withCompletion:^(PNHistoryResult *_Nullable result, PNErrorStatus *_Nullable status) {

        if (!status.isError) {

            if (success) {
                NSMutableArray *messages = [NSMutableArray array];

                for (NSDictionary *dict in result.data.messages) {

                    SLTextMessage *msg = [SLTextMessage messageFromDictionary:dict];

                    if (msg) {
                        [messages addObject:msg];
                    }
                }

                NSArray *result = [NSArray arrayWithArray:messages];
                success(result);
            }
        }
        else {

            if (failure) {
                failure();
            }
        }
    }];
}

- (void)client:(PubNub *)client didReceiveMessage:(PNMessageResult *)message {
    
    NSLog(@"Received message: %@ on channel %@ at %@", message.data.message,
          message.data.subscribedChannel, message.data.timetoken);

    SLTextMessage *msg = [SLTextMessage messageFromDictionary:message.data.message];

    if (msg) {
        [_delegate messageReceived:msg];
    }
}

- (NSNumber *)timestamp {
    NSDate *date = [NSDate date];
    NSTimeInterval timestamp = [date timeIntervalSince1970];
    return @(timestamp);
}

- (NSNumber *)nextMessageId {
    return [_storage nextMessageIdByChatId:_chat.chatId];
}

@end
