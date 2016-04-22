//
//  SLCompleteAlbumsResponseMapper.m
//  Pods
//
//  Created by Mikhail on 07.04.16.
//
//

#import "SLCompleteAlbumsResponseMapper.h"

#import "SLCompleteAlbumMapper.h"
#import "SLAdditionalInfoMapper.h"
#import "SLPagingOffsetMetaMapper.h"

static NSString *const kAlbumsKey = @"albums";
static NSString *const kAlbumsProp = @"albums";

static NSString *const kMetaKey = @"_meta";
static NSString *const kMetaProp = @"meta";

static NSString *const kInfoKey = @"additionalInfo";
static NSString *const kInfoProp = @"additionalInfo";

@implementation SLCompleteAlbumsResponseMapper

+ (EKObjectMapping *)objectMapping {

    EKObjectMapping *mapper = [[EKObjectMapping alloc] initWithObjectClass:[SLCompleteAlbumsResponse class]];

    Class albumClass = [SLCompleteAlbumMapper class];
    [mapper hasMany:albumClass forKeyPath:kAlbumsKey forProperty:kAlbumsProp];

    Class metaClass = [SLPagingOffsetMetaMapper class];
    [mapper hasOne:metaClass forKeyPath:kMetaKey forProperty:kMetaProp];

    Class infoClass = [SLAdditionalInfoMapper class];
    [mapper hasOne:infoClass forKeyPath:kInfoKey forProperty:kInfoProp];

    return mapper;
}

- (SLCompleteAlbumsResponse *)mapCompleteAlbumsResponse:(id)dict {
    SLCompleteAlbumsResponse *completeAlbumsResponse = [self map:dict];
    return completeAlbumsResponse;
}

@end