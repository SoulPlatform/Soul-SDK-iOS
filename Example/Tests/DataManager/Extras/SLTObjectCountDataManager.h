//
//  SLTObjectCountDataManager.h
//  SoulSDK
//
//  Created by Mikhail on 29.03.16.
//  Copyright © 2016 Mikhail Shershnev. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *_Nonnull const kChatsKey;

@interface SLTObjectCountDataManager :NSObject

- (nonnull NSDictionary *)objectCount;

- (NSInteger)notDeletedByMe;
- (NSInteger)notDeletedByAnyone;
- (NSInteger)notExpiredAndNotDeletedByAnyone;

@end
