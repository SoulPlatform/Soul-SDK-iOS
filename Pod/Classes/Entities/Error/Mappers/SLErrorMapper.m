//
//  SLErrorMapper.m
//  Pods
//
//  Created by Mikhail on 12.02.16.
//
//

#import "SLErrorMapper.h"

static NSString *const kCodeKey = @"code";
static NSString *const kCodeProperty = @"code";

static NSString *const kAliasKey = @"alias";
static NSString *const kAliasProperty = @"alias";

static NSString *const kUserMessageKey = @"userMessage";
static NSString *const kUserMessageProperty = @"userMessage";

static NSString *const kDeveloperMessageKey = @"developerMessage";
static NSString *const kDeveloperMessageProperty = @"developerMessage";

@implementation SLErrorMapper

+ (EKObjectMapping *)objectMapping {

    EKObjectMapping *mapper = [[EKObjectMapping alloc] initWithObjectClass:[SLError class]];

    EKMappingValueBlock integerBlock = [self integerValueBlock];
    EKMappingValueBlock stringBlock = [self stringValueBlock];

    [mapper mapKeyPath:kCodeKey toProperty:kCodeProperty withValueBlock:integerBlock];
    [mapper mapKeyPath:kAliasKey toProperty:kAliasProperty withValueBlock:stringBlock];
    [mapper mapKeyPath:kUserMessageKey toProperty:kUserMessageProperty withValueBlock:stringBlock];
    [mapper mapKeyPath:kDeveloperMessageKey toProperty:kDeveloperMessageProperty withValueBlock:stringBlock];

    return mapper;
}

- (SLError *)mapError:(id)dict {
    return [self map:dict];
}

@end
