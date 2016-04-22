//
//  SLTAuthorizationDataManager.m
//  SoulSDK
//
//  Created by Mikhail on 29.03.16.
//  Copyright © 2016 Mikhail Shershnev. All rights reserved.
//

#import "SLTAuthorizationDataManager.h"

NSString *_Nonnull const kExpiresTimeKey = @"expiresTime";
NSString *_Nonnull const kSessionTokenKey = @"sessionToken";

@implementation SLTAuthorizationDataManager

- (nonnull NSDictionary *)authorization {

    double expiresTime = [self expiresTimeDouble];
    return @{
             kExpiresTimeKey: @(expiresTime),
             kSessionTokenKey: [self sessionToken],
             };
}

- (double)expiresTimeDouble {
    return 1247116497.321;
}

- (NSString *)expiresTimeString {
    return @"1247116497.321";
}

- (NSString *)sessionToken {
    return @"wejwp09jsJJ902Tj23rkpiJKhfpjep";
};

@end
