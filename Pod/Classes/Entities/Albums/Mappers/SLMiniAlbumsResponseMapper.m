//
//  SLMiniAlbumsResponseMapper.m
//  Pods
//
//  Created by Mikhail on 30.03.16.
//
//

#import "SLMiniAlbumsResponseMapper.h"

#import "SLMiniAlbumMapper.h"
#import "SLAdditionalInfoMapper.h"
#import "SLPagingOffsetMetaMapper.h"

static NSString *const kAlbumsKey = @"albums";
static NSString *const kAlbumsProp = @"albums";

static NSString *const kMetaKey = @"_meta";
static NSString *const kMetaProp = @"meta";

static NSString *const kInfoKey = @"additionalInfo";
static NSString *const kInfoProp = @"additionalInfo";

@implementation SLMiniAlbumsResponseMapper

+ (EKObjectMapping *)objectMapping {

    EKObjectMapping *mapper = [[EKObjectMapping alloc] initWithObjectClass:[SLMiniAlbumsResponse class]];

    Class miniAlbumClass = [SLMiniAlbumMapper class];
    [mapper hasMany:miniAlbumClass forKeyPath:kAlbumsKey forProperty:kAlbumsProp];
    
    Class metaClass = [SLPagingOffsetMetaMapper class];
    [mapper hasOne:metaClass forKeyPath:kMetaKey forProperty:kMetaProp];

    Class infoClass = [SLAdditionalInfoMapper class];
    [mapper hasOne:infoClass forKeyPath:kInfoKey forProperty:kInfoProp];

    return mapper;
}

- (SLMiniAlbumsResponse *)mapMiniAlbumsResponse:(id)dict {
    SLMiniAlbumsResponse *miniAlbumsResponse = [self map:dict];
    return miniAlbumsResponse;
}

@end
