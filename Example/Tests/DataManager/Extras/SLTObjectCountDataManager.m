//
//  SLTObjectCountDataManager.m
//  SoulSDK
//
//  Created by Mikhail on 29.03.16.
//  Copyright © 2016 Mikhail Shershnev. All rights reserved.
//

#import "SLTObjectCountDataManager.h"

@implementation SLTObjectCountDataManager

NSString *_Nonnull const kChatsKey = @"chats";

NSString *_Nonnull const kNotDeletedByMeKey = @"notDeletedByMe";
NSString *_Nonnull const kNotDeletedByAnyoneKey = @"notDeletedByAnyone";
NSString *_Nonnull const kNotExpiredAndNotDeletedByAnyoneKey = @"notExpiredAndNotDeletedByAnyone";

- (nonnull NSDictionary *)objectCount {
    
    NSInteger notDeletedByMe = [self notDeletedByMe];
    NSInteger notDeletedByAnyone = [self notDeletedByAnyone];
    NSInteger notExpiredAndNotDeletedByAnyone = [self notExpiredAndNotDeletedByAnyone];

    return @{
             kChatsKey: @{
                     kNotDeletedByMeKey: @(notDeletedByMe),
                     kNotDeletedByAnyoneKey: @(notDeletedByAnyone),
                     kNotExpiredAndNotDeletedByAnyoneKey: @(notExpiredAndNotDeletedByAnyone),
                     }
             };
}

- (NSInteger)notDeletedByMe {
    return 11;
}

- (NSInteger)notDeletedByAnyone {
    return 7;
}

- (NSInteger)notExpiredAndNotDeletedByAnyone {
    return 4;
}

@end
