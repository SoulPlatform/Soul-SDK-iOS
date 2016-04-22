//
//  SLTAlbumResponseDataManager.m
//  SoulSDK
//
//  Created by Mikhail on 01.04.16.
//  Copyright © 2016 Mikhail Shershnev. All rights reserved.
//

#import "SLTAlbumResponseDataManager.h"
#import "SLTAlbumsResponseDataManager.h"
#import "SLTAdditionalInfoDataManager.h"
#import "SLTAlbumsDataManager.h"

NSString *_Nonnull const kTAlbumKey = @"album";
NSString *_Nonnull const kTARInfoKey = @"additionalInfo";

@implementation SLTAlbumResponseDataManager

- (nonnull NSDictionary *)albumResponse {

    return @{
             kTARInfoKey: [self info],
             kTAlbumKey: [self album],
             };
}

- (nonnull NSDictionary *)album {
    SLTAlbumsDataManager *albumsData = [SLTAlbumsDataManager new];
    return [albumsData completeAlbum];
}

- (nonnull NSDictionary *)info {
    SLTAdditionalInfoDataManager *infoData = [SLTAdditionalInfoDataManager new];
    return [infoData additionalInfo];
}

@end
