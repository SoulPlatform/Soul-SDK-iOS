//
//  SLApiUsers.m
//  Pods
//
//  Created by Mikhail on 05.04.16.
//
//

#import "SLApiUsers.h"
#import "SLUsersRecsResponseMapper.h"
#import "SLUsersFilterResponseMapper.h"

static NSString *_Nonnull const kUsersEndpoint = @"/users";
static NSString *_Nonnull const kRecommendations = @"recommendations";

@implementation SLApiUsers

// GET: /users/recommendations
- (void)loadBySession:(nonnull NSString *)sessionName
          uniqueToken:(nonnull NSString *)uniqueToken
              success:(nullable SLApiUsersRecsSuccess)success
              failure:(nullable SLApiRequestFailure)failure {

    NSMutableDictionary *query = [NSMutableDictionary dictionary];
    [query forKey:@"sessionName" setValue:sessionName];
    [query forKey:@"uniqueToken" setValue:uniqueToken];

    NSString *endpoint = [NSString stringWithFormat:@"%@/%@", kUsersEndpoint, kRecommendations];
    NSString *uri = [self uriFrom:endpoint withQueryParams:query];

    [self GET:uri params:nil success:^(SLResponse *_Nonnull response) {

        if (success) {

            NSObject <SLUsersRecsResponseMapperProtocol> *mapper = [SLUsersRecsResponseMapper new];
            SLUsersRecsResponse *usersRecs = [mapper mapUsersRecsResponse:response.dict];

            success(usersRecs);
        }

    } failure:failure];
}

- (void)setFilter:(nullable SLFilter *)filter
          success:(nullable SLApiRequestSuccess)success
          failure:(nullable SLApiRequestFailure)failure {

    NSString *endpoint = [NSString stringWithFormat:@"%@/%@", kUsersEndpoint, kRecommendations];
    NSString *uri = [self uriFrom:endpoint];

    if (filter == nil) {
        filter = [SLFilter new];
    }
    NSDictionary *param = filter.parameters;

    [self PATCH:uri params:param success:^(SLResponse *_Nonnull response) {
        
        if (success) {
            success(response);
        }
        
    } failure:failure];
}

// GET: /users/{filterName}
/*
- (void)loadByFilter:(nonnull NSString *)filterName
               after:(nonnull NSNumber *)after
               limit:(nonnull NSNumber *)limit
             success:(nullable SLApiUsersFilterSuccess)success
             failure:(nullable SLApiRequestFailure)failure {

    NSMutableDictionary *query = [NSMutableDictionary dictionary];
    [query forKey:@"limit" setValue:limit];
    [query forKey:@"after" setValue:after];

    NSString *endpoint = [NSString stringWithFormat:@"%@/%@", kUsersEndpoint, filterName];
    NSString *uri = [self uriFrom:endpoint withQueryParams:query];

    [self GET:uri params:nil success:^(SLResponse *_Nonnull response) {

        if (success) {

            NSObject <SLUsersFilterResponseMapperProtocol> *mapper = [SLUsersFilterResponseMapper new];
            SLUsersFilterResponse *usersFilter = [mapper mapUsersFilterResponse:response.dict];

            success(usersFilter);
        }

    } failure:failure];
}
*/

@end
