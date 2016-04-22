//
//  SLApiUser.m
//  Pods
//
//  Created by Mikhail on 06.04.16.
//
//

#import "SLApiUser.h"
#import "SLOtherUserResponseMapper.h"
#import "SLMiniAlbumsResponseMapper.h"
#import "SLCompleteAlbumsResponseMapper.h"

static NSString *_Nonnull const kFlag = @"flag";
static NSString *_Nonnull const kAlbums = @"albums";
static NSString *_Nonnull const kUsersEndpoint = @"/users";

@implementation SLApiUser

// GET: /users/{userId}
- (void)loadById:(nonnull NSString *)userId
         success:(nullable SLApiUserSuccess)success
         failure:(nullable SLApiRequestFailure)failure {

    NSString *endpoint = [NSString stringWithFormat:@"%@/%@", kUsersEndpoint, userId];
    NSString *uri = [self uriFrom:endpoint];

    [self GET:uri params:nil success:^(SLResponse *_Nonnull response) {

        if (success) {

            NSObject <SLOtherUserResponseMapperProtocol> *mapper = [SLOtherUserResponseMapper new];
            SLOtherUserResponse *userResponse = [mapper mapOtherUserResponse:response.dict];

            success(userResponse);
        }

    } failure:failure];
}

// PUT: /users/{userId}/flag
- (void)setFlagById:(nonnull NSString *)userId
            comment:(nullable NSString *)comment
            success:(nullable SLApiUserSuccess)success
            failure:(nullable SLApiRequestFailure)failure {

    NSString *endpoint = [NSString stringWithFormat:@"%@/%@/%@", kUsersEndpoint, userId, kFlag];
    NSString *uri = [self uriFrom:endpoint];

    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params forKey:@"comment" setValue:comment];

    [self PUT:uri params:params success:^(SLResponse *_Nonnull response) {

        if (success) {

            NSObject <SLOtherUserResponseMapperProtocol> *mapper = [SLOtherUserResponseMapper new];
            SLOtherUserResponse *userResponse = [mapper mapOtherUserResponse:response.dict];

            success(userResponse);
        }

    } failure:failure];
}

// DELETE: /users/{userId}/flag
- (void)removeFlagById:(nonnull NSString *)userId
               success:(nullable SLApiUserSuccess)success
               failure:(nullable SLApiRequestFailure)failure {

    NSString *endpoint = [NSString stringWithFormat:@"%@/%@/%@", kUsersEndpoint, userId, kFlag];
    NSString *uri = [self uriFrom:endpoint];

    [self DELETE:uri params:nil success:^(SLResponse *_Nonnull response) {

        if (success) {

            NSObject <SLOtherUserResponseMapperProtocol> *mapper = [SLOtherUserResponseMapper new];
            SLOtherUserResponse *userResponse = [mapper mapOtherUserResponse:response.dict];

            success(userResponse);
        }

    } failure:failure];
}

// GET: /users/{userId}/albums
- (void)loadAlbumsById:(nonnull NSString *)userId
                offset:(nonnull NSNumber *)offset
                 limit:(nonnull NSNumber *)limit
               success:(nullable SLApiUserMiniAlbumsSuccess)success
               failure:(nullable SLApiRequestFailure)failure {

    NSMutableDictionary *query = [NSMutableDictionary dictionary];
    [query forKey:@"limit" setValue:limit];
    [query forKey:@"offset" setValue:offset];

    NSString *endpoint = [NSString stringWithFormat:@"%@/%@/%@", kUsersEndpoint, userId, kAlbums];
    NSString *uri = [self uriFrom:endpoint withQueryParams:query];

    [self GET:uri params:nil success:^(SLResponse *_Nonnull response) {

        if (success) {

            NSObject <SLMiniAlbumsResponseMapperProtocol> *mapper = [SLMiniAlbumsResponseMapper new];
            SLMiniAlbumsResponse *albumsResponse = [mapper mapMiniAlbumsResponse:response.dict];

            success(albumsResponse);
        }

    } failure:failure];
}

// GET: /users/{userId}/albums/{albumName}
- (void)loadPhotosByAlbum:(nonnull NSString *)albumName
                   userId:(nonnull NSString *)userId
                   offset:(nonnull NSNumber *)offset
                    limit:(nonnull NSNumber *)limit
                  success:(nullable SLApiUserCompleteAlbumsSuccess)success
                  failure:(nullable SLApiRequestFailure)failure {

    NSMutableDictionary *query = [NSMutableDictionary dictionary];
    [query forKey:@"limit" setValue:limit];
    [query forKey:@"offset" setValue:offset];

    NSString *endpoint = [NSString stringWithFormat:@"%@/%@/%@/%@", kUsersEndpoint, userId, kAlbums, albumName];
    NSString *uri = [self uriFrom:endpoint withQueryParams:query];

    [self GET:uri params:nil success:^(SLResponse *_Nonnull response) {

        if (success) {

            NSObject <SLCompleteAlbumsResponseMapperProtocol> *mapper = [SLCompleteAlbumsResponseMapper new];
            SLCompleteAlbumsResponse *albumsResponse = [mapper mapCompleteAlbumsResponse:response.dict];

            success(albumsResponse);
        }

    } failure:failure];
}

- (nonnull NSString *)endpointByReactionType:(nonnull NSString *)reactionType userId:(nonnull NSString *)userId {
    return [NSString stringWithFormat:@"%@/%@/reactions/sent/%@", kUsersEndpoint, userId, reactionType];
}

// POST: /users/{userId}/reactions/sent/{reactionType}
- (void)sendReaction:(nonnull NSString *)reactionType
               value:(nonnull NSString *)value
              userId:(nonnull NSString *)userId
         expiresTime:(nonnull NSNumber *)expiresTime
             success:(nullable SLApiUserSuccess)success
             failure:(nullable SLApiRequestFailure)failure {

    NSString *endpoint = [self endpointByReactionType:reactionType userId:userId];
    NSString *uri = [self uriFrom:endpoint];

    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params forKey:@"value" setValue:value];
    [params forKey:@"expiresTime" setValue:expiresTime];

    [self POST:uri params:params success:^(SLResponse *_Nonnull response) {

        if (success) {

            NSObject <SLOtherUserResponseMapperProtocol> *mapper = [SLOtherUserResponseMapper new];
            SLOtherUserResponse *userResponse = [mapper mapOtherUserResponse:response.dict];

            success(userResponse);
        }

    } failure:failure];
}

- (void)removeReactionByType:(nonnull NSString *)reactionType
                      userId:(nonnull NSString *)userId
                     success:(nullable SLApiRequestSuccess)success
                     failure:(nullable SLApiRequestFailure)failure {

    NSString *endpoint = [self endpointByReactionType:reactionType userId:userId];
    NSString *uri = [self uriFrom:endpoint];

    [self DELETE:uri params:nil success:success failure:failure];
}

@end
