//
//  SLUserMapper.m
//  Pods
//
//  Created by Mikhail on 08.03.16.
//
//

#import "SLUserMapper.h"

#import "SLMeUserMapper.h"
#import "SLOtherUserMapper.h"

#import "SLUserParametersMapper.h"
#import "SLMiniAlbumMapper.h"

static NSString *const kUserIdKey = @"id";
static NSString *const kUserIdProp = @"userId";

static NSString *const kParamKey = @"parameters";
static NSString *const kParamProp = @"parameters";

static NSString *const kAlbumsKey = @"albums";
static NSString *const kAlbumsProp = @"albums";

@implementation SLUserMapper

+ (EKObjectMapping *)userMapperAtClass:(Class)klass {

    EKObjectMapping *mapper = [[EKObjectMapping alloc] initWithObjectClass:klass];

    EKMappingValueBlock stringBlock = [self stringValueBlock];
    [mapper mapKeyPath:kUserIdKey toProperty:kUserIdProp withValueBlock:stringBlock];

    Class paramClass = [SLUserParametersMapper class];
    [mapper hasOne:paramClass forKeyPath:kParamKey forProperty:kParamProp];

    Class albumClass = [SLMiniAlbumMapper class];
    [mapper hasMany:albumClass forKeyPath:kAlbumsKey forProperty:kAlbumsProp];

    return mapper;
}

#pragma mark SLUserMapperProtocol

- (SLMeUser *)mapMeUser:(id)dict {

    EKObjectMapping *mapper = [SLMeUserMapper objectMapping];
    SLMeUser *meUser = [self map:dict mapperObject:mapper];

    return meUser;
}

- (SLUser *)mapOtherUser:(id)dict {

    EKObjectMapping *mapper = [SLOtherUserMapper objectMapping];
    SLUser *otherUser = [self map:dict mapperObject:mapper];

    return otherUser;
}

@end
