//
//  SLApiUser.h
//  Pods
//
//  Created by Mikhail on 06.04.16.
//
//

#import "SLApiBase.h"
#import "SLOtherUserResponse.h"
#import "SLMiniAlbumsResponse.h"
#import "SLCompleteAlbumsResponse.h"

typedef void (^SLApiUserSuccess)(SLOtherUserResponse *_Nonnull responce);
typedef void (^SLApiUserMiniAlbumsSuccess)(SLMiniAlbumsResponse *_Nonnull responce);
typedef void (^SLApiUserCompleteAlbumsSuccess)(SLCompleteAlbumsResponse *_Nonnull responce);

@interface SLApiUser :SLApiBase

// GET: /users/{userId}
- (void)loadById:(nonnull NSString *)userId
         success:(nullable SLApiUserSuccess)success
         failure:(nullable SLApiRequestFailure)failure;

// PUT: /users/{userId}/flag
- (void)setFlagById:(nonnull NSString *)userId
            comment:(nullable NSString *)comment
            success:(nullable SLApiUserSuccess)success
            failure:(nullable SLApiRequestFailure)failure;

// DELETE: /users/{userId}/flag
- (void)removeFlagById:(nonnull NSString *)userId
               success:(nullable SLApiUserSuccess)success
               failure:(nullable SLApiRequestFailure)failure;

// GET: /users/{userId}/albums
- (void)loadAlbumsById:(nonnull NSString *)userId
                offset:(nonnull NSNumber *)offset
                 limit:(nonnull NSNumber *)limit
               success:(nullable SLApiUserMiniAlbumsSuccess)success
               failure:(nullable SLApiRequestFailure)failure;

// GET: /users/{userId}/albums/{albumName}
- (void)loadPhotosByAlbum:(nonnull NSString *)albumName
                   userId:(nonnull NSString *)userId
                   offset:(nonnull NSNumber *)offset
                    limit:(nonnull NSNumber *)limit
                  success:(nullable SLApiUserCompleteAlbumsSuccess)success
                  failure:(nullable SLApiRequestFailure)failure;

// POST: /users/{userId}/reactions/sent/{reactionType}
- (void)sendReaction:(nonnull NSString *)reactionType
               value:(nonnull NSString *)value
              userId:(nonnull NSString *)userId
         expiresTime:(nonnull NSNumber *)expiresTime
             success:(nullable SLApiUserSuccess)success
             failure:(nullable SLApiRequestFailure)failure;

// DELETE: /users/{userId}/reactions/sent/{reactionType}
- (void)removeReactionByType:(nonnull NSString *)reactionType
                      userId:(nonnull NSString *)userId
                     success:(nullable SLApiRequestSuccess)success
                     failure:(nullable SLApiRequestFailure)failure;

@end
