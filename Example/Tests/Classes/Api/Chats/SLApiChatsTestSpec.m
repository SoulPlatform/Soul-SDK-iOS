//
//  SLApiChatsTestSpec.m
//  SoulSDK
//
//  Created by Mikhail on 07.04.16.
//  Copyright © 2016 Mikhail Shershnev. All rights reserved.
//

#import "SLTHttpClientMock.h"
#import "SLTChatsDataManager.h"

SpecBegin(SLApiChats)

describe(@"users endpoint", ^{

    NSObject<SLHttpClientProtocol> *httpClient;
    SLApiChats *chatsApi = [[SLApiChats alloc] initWithHttpClient:httpClient storage:nil config:nil];

    SLTChatsDataManager *chatsData = [SLTChatsDataManager new];
    NSDictionary *chatResponse = [chatsData chatResponse];
    NSDictionary *chatsResponse = [chatsData chatsResponse];

    NSInteger statusCode200 = 200;
    NSInteger statusCode400 = 400;

    describe(@"load user chats", ^{

        NSNumber *limit = @(20);
        NSNumber *after = @(40);

        it(@"success", ^{

            chatsApi.httpClient = [SLTHttpClientMock executedSuccessfullyWithStatusCode:statusCode200 response:chatsResponse];

            [chatsApi loadChatsAfter:after
                               limit:limit
                         showExpired:YES
                             success:^(SLChatsMany * _Nonnull chatsResponse) {

                                 expect(chatsResponse).notTo.beNil();
                                 expect(chatsResponse.meta).notTo.beNil();
                                 expect(chatsResponse.chats).notTo.beNil();
                                 expect(chatsResponse.additionalInfo).notTo.beNil();

                             } failure:nil];

        });

        it(@"failure", ^{

            chatsApi.httpClient = [SLTHttpClientMock executedSuccessfullyWithStatusCode:statusCode400 response:nil];

            [chatsApi loadChatsAfter:after
                               limit:limit
                         showExpired:YES
                             success:nil
                             failure:^(NSError * _Nullable error) {
                                 expect(error).to.beNil();
                             }];

        });
    });

    NSString *chatId = @"74gfl38ghe8";

    describe(@"load user chat", ^{

        it(@"success", ^{

            chatsApi.httpClient = [SLTHttpClientMock executedSuccessfullyWithStatusCode:statusCode200 response:chatResponse];

            [chatsApi loadChatAtId:chatId
                           success:^(SLChatsOne * _Nonnull chatResponse) {
                               expect(chatResponse).notTo.beNil();
                               expect(chatResponse.chat).notTo.beNil();
                               expect(chatResponse.additionalInfo).notTo.beNil();
                             } failure:nil];
        });
        
        it(@"failure", ^{

            chatsApi.httpClient = [SLTHttpClientMock executedSuccessfullyWithStatusCode:statusCode400 response:nil];

            [chatsApi loadChatAtId:chatId
                           success:nil
                           failure:^(NSError * _Nullable error) {
                               expect(error).to.beNil();
                           }];
            
        });

    });

    describe(@"remove user chat", ^{
        
        it(@"success", ^{
            
            chatsApi.httpClient = [SLTHttpClientMock executedSuccessfullyWithStatusCode:statusCode200 response:chatResponse];
            
            [chatsApi removeChatAtId:chatId
                             success:^(SLResponse * _Nonnull response) {
                                 expect(response).notTo.beNil();
                             } failure:nil];
        });

        it(@"failure", ^{

            chatsApi.httpClient = [SLTHttpClientMock executedSuccessfullyWithStatusCode:statusCode400 response:nil];

            [chatsApi loadChatAtId:chatId
                           success:nil
                           failure:^(NSError * _Nullable error) {
                               expect(error).to.beNil();
                           }];
            
        });

    });
});

SpecEnd
