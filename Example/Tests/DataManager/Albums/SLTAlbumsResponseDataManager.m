//
//  SLTAlbumsResponseDataManager.m
//  SoulSDK
//
//  Created by Mikhail on 30.03.16.
//  Copyright © 2016 Mikhail Shershnev. All rights reserved.
//

#import "SLTAlbumsResponseDataManager.h"

#import "SLTAlbumsDataManager.h"
#import "SLTAdditionalInfoDataManager.h"
#import "SLTPagingOffsetMetaDataManager.h"

NSString *_Nonnull const kTMetaKey = @"_meta";
NSString *_Nonnull const kTAlbumsKey = @"albums";
NSString *_Nonnull const kTInfoKey = @"additionalInfo";

@implementation SLTAlbumsResponseDataManager

- (nonnull NSDictionary *)miniAlbumsResponse {

    return @{
             kTMetaKey: [self meta],
             kTInfoKey: [self info],
             kTAlbumsKey: [self miniAlbums],
             };
}

- (nonnull NSDictionary *)completeAlbumsResponse {

    return @{
             kTMetaKey: [self meta],
             kTInfoKey: [self info],
             kTAlbumsKey: [self completeAlbums],
             };
}

- (nonnull NSDictionary *)meta {
    SLTPagingOffsetMetaDataManager *metaData = [SLTPagingOffsetMetaDataManager new];
    return [metaData meta];
}

- (nonnull NSArray *)miniAlbums {
    SLTAlbumsDataManager *albumsData = [SLTAlbumsDataManager new];
    return [albumsData miniAlbums];
}

- (nonnull NSArray *)completeAlbums {
    SLTAlbumsDataManager *albumsData = [SLTAlbumsDataManager new];
    return [albumsData completeAlbums];
}

- (nonnull NSDictionary *)info {
    SLTAdditionalInfoDataManager *infoData = [SLTAdditionalInfoDataManager new];
    return [infoData additionalInfo];
}

@end
