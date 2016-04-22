//
//  SLTAuthorizationDataManager.h
//  SoulSDK
//
//  Created by Mikhail on 29.03.16.
//  Copyright © 2016 Mikhail Shershnev. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *_Nonnull const kExpiresTimeKey;
extern NSString *_Nonnull const kSessionTokenKey;

@interface SLTAuthorizationDataManager :NSObject

- (nonnull NSDictionary *)authorization;

- (double)expiresTimeDouble;
- (nonnull NSString *)expiresTimeString;
- (nonnull NSString *)sessionToken;

@end
