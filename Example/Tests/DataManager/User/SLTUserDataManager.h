//
//  SLTUserDataManager.h
//  SoulSDK
//
//  Created by Mikhail on 29.03.16.
//  Copyright © 2016 Mikhail Shershnev. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *_Nonnull const kIdKey;
extern NSString *_Nonnull const kRecordIdKey;
extern NSString *_Nonnull const kTokensKey;
extern NSString *_Nonnull const kServicesKey;
extern NSString *_Nonnull const kParametersKey;
extern NSString *_Nonnull const kAlbumsKey;
extern NSString *_Nonnull const kChatKey;
extern NSString *_Nonnull const kReactionsKey;

@interface SLTUserDataManager :NSObject

- (nonnull NSDictionary *)meUser; // current user
- (nonnull NSDictionary *)user; // other user

- (nonnull NSDictionary *)tokens;
- (nonnull NSDictionary *)services;
- (nonnull NSDictionary *)parameters;

- (nonnull NSDictionary *)album;
- (nonnull NSArray *)albums;

- (nonnull NSDictionary *)reactions;
- (nonnull NSDictionary *)chat;

@end
