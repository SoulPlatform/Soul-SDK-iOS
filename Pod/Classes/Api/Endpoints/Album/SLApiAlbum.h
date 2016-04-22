//
//  SLApiAlbum.h
//  Pods
//
//  Created by Mikhail on 01.04.16.
//
//

#import "SLApiBase.h"
#import "SLPhotoResponse.h"
#import "SLAlbumResponse.h"

static NSString *_Nonnull const kAlbumsEndpoint = @"/me/albums";

@interface SLApiAlbum :SLApiBase

typedef void (^SLApiAlbumLoadSuccess)(SLAlbumResponse *_Nonnull response);
typedef void (^SLApiAlbumUpdateSuccess)(void);
typedef void (^SLApiAlbumRemoveSuccess)(void);
typedef void (^SLApiAlbumInsertSuccess)(SLPhotoResponse *_Nonnull response);

// GET: /me/albums/{albumName}
- (void)loadByName:(nonnull NSString *)name
           success:(nullable SLApiAlbumLoadSuccess)success
           failure:(nullable SLApiRequestFailure)failure;

// PATCH: /me/albums/{albumName}
- (void)updateByName:(nonnull NSString *)name
             privacy:(SLAlbumPrivacy)privacy
          parameters:(nullable NSDictionary *)parameters
             success:(nullable SLApiAlbumUpdateSuccess)success
             failure:(nullable SLApiRequestFailure)failure;

// DELETE: /me/albums/{albumName}
- (void)removeByName:(nonnull NSString *)name
             success:(nullable SLApiAlbumRemoveSuccess)success
             failure:(nullable SLApiRequestFailure)failure;

// POST: /me/albums/{albumName}
- (void)addPhoto:(nonnull NSData *)imageData
         toAlbum:(nonnull NSString *)albumName
         success:(nullable SLApiAlbumInsertSuccess)success
         failure:(nullable SLApiRequestFailure)failure;

// PATCH /me/albums/{albumName}/{photoId}
- (void)setMainPhotoById:(nonnull NSString *)photoId
                 toAlbum:(nonnull NSString *)albumName
                 success:(nullable SLApiRequestSuccess)success
                 failure:(nullable SLApiRequestFailure)failure;

@end
