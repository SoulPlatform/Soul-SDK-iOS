//
//  SLTAlbumsDataManager.m
//  SoulSDK
//
//  Created by Mikhail on 30.03.16.
//  Copyright © 2016 Mikhail Shershnev. All rights reserved.
//

#import "SLTAlbumsDataManager.h"
#import "SLTPhotoDataManager.h"

NSString *_Nonnull const kTNameKey = @"name";
NSString *_Nonnull const kTPrivacyKey = @"privacy";
NSString *_Nonnull const kTPhotoCountKey = @"photoCount";
NSString *_Nonnull const kTParametersKey = @"parameters";
NSString *_Nonnull const kTMainPhotoKey = @"mainPhoto";
NSString *_Nonnull const kTPhotosKey = @"photos";

@implementation SLTAlbumsDataManager

- (nonnull NSArray *)miniAlbums {
    NSDictionary *album = [self miniAlbum];

    return @[album, album, album];
}

- (nonnull NSDictionary *)miniAlbum {

    return @{
             kTNameKey: [self name],
             kTPrivacyKey: [self privacyPublic],
             kTPhotoCountKey: [self photoCountString],
             kTParametersKey: [self parameters],
             kTMainPhotoKey: [self mainPhoto],
             };
}

- (nonnull NSArray *)completeAlbums {
    NSDictionary *album = [self completeAlbum];

    return @[album, album, album];
}

- (nonnull NSDictionary *)completeAlbum {

    return @{
             kTNameKey: [self name],
             kTPrivacyKey: [self privacyPublic],
             kTPhotoCountKey: [self photoCountString],
             kTParametersKey: [self parameters],
             kTMainPhotoKey: [self mainPhoto],

             kTPhotosKey: [self photos],
             };
}

- (nonnull NSString *)name {
    return @"Best album ever";
}

- (nonnull NSString *)privacyPrivate {
    return @"link";
}
- (nonnull NSString *)privacyPublic {
    return @"public";
}
- (nonnull NSString *)privacyUnknown {
    return @"share";
}

- (CGFloat)photoCountFloat {
    return 14.7;
}
- (NSInteger)photoCountInteger {
    return 14;
}
- (nonnull NSString *)photoCountString {
    return @"14.7f";
}

- (nonnull NSArray *)photos {
    NSDictionary *photo = [self mainPhoto];

    return @[photo, photo, photo];
}

- (nonnull NSDictionary *)photo {
    SLTPhotoDataManager *photoData = [SLTPhotoDataManager new];
    return [photoData photo];
}

- (nonnull NSDictionary *)mainPhoto {

    return [self photo];
}

- (nonnull NSDictionary *)parameters {

    return @{
             @"paramKey1": @"paramVal1",
             @"paramKey2": @(123456789),
             };
}

@end
