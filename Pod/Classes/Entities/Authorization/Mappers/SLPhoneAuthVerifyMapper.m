//
//  SLPhoneAuthVerifyMapper.m
//  Pods
//
//  Created by Mikhail on 28.03.16.
//
//

#import "SLPhoneAuthVerifyMapper.h"
#import "SLMeUserMapper.h"
#import "SLObjectCountMapper.h"
#import "SLAuthorizationMapper.h"
#import "SLAdditionalInfoMapper.h"

static NSString *const kMeKey = @"me";
static NSString *const kMeProp = @"me";

static NSString *const kProviderKey = @"providerId";
static NSString *const kProviderProp = @"provider";

static NSString *const kObjectCountKey = @"objectCount";
static NSString *const kObjectCountProp = @"objectCount";

static NSString *const kAuthorizationKey = @"authorization";
static NSString *const kAuthorizationProp = @"authorization";

static NSString *const kAdditionalInfoKey = @"additionalInfo";
static NSString *const kAdditionalInfoProp = @"additionalInfo";

@implementation SLPhoneAuthVerifyMapper

+ (EKObjectMapping *)objectMapping {

    EKObjectMapping *mapper = [[EKObjectMapping alloc] initWithObjectClass:[SLPhoneAuthVerify class]];

    Class meUserClass = [SLMeUserMapper class];
    [mapper hasOne:meUserClass forKeyPath:kMeKey forProperty:kMeProp];

    Class authorizationClass = [SLAuthorizationMapper class];
    [mapper hasOne:authorizationClass forKeyPath:kAuthorizationKey forProperty:kAuthorizationProp];

    Class objectCountClass = [SLObjectCountMapper class];
    [mapper hasOne:objectCountClass forKeyPath:kObjectCountKey forProperty:kObjectCountProp];

    Class additionalInfoClass = [SLAdditionalInfoMapper class];
    [mapper hasOne:additionalInfoClass forKeyPath:kAdditionalInfoKey forProperty:kAdditionalInfoProp];

    EKMappingValueBlock integerBlock = [self integerValueBlock];
    [mapper mapKeyPath:kProviderKey toProperty:kProviderProp withValueBlock:integerBlock];

    return mapper;
}

- (SLPhoneAuthVerify *)mapPhoneAuthVerify:(id)dict {
    SLPhoneAuthVerify *phoneAuthVerify = [self map:dict];
    return phoneAuthVerify;
}

@end
