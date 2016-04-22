//
//  SLCompleteAlbumMapper.m
//  Pods
//
//  Created by Mikhail on 08.03.16.
//
//

#import "SLCompleteAlbumMapper.h"
#import "SLAlbumMapper.h"
#import "SLPhotoMapper.h"

static NSString *const kPhotosKey = @"photos";
static NSString *const kPhotosProp = @"photos";

@implementation SLCompleteAlbumMapper

+ (EKObjectMapping *)objectMapping {

    EKObjectMapping *mapper = [SLAlbumMapper albumMapperAtClass:[SLCompleteAlbum class]];

    Class photoClass = [SLPhotoMapper class];
    [mapper hasMany:photoClass forKeyPath:kPhotosKey forProperty:kPhotosProp];

    return mapper;
}

@end
