//
//  SLTErrorDataManager.m
//  SoulSDK
//
//  Created by Mikhail on 29.03.16.
//  Copyright © 2016 Mikhail Shershnev. All rights reserved.
//

#import "SLTErrorDataManager.h"

NSString *_Nonnull const kCodeKey = @"code";
NSString *_Nonnull const kAliaseKey = @"alias";
NSString *_Nonnull const kUserMessage = @"userMessage";
NSString *_Nonnull const kDeveloperMessage = @"developerMessage";

@implementation SLTErrorDataManager

- (nonnull NSDictionary *)error {
    return @{
             kCodeKey: [self codePositiveString],
             kAliaseKey: [self alias],
             kUserMessage: [self userMessage],
             kDeveloperMessage: [self developerMessage],
             };
}

- (NSInteger)codePositiveInteger {
    return 14;
}
- (NSInteger)codeNegativeInteger {
    NSInteger codePositive = [self codePositiveInteger];
    return -codePositive;
}

- (nonnull NSString *)codePositiveString {
    NSInteger codePositive = [self codePositiveInteger];
    return [NSString stringWithFormat:@"%d", codePositive];
}

- (nonnull NSString *)codeNegativeString {
    NSInteger codeNegative = [self codeNegativeInteger];
    return [NSString stringWithFormat:@"%d", codeNegative];
}

- (nonnull NSString *)alias {
    return @"invalid_user_agent";
}

- (nonnull NSString *)userMessage {
    return @"Configuration problem";
}
- (nonnull NSString *)developerMessage {
    return @"Make sure you use the right User Agent for your application";
}

@end
