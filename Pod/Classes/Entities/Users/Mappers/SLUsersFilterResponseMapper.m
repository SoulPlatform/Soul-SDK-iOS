//
//  SLUsersFilterResponseMapper.m
//  Pods
//
//  Created by Mikhail on 05.04.16.
//
//

#import "SLUsersFilterResponseMapper.h"

#import "SLOtherUserMapper.h"
#import "SLPagingAfterMetaMapper.h"
#import "SLAdditionalInfoMapper.h"

static NSString *const kMetaKey = @"_meta";
static NSString *const kMetaProp = @"meta";

static NSString *const kUsersKey = @"users";
static NSString *const kUsersProp = @"users";

static NSString *const kInfoKey = @"additionalInfo";
static NSString *const kInfoProp = @"additionalInfo";

@implementation SLUsersFilterResponseMapper

+ (EKObjectMapping *)objectMapping {

    EKObjectMapping *mapper = [[EKObjectMapping alloc] initWithObjectClass:[SLUsersFilterResponse class]];

    Class otherUserClass = [SLOtherUserMapper class];
    [mapper hasMany:otherUserClass forKeyPath:kUsersKey forProperty:kUsersProp];

    Class metaClass = [SLPagingAfterMetaMapper class];
    [mapper hasOne:metaClass forKeyPath:kMetaKey forProperty:kMetaProp];

    Class infoClass = [SLAdditionalInfoMapper class];
    [mapper hasOne:infoClass forKeyPath:kInfoKey forProperty:kInfoProp];

    return mapper;
}

- (SLUsersFilterResponse *)mapUsersFilterResponse:(id)dict {
    SLUsersFilterResponse *usersFilterResponse = [self map:dict];
    return usersFilterResponse;
}

@end
