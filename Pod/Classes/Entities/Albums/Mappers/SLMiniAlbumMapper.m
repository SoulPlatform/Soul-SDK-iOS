//
//  SLMiniAlbumMapper.m
//  Pods
//
//  Created by Mikhail on 08.03.16.
//
//

#import "SLMiniAlbumMapper.h"
#import "SLAlbumMapper.h"

@implementation SLMiniAlbumMapper

+ (EKObjectMapping *)objectMapping {

    EKObjectMapping *mapper = [SLAlbumMapper albumMapperAtClass:[SLMiniAlbum class]];
    return mapper;
}

@end
