//
//  SoulSDK.h
//  Pods
//
//  Created by Mikhail on 26.01.16.
//
//

#import <Foundation/Foundation.h>
#import "SLConfig.h"

#import "SLApiMe.h"
#import "SLApiAuth.h"
#import "SLApiPhoneAuth.h"
#import "SLApiPasswordAuth.h"
#import "SLApiUser.h"
#import "SLApiUsers.h"
#import "SLApiAlbum.h"
#import "SLApiPhoto.h"
#import "SLApiChats.h"
#import "SLApiEvents.h"
#import "SLChatManager.h"

@interface SoulSDK : NSObject

@property (nonatomic, strong, readonly) SLConfig *config;
@property (nonatomic, strong, readonly) NSObject<SLHttpClientProtocol> *httpClient;

+ (instancetype)instance;
+ (instancetype)activateWithApiConfig:(SLConfig *)config;

- (BOOL)authorized;

- (SLApiMe *)me;
- (SLApiAuth *)auth;
- (SLApiPhoneAuth *)phoneAuth;
- (SLApiPasswordAuth *)passwordAuth;
- (SLApiUser *)user;
- (SLApiUsers *)users;
- (SLApiAlbum *)album;
- (SLApiPhoto *)photo;
- (SLApiChats *)chats;
- (SLApiEvents *)events;

- (SLChatManager *)chatManager:(SLChat *)chat;

@end
