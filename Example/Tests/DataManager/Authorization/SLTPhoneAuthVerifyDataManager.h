//
//  SLTPhoneAuthVerifyDataManager.h
//  SoulSDK
//
//  Created by Mikhail on 29.03.16.
//  Copyright © 2016 Mikhail Shershnev. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *_Nonnull const kMeKey;
extern NSString *_Nonnull const kProviderKey;
extern NSString *_Nonnull const kObjectCountKey;
extern NSString *_Nonnull const kAuthorizationKey;
extern NSString *_Nonnull const kAdditionalInfoKey;

@interface SLTPhoneAuthVerifyDataManager :NSObject

- (nonnull NSDictionary *)phoneAuthVerify;
- (nonnull NSNumber *)providerId;

@end
