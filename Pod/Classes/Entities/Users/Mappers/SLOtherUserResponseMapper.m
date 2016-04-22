//
//  SLOtherUserResponseMapper.m
//  Pods
//
//  Created by Mikhail on 06.04.16.
//
//

#import "SLOtherUserResponseMapper.h"

#import "SLOtherUserMapper.h"
#import "SLAdditionalInfoMapper.h"

static NSString *const kUserKey = @"user";
static NSString *const kUserProp = @"user";

static NSString *const kInfoKey = @"additionalInfo";
static NSString *const kInfoProp = @"additionalInfo";

@implementation SLOtherUserResponseMapper

+ (EKObjectMapping *)objectMapping {

    EKObjectMapping *mapper = [[EKObjectMapping alloc] initWithObjectClass:[SLOtherUserResponse class]];

    Class userClass = [SLOtherUserMapper class];
    [mapper hasOne:userClass forKeyPath:kUserKey forProperty:kUserProp];

    Class infoClass = [SLAdditionalInfoMapper class];
    [mapper hasOne:infoClass forKeyPath:kInfoKey forProperty:kInfoProp];

    return mapper;
}

- (SLOtherUserResponse *)mapOtherUserResponse:(id)dict {

    SLOtherUserResponse *response = [self map:dict];
    return response;
}

@end
