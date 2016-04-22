//
//  SLTChatsDataManager.h
//  SoulSDK
//
//  Created by Mikhail on 07.04.16.
//  Copyright © 2016 Mikhail Shershnev. All rights reserved.
//

#import <SoulSDK/SoulSDK.h>

@interface SLTChatsDataManager :NSObject

- (nonnull NSDictionary *)chatResponse;
- (nonnull NSDictionary *)chatsResponse;

- (nonnull NSArray *)chats;
- (nonnull NSDictionary *)chat;

@end