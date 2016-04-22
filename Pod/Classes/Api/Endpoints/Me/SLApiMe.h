//
//  SLApiMe.h
//  Pods
//
//  Created by Mikhail on 29.03.16.
//
//

#import "SLApiBase.h"
#import "SLAlbumResponse.h"
#import "SLMeUserResponse.h"
#import "SLAvailableSubscriptions.h"
#import "SLMiniAlbumsResponse.h"

@interface SLApiMe :SLApiBase

typedef void (^SLApiMeSuccess)(SLMeUserResponse *_Nonnull responce);

typedef void (^SLApiMeProductsSuccess)(SLAvailableSubscriptions *_Nonnull responce);
typedef void (^SLApiMeLoadAlbumsSuccess)(SLMiniAlbumsResponse *_Nonnull responce);
typedef void (^SLApiMeAddAlbumsSuccess)(SLAlbumResponse *_Nonnull response);

// GET: /me
- (void)loadWithSuccess:(nullable SLApiMeSuccess)success failure:(nullable SLApiRequestFailure)failure;

// PATCH: /me
- (void)setTokens:(nullable SLNotificationTokens *)tokens
          success:(nullable SLApiMeSuccess)success
          failure:(nullable SLApiRequestFailure)failure;

// PATCH: /me
- (void)setFilterableParameters:(nullable NSDictionary *)filterable
                        success:(nullable SLApiMeSuccess)success
                        failure:(nullable SLApiRequestFailure)failure;

// PATCH: /me
- (void)setIndividualParameters:(nullable NSDictionary *)individual
                        success:(nullable SLApiMeSuccess)success
                        failure:(nullable SLApiRequestFailure)failure;

// PATCH: /me
- (void)setPublicVisibleParameters:(nullable NSDictionary *)publicVisible
                           success:(nullable SLApiMeSuccess)success
                           failure:(nullable SLApiRequestFailure)failure;

// PATCH: /me
- (void)setPublicWritableParameters:(nullable NSDictionary *)publicWritable
                            success:(nullable SLApiMeSuccess)success
                            failure:(nullable SLApiRequestFailure)failure;

// GET: /me/products/subscriptions/available
- (void)loadProductsWithSuccess:(nullable SLApiMeProductsSuccess)success
                        failure:(nullable SLApiRequestFailure)failure;

// GET: /me/albums
- (void)loadAlbumsWithOffset:(nonnull NSNumber *)offset
                       limit:(nonnull NSNumber *)limit
                     success:(nullable SLApiMeLoadAlbumsSuccess)success
                     failure:(nullable SLApiRequestFailure)failure;

// POST: /me/albums
- (void)addAlbumWithName:(nonnull NSString *)albumName
                 privacy:(SLAlbumPrivacy)privacy
              parameters:(nullable NSDictionary *)parameters
                 success:(nullable SLApiMeAddAlbumsSuccess)success
                 failure:(nullable SLApiRequestFailure)failure;

- (void)addAlbum:(nonnull NSString *)albumName
         success:(nullable SLApiMeAddAlbumsSuccess)success
         failure:(nullable SLApiRequestFailure)failure;

// POST: /purchases/appstore
- (void)addReceipt:(nonnull NSString *)receipt
         signature:(nonnull NSString *)signature
           success:(nullable SLApiMeSuccess)success
           failure:(nullable SLApiRequestFailure)failure;

@end
