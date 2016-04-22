//
//  SLTPagingAfterMetaDataManager.m
//  SoulSDK
//
//  Created by Mikhail on 05.04.16.
//  Copyright © 2016 Mikhail Shershnev. All rights reserved.
//

#import "SLTPagingAfterMetaDataManager.h"

NSString *_Nonnull const kTPagingAfterMetaAfterKey = @"after";
NSString *_Nonnull const kTPagingAfterMetaLimitKey = @"limit";
NSString *_Nonnull const kTPagingAfterMetaTotalKey = @"total";

@implementation SLTPagingAfterMetaDataManager

- (nonnull NSDictionary *)meta {
    return @{
             kTPagingAfterMetaAfterKey: [self after],
             kTPagingAfterMetaLimitKey: [self limit],
             kTPagingAfterMetaTotalKey: [self total],
             };
}

- (nonnull NSNumber *)after {
    return @(4);
}
- (nonnull NSNumber *)limit {
    return @(12);
}

- (nonnull NSNumber *)total {
    return @(34);
}

@end
