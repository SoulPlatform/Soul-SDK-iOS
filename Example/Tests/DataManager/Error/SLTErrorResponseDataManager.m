//
//  SLTErrorResponseDataManager.m
//  SoulSDK
//
//  Created by Mikhail on 29.03.16.
//  Copyright © 2016 Mikhail Shershnev. All rights reserved.
//

#import "SLTErrorResponseDataManager.h"

#import "SLTErrorDataManager.h"
#import "SLTAdditionalInfoDataManager.h"

NSString *_Nonnull const kErrorKey = @"error";
NSString *_Nonnull const kAdditionalKey = @"additionalInfo";

@implementation SLTErrorResponseDataManager

- (nonnull NSDictionary *)errorResponse {
    return @{
             kErrorKey: [self error],
             kAdditionalKey: [self additionalInfo],
             };
}

- (nonnull NSDictionary *)error {
    SLTErrorDataManager *errorData = [SLTErrorDataManager new];
    return [errorData error];
}

- (nonnull NSDictionary *)additionalInfo {
    SLTAdditionalInfoDataManager *additionalInfoData = [SLTAdditionalInfoDataManager new];
    return [additionalInfoData additionalInfo];
}

@end
