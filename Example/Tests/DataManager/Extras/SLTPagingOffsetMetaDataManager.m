//
//  SLTPagingOffsetMetaDataManager.m
//  SoulSDK
//
//  Created by Mikhail on 30.03.16.
//  Copyright © 2016 Mikhail Shershnev. All rights reserved.
//

#import "SLTPagingOffsetMetaDataManager.h"

NSString *_Nonnull const kTOffsetKey = @"offset";
NSString *_Nonnull const kTLimitKey = @"limit";
NSString *_Nonnull const kTTotalKey = @"total";

@implementation SLTPagingOffsetMetaDataManager

- (nonnull NSDictionary *)meta {
    return @{
             kTOffsetKey: [self offsetString],
             kTLimitKey: [self limitString],
             kTTotalKey: [self totalString],
             };
}

- (NSInteger)offsetInteger {
    return 123456;
}
- (NSInteger)limitInteger {
    return 654321;
}
- (NSInteger)totalInteger {
    return 321456;
}

- (nonnull NSString *)offsetString {
    return @"123456";
}
- (nonnull NSString *)limitString {
    return @"654321";
}
- (nonnull NSString *)totalString {
    return @"321456";
}

@end
