//
//  SLTReactionsDataManager.m
//  SoulSDK
//
//  Created by Mikhail on 11.04.16.
//  Copyright © 2016 Mikhail Shershnev. All rights reserved.
//

#import "SLTReactionsDataManager.h"

@implementation SLTReactionsDataManager

- (nonnull NSDictionary *)reactions {

    NSString *kSentByMeKey = @"sentByMe";
    NSString *kReceivedKey = @"receivedFromUser";

    return @{
             kSentByMeKey: [self sentByMe],
             kReceivedKey: [self received],
             };
}

- (nonnull NSDictionary *)sentByMe {

    return @{
             @"liking": @{
                     @"value": @"liked",
                     @"expiresTime": @(1447196497.291),
                     },
             @"blocking": [NSNull null],
             };
}

- (nonnull NSDictionary *)received {

    return @{
             @"liking": @{
                     @"value": @"disliked",
                     @"expiresTime": @(1447190239.492),
                     },
             @"blocking": @{
                     @"value": @"blocked",
                     @"expiresTime": @(1447190239.492),
                     }
             };
}

@end
