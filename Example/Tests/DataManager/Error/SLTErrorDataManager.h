//
//  SLTErrorDataManager.h
//  SoulSDK
//
//  Created by Mikhail on 29.03.16.
//  Copyright © 2016 Mikhail Shershnev. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *_Nonnull const kCodeKey;
extern NSString *_Nonnull const kAliaseKey;
extern NSString *_Nonnull const kUserMessage;
extern NSString *_Nonnull const kDeveloperMessage;

@interface SLTErrorDataManager :NSObject

- (nonnull NSDictionary *)error;

- (NSInteger)codePositiveInteger;
- (NSInteger)codeNegativeInteger;

- (nonnull NSString *)codePositiveString;
- (nonnull NSString *)codeNegativeString;

- (nonnull NSString *)alias;
- (nonnull NSString *)userMessage;
- (nonnull NSString *)developerMessage;

@end