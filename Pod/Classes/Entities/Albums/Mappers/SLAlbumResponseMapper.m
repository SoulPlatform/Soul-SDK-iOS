//
//  SLAlbumResponseMapper.m
//  Pods
//
//  Created by Mikhail on 01.04.16.
//
//

#import "SLAlbumResponseMapper.h"

#import "SLCompleteAlbumMapper.h"
#import "SLAdditionalInfoMapper.h"

static NSString *const kAlbumKey = @"album";
static NSString *const kAlbumProp = @"album";

static NSString *const kInfoKey = @"additionalInfo";
static NSString *const kInfoProp = @"additionalInfo";

@implementation SLAlbumResponseMapper

+ (EKObjectMapping *)objectMapping {

    EKObjectMapping *mapper = [[EKObjectMapping alloc] initWithObjectClass:[SLAlbumResponse class]];

    Class miniAlbumClass = [SLCompleteAlbumMapper class];
    [mapper hasOne:miniAlbumClass forKeyPath:kAlbumKey forProperty:kAlbumProp];

    Class infoClass = [SLAdditionalInfoMapper class];
    [mapper hasOne:infoClass forKeyPath:kInfoKey forProperty:kInfoProp];

    return mapper;
}

- (SLAlbumResponse *)mapAlbumResponse:(id)dict {
    SLAlbumResponse *albumResponse = [self map:dict];
    return albumResponse;
}

@end