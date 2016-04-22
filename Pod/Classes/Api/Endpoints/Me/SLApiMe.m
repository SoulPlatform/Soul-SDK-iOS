//
//  SLApiMe.m
//  Pods
//
//  Created by Mikhail on 29.03.16.
//
//

#import "SLApiMe.h"
#import "SLMeUserResponseMapper.h"
#import "SLFilterableParametersMapper.h"
#import "SLAvailableSubscriptionsMapper.h"
#import "SLAlbumResponseMapper.h"
#import "SLMiniAlbumsResponseMapper.h"

#import "SLNotificationTokensMapper.h"
#import "SLAlbumMapper.h"

static NSString *const kMeEndpoint = @"/me";
static NSString *const kAlbumsEndpoint = @"/me/albums";
static NSString *const kProductsEndpoint = @"/me/products/subscriptions/available";

static NSString *const kPurchasesEndpoint = @"/purchases/appstore";

@implementation SLApiMe

// GET: /me
- (void)loadWithSuccess:(nullable SLApiMeSuccess)success
                failure:(nullable SLApiRequestFailure)failure {

    NSString *uri = [self uriFrom:kMeEndpoint];

    [self GET:uri params:nil success:^(SLResponse *_Nonnull response) {

        if (success) {

            NSObject <SLMeUserResponseMapperProtocol> *meUserResponseMapper = [SLMeUserResponseMapper new];
            SLMeUserResponse *meUserResponse = [meUserResponseMapper mapMeUserResponse:response.dict];

            success(meUserResponse);
        }

    } failure:failure];
}

// PATCH: /me
- (void)setFilterableParameters:(nullable NSDictionary *)filterable
                        success:(nullable SLApiMeSuccess)success
                        failure:(nullable SLApiRequestFailure)failure {

    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params forKey:@"filterable" setValue:filterable];

    [self _setParameters:params success:success failure:failure];
}

- (void)setIndividualParameters:(nullable NSDictionary *)individual
                        success:(nullable SLApiMeSuccess)success
                        failure:(nullable SLApiRequestFailure)failure {

    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params forKey:@"private" setValue:individual];

    [self _setParameters:params success:success failure:failure];
}

- (void)setPublicVisibleParameters:(nullable NSDictionary *)publicVisible
                        success:(nullable SLApiMeSuccess)success
                        failure:(nullable SLApiRequestFailure)failure {

    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params forKey:@"publicVisible" setValue:publicVisible];

    [self _setParameters:params success:success failure:failure];
}

- (void)setPublicWritableParameters:(nullable NSDictionary *)publicWritable
                        success:(nullable SLApiMeSuccess)success
                        failure:(nullable SLApiRequestFailure)failure {

    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params forKey:@"publicWritable" setValue:publicWritable];

    [self _setParameters:params success:success failure:failure];
}

- (void)_setParameters:(nullable NSDictionary *)ps
               success:(nullable SLApiMeSuccess)success
               failure:(nullable SLApiRequestFailure)failure {

    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params forKey:@"parameters" setValue:ps];

    [self updateMyself:params success:success failure:failure];
}

// update push token
- (void)setTokens:(nullable SLNotificationTokens *)tokens
          success:(nullable SLApiMeSuccess)success
          failure:(nullable SLApiRequestFailure)failure {
    
    EKObjectMapping *tokensMapper = [SLNotificationTokensMapper objectMapping];
    NSDictionary *tokensDict = [EKSerializer serializeObject:tokens withMapping:tokensMapper];
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params forKey:@"notificationTokens" setValue:tokensDict];
    
    [self updateMyself:params success:success failure:failure];
}

// update current user information
- (void)updateMyself:(nullable NSDictionary *)params
             success:(nullable SLApiMeSuccess)success
             failure:(nullable SLApiRequestFailure)failure {

    NSString *uri = [self uriFrom:kMeEndpoint];

    [self PATCH:uri params:params success:^(SLResponse *_Nonnull response) {

        if (success) {

            NSObject <SLMeUserResponseMapperProtocol> *meUserResponseMapper = [SLMeUserResponseMapper new];
            SLMeUserResponse *meUserResponse = [meUserResponseMapper mapMeUserResponse:response.dict];

            success(meUserResponse);
        }

    } failure:failure];
}

// GET: /me/products/subscriptions/available
- (void)loadProductsWithSuccess:(nullable SLApiMeProductsSuccess)success
                        failure:(nullable SLApiRequestFailure)failure {

    NSString *uri = [self uriFrom:kProductsEndpoint];

    [self GET:uri params:nil success:^(SLResponse *_Nonnull response) {

        if (success) {

            NSObject <SLAvailableSubscriptionsMapperProtocol> *productsMapper = [SLAvailableSubscriptionsMapper new];
            SLAvailableSubscriptions *products = [productsMapper mapAvailableSubscriptions:response.dict];

            success(products);
        }

    } failure:failure];
}

