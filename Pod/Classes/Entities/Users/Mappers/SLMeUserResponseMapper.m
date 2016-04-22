//
//  SLMeUserResponseMapper.m
//  Pods
//
//  Created by Mikhail on 09.03.16.
//
//

#import "SLMeUserResponseMapper.h"

#import "SLMeUserMapper.h"
#import "SLAdditionalInfoMapper.h"

static NSString *const kMeKey = @"me";
static NSString *const kMeProp = @"me";

static NSString *const kInfoKey = @"additionalInfo";
static NSString *const kInfoProp = @"additionalInfo";

@implementation SLMeUserResponseMapper

+ (EKObjectMapping *)objectMapping {

    EKObjectMapping *mapper = [[EKObjectMapping alloc] initWithObjectClass:[SLMeUserResponse class]];

    Class meUserClass = [SLMeUserMapper class];
    [mapper hasOne:meUserClass forKeyPath:kMeKey forProperty:kMeProp];

    Class infoClass = [SLAdditionalInfoMapper class];
    [mapper hasOne:infoClass forKeyPath:kInfoKey forProperty:kInfoProp];

    return mapper;
}

- (SLMeUserResponse *)mapMeUserResponse:(id)dict {

    SLMeUserResponse *response = [self map:dict];
    return response;
}

@end
