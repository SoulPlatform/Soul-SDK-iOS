//
//  SLApiChats.h
//  Pods
//
//  Created by Mikhail on 07.04.16.
//
//

#import "SLApiBase.h"
#import "SLChatsOne.h"
#import "SLChatsMany.h"

typedef void (^SLApiChatsOneSuccess)(SLChatsOne *_Nonnull responce);
typedef void (^SLApiChatsManySuccess)(SLChatsMany *_Nonnull responce);

@interface SLApiChats :SLApiBase

// GET: /chats/{chatId}
- (void)loadChatAtId:(nullable NSString *)chatId
             success:(nullable SLApiChatsOneSuccess)success
             failure:(nullable SLApiRequestFailure)failure;

// DELETE: /chats/{chatId}
- (void)removeChatAtId:(nullable NSString *)chatId
               success:(nullable SLApiRequestSuccess)success
               failure:(nullable SLApiRequestFailure)failure;

// GET: /chats
- (void)loadChatsAfter:(nullable NSString *)after
                 limit:(nonnull NSNumber *)limit
               success:(nullable SLApiChatsManySuccess)success
               failure:(nullable SLApiRequestFailure)failure;

// GET: /chats
- (void)loadChatsAfter:(nullable NSString *)after
                 limit:(nonnull NSNumber *)limit
           showExpired:(BOOL)showExpired
               success:(nullable SLApiChatsManySuccess)success
               failure:(nullable SLApiRequestFailure)failure;

@end
