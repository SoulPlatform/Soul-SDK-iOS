//
//  SoulSDK.m
//  Pods
//
//  Created by Mikhail on 26.01.16.
//
//

#import "SoulSDK.h"
#import "SLStorage.h"
#import "SLHttpClient.h"

@interface SoulSDK ()
@property (nonatomic, strong, readwrite) SLConfig *config;
@property (nonatomic, strong, readwrite) NSObject <SLStorageProtocol> *storage;
@property (nonatomic, strong, readwrite) NSObject<SLHttpClientProtocol> *httpClient;
@end

@implementation SoulSDK

static SoulSDK *instance = nil;

+ (instancetype)instance {
    return instance;
}

+ (instancetype)activateWithApiConfig:(SLConfig *)config {
    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{
        instance = [self new];

        instance.config = config;
        instance.storage = [SLStorage new];
        instance.httpClient = [[SLHttpClient alloc] initWithApiConfig:instance.config
                                                              storage:instance.storage];
    });

    return instance;
}

- (BOOL)authorized {
    return _storage.userId ? YES : NO;
}

- (SLApiMe *)me {
    return [[SLApiMe alloc] initWithHttpClient:_httpClient
                                       storage:_storage
                                        config:_config];
}

- (SLApiAuth *)auth {
    return [[SLApiAuth alloc] initWithHttpClient:_httpClient
                                         storage:_storage
                                          config:_config];
}

- (SLApiPhoneAuth *)phoneAuth {
    return [[SLApiPhoneAuth alloc] initWithHttpClient:self.httpClient
                                              storage:self.storage
                                               config:self.config];
}

- (SLApiPasswordAuth *)passwordAuth {
    return [[SLApiPasswordAuth alloc] initWithHttpClient:self.httpClient
                                                 storage:self.storage
                                                  config:self.config];
}

- (SLApiUser *)user {
    return [[SLApiUser alloc] initWithHttpClient:_httpClient
                                         storage:_storage
                                          config:_config];
}

- (SLApiUsers *)users {
    return [[SLApiUsers alloc] initWithHttpClient:_httpClient
                                          storage:_storage
                                           config:_config];
}

- (SLApiAlbum *)album {
    return [[SLApiAlbum alloc] initWithHttpClient:_httpClient
                                          storage:_storage
                                           config:_config];
}

- (SLApiPhoto *)photo {
    return [[SLApiPhoto alloc] initWithHttpClient:_httpClient
                                          storage:_storage
                                           config:_config];
}

- (SLApiChats *)chats {
    return [[SLApiChats alloc] initWithHttpClient:_httpClient
                                          storage:_storage
                                           config:_config];
}

- (SLApiEvents *)events {
    return [[SLApiEvents alloc] initWithHttpClient:_httpClient
                                           storage:_storage
                                            config:_config];
}

- (SLChatManager *)chatManager:(SLChat *)chat {
    return [[SLChatManager alloc] initWithChat:chat
                                       storage:_storage
                                        config:_config];
}

@end
