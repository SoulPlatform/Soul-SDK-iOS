//
//  SLApiChats.m
//  Pods
//
//  Created by Mikhail on 07.04.16.
//
//

#import "SLApiChats.h"
#import "SLChatsOneMapper.h"
#import "SLChatsManyMapper.h"

static NSString *_Nonnull const kChatsEndpoint = @"/chats";

@implementation SLApiChats

// GET: /chats/{chatId}
- (void)loadChatAtId:(nullable NSString *)chatId
             success:(nullable SLApiChatsOneSuccess)success
             failure:(nullable SLApiRequestFailure)failure {

    NSString *endpoint = [NSString stringWithFormat:@"%@/%@", kChatsEndpoint, chatId];
    NSString *uri = [self uriFrom:endpoint];

    [self GET:uri params:nil success:^(SLResponse *_Nonnull response) {

        if (success) {

            NSObject <SLChatsOneMapperProtocol> *mapper = [SLChatsOneMapper new];
            SLChatsOne *chatResponse = [mapper mapChatsOne:response.dict];

            success(chatResponse);
        }

    } failure:failure];
}

// DELTE: /chats/{chatId}
- (void)removeChatAtId:(nullable NSString *)chatId
               success:(nullable SLApiRequestSuccess)success
               failure:(nullable SLApiRequestFailure)failure {

    NSString *endpoint = [NSString stringWithFormat:@"%@/%@", kChatsEndpoint, chatId];
    NSString *uri = [self uriFrom:endpoint];

    [self DELETE:uri params:nil success:success failure:failure];
}

// GET: /chats
- (void)loadChatsAfter:(nullable NSNumber *)after
                 limit:(nonnull NSNumber *)limit
               success:(nullable SLApiChatsManySuccess)success
               failure:(nullable SLApiRequestFailure)failure {

    BOOL showExpired = NO;

    [self loadChatsAfter:after
                   limit:limit
             showExpired:showExpired
                 success:success
                 failure:failure];    
}

// GET: /chats
- (void)loadChatsAfter:(nullable NSNumber *)after
                 limit:(nonnull NSNumber *)limit
           showExpired:(BOOL)showExpired
               success:(nullable SLApiChatsManySuccess)success
               failure:(nullable SLApiRequestFailure)failure {

    NSMutableDictionary *query = [NSMutableDictionary dictionary];
    [query forKey:@"limit" setValue:limit];
    [query forKey:@"showExpired" setValue:@(showExpired)];
    if (after) {
        [query forKey:@"after" setValue:after];
    }

    NSString *uri = [self uriFrom:kChatsEndpoint withQueryParams:query];

    [self GET:uri params:nil success:^(SLResponse *_Nonnull response) {

        if (success) {

            NSObject <SLChatsManyMapperProtocol> *mapper = [SLChatsManyMapper new];
            SLChatsMany *chatsResponse = [mapper mapChatsMany:response.dict];

            success(chatsResponse);
        }

    } failure:failure];
}

@end
