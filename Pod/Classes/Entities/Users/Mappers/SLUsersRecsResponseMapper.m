//
//  SLUsersRecsResponseMapper.m
//  Pods
//
//  Created by Mikhail on 05.04.16.
//
//

#import "SLUsersRecsResponseMapper.h"

#import "SLOtherUserMapper.h"
#import "SLUserRecsMetaMapper.h"
#import "SLAdditionalInfoMapper.h"

static NSString *const kMetaKey = @"_meta";
static NSString *const kMetaProp = @"meta";

static NSString *const kUsersKey = @"users";
static NSString *const kUsersProp = @"users";

static NSString *const kInfoKey = @"additionalInfo";
static NSString *const kInfoProp = @"additionalInfo";

@implementation SLUsersRecsResponseMapper

+ (EKObjectMapping *)objectMapping {

    EKObjectMapping *mapper = [[EKObjectMapping alloc] initWithObjectClass:[SLUsersRecsResponse class]];

    Class otherUserClass = [SLOtherUserMapper class];
    [mapper hasMany:otherUserClass forKeyPath:kUsersKey forProperty:kUsersProp];

    Class metaClass = [SLUserRecsMetaMapper class];
    [mapper hasOne:metaClass forKeyPath:kMetaKey forProperty:kMetaProp];

    Class infoClass = [SLAdditionalInfoMapper class];
    [mapper hasOne:infoClass forKeyPath:kInfoKey forProperty:kInfoProp];

    return mapper;
}

- (SLUsersRecsResponse *)mapUsersRecsResponse:(id)dict {
    SLUsersRecsResponse *usersRecsResponse = [self map:dict];
    return usersRecsResponse;
}

@end