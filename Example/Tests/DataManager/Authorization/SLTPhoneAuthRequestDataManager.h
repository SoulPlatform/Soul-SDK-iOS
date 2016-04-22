//
//  SLTPhoneAuthRequestDataManager.h
//  SoulSDK
//
//  Created by Mikhail on 29.03.16.
//  Copyright © 2016 Mikhail Shershnev. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *_Nonnull const kStatusKey;
extern NSString *_Nonnull const kProviderIdKey;

@interface SLTPhoneAuthRequestDataManager :NSObject

- (nonnull NSDictionary *)phoneAuthRequest;

- (nonnull NSString *)statusWait;
- (nonnull NSString *)statusAccepted;
- (nonnull NSString *)providerIdString;
- (NSInteger)providerIdInteger;

@end
