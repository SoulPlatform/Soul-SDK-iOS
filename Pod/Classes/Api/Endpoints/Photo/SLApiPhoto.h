//
//  SLApiPhoto.h
//  Pods
//
//  Created by Mikhail on 05.04.16.
//
//

#import "SLApiBase.h"
#import "SLPhotoResponse.h"

@interface SLApiPhoto :SLApiBase

typedef void (^SLApiPhotoSuccess)(SLPhotoResponse *_Nonnull responce);
typedef void (^SLApiPhotoRemoveSuccess)(void);

// GET: /me/albums/{albumName}/{photoId}
- (void)loadById:(nonnull NSString *)photoId
       fromAlbum:(nonnull NSString *)albumName
         success:(nullable SLApiPhotoSuccess)success
         failure:(nullable SLApiRequestFailure)failure;

// PATCH: /me/albums/{albumName}/{photoId}
- (void)updateById:(nonnull NSString *)photoId
         fromAlbum:(nonnull NSString *)albumName
    setExpiresTime:(nonnull NSNumber *)expiresTime
           success:(nullable SLApiPhotoSuccess)success
           failure:(nullable SLApiRequestFailure)failure;

// DELETE: /me/albums/{albumName}/{photoId}
- (void)removeById:(nonnull NSString *)photoId
         fromAlbum:(nonnull NSString *)albumName
           success:(nullable SLApiPhotoRemoveSuccess)success
           failure:(nullable SLApiRequestFailure)failure;

@end
