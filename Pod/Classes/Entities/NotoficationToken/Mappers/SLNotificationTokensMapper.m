//
//  SLNotificationTokensMapper.m
//  Pods
//
//  Created by Mikhail on 25.02.16.
//
//

#import "SLNotificationTokensMapper.h"

// gcmToken
static NSString *const kGCMTokenKey = @"GCM";
static NSString *const kGCMTokenProperty = @"gcmToken";

// apnsToken
static NSString *const kAPNSTokenKey = @"APNS";
static NSString *const kAPNSTokenProperty = @"apnsToken";

@implementation SLNotificationTokensMapper

+ (EKObjectMapping *)objectMapping {

    EKObjectMapping *mapper = [[EKObjectMapping alloc] initWithObjectClass:[SLNotificationTokens class]];

    EKMappingValueBlock stringBlock = [self stringValueBlock];

    [mapper mapKeyPath:kGCMTokenKey toProperty:kGCMTokenProperty withValueBlock:stringBlock];
    [mapper mapKeyPath:kAPNSTokenKey toProperty:kAPNSTokenProperty withValueBlock:stringBlock];

    return mapper;
}

- (SLNotificationTokens *)mapNotificationTokens:(id)dict {
    return [self map:dict];
}

@end