// GET: /me/albums
- (void)loadAlbumsWithOffset:(nonnull NSNumber *)offset
                       limit:(nonnull NSNumber *)limit
                     success:(nullable SLApiMeLoadAlbumsSuccess)success
                     failure:(nullable SLApiRequestFailure)failure {

    NSMutableDictionary *query = [NSMutableDictionary dictionary];
    [query forKey:@"limit" setValue:limit];
    [query forKey:@"offset" setValue:offset];

    NSString *uri = [self uriFrom:kAlbumsEndpoint withQueryParams:query];

    [self GET:uri params:nil success:^(SLResponse *_Nonnull response) {

        if (success) {

            NSObject <SLMiniAlbumsResponseMapperProtocol> *miniAlbumsResponseMapper = [SLMiniAlbumsResponseMapper new];
            SLMiniAlbumsResponse *miniAlbumsResponse = [miniAlbumsResponseMapper mapMiniAlbumsResponse:response.dict];

            success(miniAlbumsResponse);
        }

    } failure:failure];
}

// POST: /me/albums
- (void)addAlbum:(nonnull NSString *)albumName
         success:(nullable SLApiMeAddAlbumsSuccess)success
         failure:(nullable SLApiRequestFailure)failure {

    [self addAlbumWithName:albumName
                   privacy:SLAlbumPrivacyPublic
                parameters:nil
                   success:success
                   failure:failure];
}

- (void)addAlbumWithName:(nonnull NSString *)albumName
                 privacy:(SLAlbumPrivacy)privacy
              parameters:(nullable NSDictionary *)parameters
                 success:(nullable SLApiMeAddAlbumsSuccess)success
                 failure:(nullable SLApiRequestFailure)failure {

    {
        NSMutableDictionary *albumParams = [NSMutableDictionary dictionaryWithDictionary:parameters];
        [albumParams forKey:@"name" setValue:albumName];
        parameters = [albumParams copy];
    }

    NSString *fixedAlbumName = [self fixAlbumName:albumName];

    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params forKey:@"name" setValue:fixedAlbumName];
    [params forKey:@"parameters" setValue:parameters];
    [params forKey:@"privacy" setValue:(privacy == SLAlbumPrivacyPrivate ? @"private" : @"public")];

    NSString *uri = [self uriFrom:kAlbumsEndpoint];

    [self POST:uri params:params success:^(SLResponse *_Nonnull response) {

        NSObject <SLAlbumResponseMapperProtocol> *albumResponseMapper = [SLAlbumResponseMapper new];
        SLAlbumResponse *albumResponse = [albumResponseMapper mapAlbumResponse:response.dict];

        if (success) {
            success(albumResponse);
        }

    } failure:failure];
}

- (NSString *)fixAlbumName:(NSString *)albumName {
    
    {
        NSRegularExpression *re = [NSRegularExpression regularExpressionWithPattern:@"[^a-z0-9-_\\s]" options:NSRegularExpressionCaseInsensitive error:nil];
        NSRange rande = NSMakeRange(0, [albumName length]);
        albumName = [re stringByReplacingMatchesInString:albumName options:0 range:rande withTemplate:@""];
    }

    {
        albumName = [albumName stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        //alphanumericCharacterSet
    }

    {
        NSRegularExpression *re = [NSRegularExpression regularExpressionWithPattern:@"[\\s+]" options:NSRegularExpressionCaseInsensitive error:nil];
        NSRange rande = NSMakeRange(0, [albumName length]);
        albumName = [re stringByReplacingMatchesInString:albumName options:0 range:rande withTemplate:@"_"];
    }

    return albumName;
}

// POST: /purchases/appstore
- (void)addReceipt:(nonnull NSString *)receipt
         signature:(nonnull NSString *)signature
           success:(nullable SLApiMeSuccess)success
           failure:(nullable SLApiRequestFailure)failure {

    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params forKey:@"receipt" setValue:receipt];
    [params forKey:@"signature" setValue:signature];

    NSString *uri = [self uriFrom:kPurchasesEndpoint];

    [self POST:uri params:params success:^(SLResponse *_Nonnull response) {

        if (success) {

            NSObject <SLMeUserResponseMapperProtocol> *meUserResponseMapper = [SLMeUserResponseMapper new];
            SLMeUserResponse *meUserResponse = [meUserResponseMapper mapMeUserResponse:response.dict];

            success(meUserResponse);
        }

    } failure:failure];
}

@end
