//
//  SLTUserResponseDataManager.h
//  SoulSDK
//
//  Created by Mikhail on 29.03.16.
//  Copyright © 2016 Mikhail Shershnev. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *_Nonnull const kMeKey;
extern NSString *_Nonnull const kInfoKey;

@interface SLTUserResponseDataManager : NSObject

- (nonnull NSDictionary *)meUserResponse; // current user
- (nonnull NSDictionary *)userResponse; // other user

@end
