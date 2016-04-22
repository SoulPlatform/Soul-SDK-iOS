//
//  SLApiPhoto.m
//  Pods
//
//  Created by Mikhail on 05.04.16.
//
//

#import "SLApiPhoto.h"
#import "SLApiAlbum.h"
#import "SLPhotoResponseMapper.h"

@implementation SLApiPhoto

- (nonnull NSString *)endpointAtId:(nonnull NSString *)photoId
                         fromAlbum:(nonnull NSString *)albumName {

    return [NSString stringWithFormat:@"%@/%@/%@", kAlbumsEndpoint, albumName, photoId];
}

// GET: /me/albums/{albumName}/{photoId}
- (void)loadById:(nonnull NSString *)photoId
       fromAlbum:(nonnull NSString *)albumName
         success:(nullable SLApiPhotoSuccess)success
         failure:(nullable SLApiRequestFailure)failure {

    NSString *endpoint = [self endpointAtId:photoId fromAlbum:albumName];

    [self GET:endpoint params:nil success:^(SLResponse *_Nonnull response) {

        if (success) {

            NSObject <SLPhotoResponseMapperProtocol> *photoResponseMapper = [SLPhotoResponseMapper new];
            SLPhotoResponse *photoResponse = [photoResponseMapper mapPhotoResponse:response.dict];

            success(photoResponse);
        }

    } failure:failure];
}

// PATCH: /me/albums/{albumName}/{photoId}
- (void)updateById:(nonnull NSString *)photoId
         fromAlbum:(nonnull NSString *)albumName
    setExpiresTime:(nonnull NSNumber *)expiresTime
           success:(nullable SLApiPhotoSuccess)success
           failure:(nullable SLApiRequestFailure)failure {

    NSString *endpoint = [self endpointAtId:photoId fromAlbum:albumName];

    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params forKey:@"expiresTime" setValue:expiresTime];

    [self PATCH:endpoint params:params success:^(SLResponse *_Nonnull response) {

        if (success) {

            NSObject <SLPhotoResponseMapperProtocol> *photoResponseMapper = [SLPhotoResponseMapper new];
            SLPhotoResponse *photoResponse = [photoResponseMapper mapPhotoResponse:response.dict];

            success(photoResponse);
        }

    } failure:failure];
}

// DELETE: /me/albums/{albumName}/{photoId}
- (void)removeById:(nonnull NSString *)photoId
         fromAlbum:(nonnull NSString *)albumName
           success:(nullable SLApiPhotoRemoveSuccess)success
           failure:(nullable SLApiRequestFailure)failure {

    NSString *endpoint = [self endpointAtId:photoId fromAlbum:albumName];

    [self DELETE:endpoint
          params:nil
         success:^(SLResponse *_Nonnull response) {
             if (success) {
                 success();
             }
         }
         failure:failure];
}

@end
