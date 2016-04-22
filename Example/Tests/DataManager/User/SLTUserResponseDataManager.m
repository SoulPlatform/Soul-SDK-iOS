//
//  SLTUserResponseDataManager.m
//  SoulSDK
//
//  Created by Mikhail on 29.03.16.
//  Copyright © 2016 Mikhail Shershnev. All rights reserved.
//

#import "SLTUserResponseDataManager.h"

#import "SLTUserDataManager.h"
#import "SLTAdditionalInfoDataManager.h"

NSString *_Nonnull const kMeKey = @"me";
NSString *_Nonnull const kUserKey = @"user";
NSString *_Nonnull const kInfoKey = @"additionalInfo";

@implementation SLTUserResponseDataManager

- (nonnull NSDictionary *)meUserResponse {

    return @{
             kMeKey: [self me],
             kInfoKey: [self additionalInfo],
             };
}

- (nonnull NSDictionary *)userResponse {

    return @{
             kUserKey: [self user],
             kInfoKey: [self additionalInfo],
             };
}

- (nonnull NSDictionary *)me {
    SLTUserDataManager *userData = [SLTUserDataManager new];
    return [userData meUser];
}

- (nonnull NSDictionary *)user {
    SLTUserDataManager *userData = [SLTUserDataManager new];
    return [userData user];
}

- (nonnull NSDictionary *)additionalInfo {
    SLTAdditionalInfoDataManager *additionalInfoData = [SLTAdditionalInfoDataManager new];
    return [additionalInfoData additionalInfo];
}
    
@end
