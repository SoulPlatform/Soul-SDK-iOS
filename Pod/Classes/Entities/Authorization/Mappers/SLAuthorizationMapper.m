//
//  SLAuthorizationMapper.m
//  Pods
//
//  Created by Mikhail on 12.02.16.
//
//

#import "SLAuthorizationMapper.h"

// expiresTime
static NSString *const kExpiresTimeKey = @"expiresTime";
static NSString *const kExpiresTimeProperty = @"expiresTime";

// sessionToken
static NSString *const kSessionTokenKey = @"sessionToken";
static NSString *const kSessionTokenProperty = @"sessionToken";

@implementation SLAuthorizationMapper

+ (EKObjectMapping *)objectMapping {

    EKObjectMapping *mapper = [[EKObjectMapping alloc] initWithObjectClass:[SLAuthorization class]];

    EKMappingValueBlock doubleBlock = [self doubleValueBlock];
    EKMappingValueBlock stringBlock = [self stringValueBlock];

    [mapper mapKeyPath:kExpiresTimeKey toProperty:kExpiresTimeProperty withValueBlock:doubleBlock];
    [mapper mapKeyPath:kSessionTokenKey toProperty:kSessionTokenProperty withValueBlock:stringBlock];

    return mapper;
}

- (SLAuthorization *)mapAuthorization:(id)dict {
    return [self map:dict];
}

@end
