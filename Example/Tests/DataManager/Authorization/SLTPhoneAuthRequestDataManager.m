//
//  SLTPhoneAuthRequestDataManager.m
//  SoulSDK
//
//  Created by Mikhail on 29.03.16.
//  Copyright © 2016 Mikhail Shershnev. All rights reserved.
//

#import "SLTPhoneAuthRequestDataManager.h"

NSString *_Nonnull const kStatusKey = @"status";
NSString *_Nonnull const kProviderIdKey = @"providerId";

@implementation SLTPhoneAuthRequestDataManager

- (nonnull NSDictionary *)phoneAuthRequest {
    return @{
             kStatusKey: [self statusAccepted],
             kProviderIdKey: [self providerIdString],
             };
}

- (nonnull NSString *)statusWait {
    return @"wait";
}

- (nonnull NSString *)statusAccepted {
    return @"accepted";
}

- (nonnull NSString *)providerIdString {
    return @"1";
}

- (NSInteger)providerIdInteger {
    return 0;
}

@end
