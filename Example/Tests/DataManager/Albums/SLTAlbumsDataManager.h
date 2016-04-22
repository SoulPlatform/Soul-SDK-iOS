//
//  SLTAlbumsDataManager.h
//  SoulSDK
//
//  Created by Mikhail on 30.03.16.
//  Copyright © 2016 Mikhail Shershnev. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *_Nonnull const kTNameKey;
extern NSString *_Nonnull const kTPrivacyKey;
extern NSString *_Nonnull const kTPhotoCountKey;
extern NSString *_Nonnull const kTParametersKey;
extern NSString *_Nonnull const kTMainPhotoKey;
extern NSString *_Nonnull const kTPhotosKey;

@interface SLTAlbumsDataManager :NSObject

- (nonnull NSArray *)miniAlbums;
- (nonnull NSDictionary *)miniAlbum;

- (nonnull NSArray *)completeAlbums;
- (nonnull NSDictionary *)completeAlbum;

- (nonnull NSString *)name;

- (nonnull NSString *)privacyPrivate;
- (nonnull NSString *)privacyPublic;
- (nonnull NSString *)privacyUnknown;

- (CGFloat)photoCountFloat;
- (NSInteger)photoCountInteger;
- (nonnull NSString *)photoCountString;

- (nonnull NSArray *)photos;
- (nonnull NSDictionary *)mainPhoto;
- (nonnull NSDictionary *)parameters;
@end
