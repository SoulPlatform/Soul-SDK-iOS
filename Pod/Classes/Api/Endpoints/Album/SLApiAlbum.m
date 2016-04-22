//
//  SLApiAlbum.m
//  Pods
//
//  Created by Mikhail on 01.04.16.
//
//

#import "SLApiAlbum.h"
#import "SLAlbumMapper.h"
#import "SLPhotoResponseMapper.h"
#import "SLAlbumResponseMapper.h"

@implementation SLApiAlbum

- (nonnull NSString *)endpointAtName:(nonnull NSString *)name {
    return [NSString stringWithFormat:@"%@/%@", kAlbumsEndpoint, name];
}

// GET:
- (void)loadByName:(nonnull NSString *)name
           success:(nullable SLApiAlbumLoadSuccess)success
           failure:(nullable SLApiRequestFailure)failure {

    NSString *endpoint = [self endpointAtName:name];
    NSString *uri = [self uriFrom:endpoint];

    [self GET:uri params:nil success:^(SLResponse *_Nonnull response) {

        if (success) {

            NSObject <SLAlbumResponseMapperProtocol> *albumResponseMapper = [SLAlbumResponseMapper new];
            SLAlbumResponse *albumResponse = [albumResponseMapper mapAlbumResponse:response.dict];

            success(albumResponse);
        }

    } failure:failure];
}

// PATCH:
- (void)updateByName:(nonnull NSString *)name
             privacy:(SLAlbumPrivacy)privacy
          parameters:(nullable NSDictionary *)parameters
             success:(nullable SLApiAlbumUpdateSuccess)success
             failure:(nullable SLApiRequestFailure)failure {

    NSString *endpoint = [self endpointAtName:name];
    NSString *uri = [self uriFrom:endpoint];

    SLAlbum *album = [SLAlbum new];
    album.name = name;
    album.privacy = privacy;
    album.parameters = parameters;

    EKObjectMapping *albumMapper = [SLAlbumMapper objectMapping];
    NSDictionary *albumDict = [EKSerializer serializeObject:album withMapping:albumMapper];

    [self PATCH:uri params:albumDict success:^(SLResponse *_Nonnull response) {
        if (success) {
            success();
        }
    } failure:failure];
}

// DELETE:
- (void)removeByName:(nonnull NSString *)name
             success:(nullable SLApiAlbumRemoveSuccess)success
             failure:(nullable SLApiRequestFailure)failure {

    NSString *endpoint = [self endpointAtName:name];
    NSString *uri = [self uriFrom:endpoint];

    [self DELETE:uri params:nil success:^(SLResponse *_Nonnull response) {
        if (success) {
            success();
        }
    } failure:failure];
}

// POST
- (void)addPhoto:(nonnull NSData *)imageData
         toAlbum:(nonnull NSString *)albumName
         success:(nullable SLApiAlbumInsertSuccess)success
         failure:(nullable SLApiRequestFailure)failure {

    NSString *endpoint = [self endpointAtName:albumName];
    NSString *uri = [self uriFrom:endpoint];

    [self uploadImage:imageData
             endpoint:uri
               params:nil
              success:^(SLResponse *_Nonnull response) {

                  if (success) {
                      NSObject <SLPhotoResponseMapperProtocol> *photoResponseMapper = [SLPhotoResponseMapper new];
                      SLPhotoResponse *photoResponse = [photoResponseMapper mapPhotoResponse:response.dict];
                      success(photoResponse);
                  }

              }
              failure:failure];
}

- (void)setMainPhotoById:(nonnull NSString *)photoId
                 toAlbum:(nonnull NSString *)albumName
                 success:(nullable SLApiRequestSuccess)success
                 failure:(nullable SLApiRequestFailure)failure {

    NSString *endpoint = [NSString stringWithFormat:@"%@/%@/%@", kAlbumsEndpoint, albumName, photoId];
    NSString *uri = [self uriFrom:endpoint];

    NSDictionary *params = @{
                             @"mainPhoto": @YES,
                             };

    [self PATCH:uri params:params success:^(SLResponse *_Nonnull response) {
        if (success) {
            success(response);
        }
    } failure:^(SLErrorResponse * _Nullable response) {
        if (failure) {
            failure(response);
        }
    }];
}
@end
