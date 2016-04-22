//
//  SLChatsObjectCountMapper.m
//  Pods
//
//  Created by Mikhail on 26.02.16.
//
//

#import "SLChatsObjectCountMapper.h"

// notDeletedByMe
static NSString *const kNotDeletedByMeKey = @"notDeletedByMe";
static NSString *const kNotDeletedByMeProperty = @"notDeletedByMe";

// notDeletedByAnyone
static NSString *const kNotDeletedByAnyoneKey = @"notDeletedByAnyone";
static NSString *const kNotDeletedByAnyoneProperty = @"notDeletedByAnyone";

// notExpiredAndNotDeletedByAnyone
static NSString *const kNotExpiredAndNotDeletedByAnyoneKey = @"notExpiredAndNotDeletedByAnyone";
static NSString *const kNotExpiredAndNotDeletedByAnyoneProperty = @"notExpiredAndNotDeletedByAnyone";

@implementation SLChatsObjectCountMapper

+ (EKObjectMapping *)objectMapping {

    EKObjectMapping *mapper = [[EKObjectMapping alloc] initWithObjectClass:[SLChatsObjectCount class]];

    EKMappingValueBlock integerBlock = [self integerValueBlock];

    [mapper mapKeyPath:kNotDeletedByMeKey
            toProperty:kNotDeletedByMeProperty
        withValueBlock:integerBlock];

    [mapper mapKeyPath:kNotDeletedByAnyoneKey
            toProperty:kNotDeletedByAnyoneProperty
        withValueBlock:integerBlock];

    [mapper mapKeyPath:kNotExpiredAndNotDeletedByAnyoneKey
            toProperty:kNotExpiredAndNotDeletedByAnyoneProperty
        withValueBlock:integerBlock];

    return mapper;
}

- (SLChatsObjectCount *)mapChatsObjectCount:(id)dict {
    return [self map:dict];
}

@end