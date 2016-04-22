//
//  SLTPhoneAuthVerifyDataManager.m
//  SoulSDK
//
//  Created by Mikhail on 29.03.16.
//  Copyright © 2016 Mikhail Shershnev. All rights reserved.
//

#import "SLTPhoneAuthVerifyDataManager.h"

#import "SLTUserDataManager.h"
#import "SLTObjectCountDataManager.h"
#import "SLTAuthorizationDataManager.h"
#import "SLTAdditionalInfoDataManager.h"

NSString *_Nonnull const kMeUserKey = @"me";
NSString *_Nonnull const kProviderKey = @"providerId";
NSString *_Nonnull const kObjectCountKey = @"objectCount";
NSString *_Nonnull const kAuthorizationKey = @"authorization";
NSString *_Nonnull const kAdditionalInfoKey = @"additionalInfo";

@implementation SLTPhoneAuthVerifyDataManager

- (nonnull NSDictionary *)phoneAuthVerify {

    return @{
             kMeUserKey: [self meUser],
             kProviderKey: [self providerId],
             kObjectCountKey: [self objectCount],
             kAuthorizationKey: [self authorization],
             kAdditionalInfoKey: [self additionalInfo],
             };
}

- (nonnull NSDictionary *)meUser {
    SLTUserDataManager *userData = [SLTUserDataManager new];
    return [userData meUser];
}

- (nonnull NSNumber *)providerId {
    return @(SLPhoneAuthRequestSinchProvider);
}

- (nonnull NSDictionary *)objectCount {
    SLTObjectCountDataManager *objectCountData = [SLTObjectCountDataManager new];
    return [objectCountData objectCount];
}

- (nonnull NSDictionary *)authorization {
    SLTAuthorizationDataManager *authorizationData = [SLTAuthorizationDataManager new];
    return [authorizationData authorization];
}

- (nonnull NSDictionary *)additionalInfo {
    SLTAdditionalInfoDataManager *additionalInfoData = [SLTAdditionalInfoDataManager new];
    return [additionalInfoData additionalInfo];
}

@end
