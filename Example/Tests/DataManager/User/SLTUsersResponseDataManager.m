//
//  SLTUsersResponseDataManager.m
//  SoulSDK
//
//  Created by Mikhail on 05.04.16.
//  Copyright © 2016 Mikhail Shershnev. All rights reserved.
//

#import "SLTUsersResponseDataManager.h"

#import "SLTUserDataManager.h"
#import "SLTAdditionalInfoDataManager.h"

#import "SLTUserRecsMetaDateManager.h"
#import "SLTPagingAfterMetaDataManager.h"

NSString *_Nonnull const kTUsersResponseMetaKey = @"_meta";
NSString *_Nonnull const kTUsersResponseUsersKey = @"users";
NSString *_Nonnull const kTUsersResponseInfoKey = @"additionalInfo";

@implementation SLTUsersResponseDataManager

- (nonnull NSDictionary *)usersRecsResponse {

    return @{
             kTUsersResponseMetaKey: [self recsMeta],
             kTUsersResponseUsersKey: [self users],
             kTUsersResponseInfoKey: [self additionalInfo],
             };
}

- (nonnull NSDictionary *)usersFilterResponse {
    return @{
             kTUsersResponseMetaKey: [self filterMeta],
             kTUsersResponseUsersKey: [self users],
             kTUsersResponseInfoKey: [self additionalInfo],
             };
}

- (nonnull NSArray *)users {
    NSDictionary *user = [self user];

    return @[user, user, user, user];
}

- (nonnull NSDictionary *)user {
    SLTUserDataManager *userData = [SLTUserDataManager new];
    return [userData user];
}

- (nonnull NSDictionary *)recsMeta {
    SLTUserRecsMetaDateManager *metaData = [SLTUserRecsMetaDateManager new];
    return [metaData meta];
}

- (nonnull NSDictionary *)filterMeta {
    SLTPagingAfterMetaDataManager *metaData = [SLTPagingAfterMetaDataManager new];
    return [metaData meta];
}

- (nonnull NSDictionary *)additionalInfo {
    SLTAdditionalInfoDataManager *additionalInfoData = [SLTAdditionalInfoDataManager new];
    return [additionalInfoData additionalInfo];
}

@end
