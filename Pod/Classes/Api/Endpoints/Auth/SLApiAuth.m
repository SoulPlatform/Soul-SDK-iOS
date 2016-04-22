//
//  SLApiAuth.m
//  Pods
//
//  Created by Mikhail on 18.03.16.
//
//

#import "SLApiAuth.h"

static NSString *const kFullKey = @"full";
static NSString *const kLogoutEndpoint = @"/auth/logout";

@implementation SLApiAuth

- (void)logoutFull:(BOOL)full
           success:(nullable SLApiAuthLogoutSuccess)success
           failure:(nullable SLApiRequestFailure)failure {

    NSMutableDictionary *query = [NSMutableDictionary dictionary];
    [query forKey:kFullKey setValue:@(full)];

    NSString *uri = [self uriFrom:kLogoutEndpoint withQueryParams:query];

    [self POST:uri params:nil success:^(SLResponse *_Nonnull response) {

        [self.storage cleanUp];

        if (success) {
            success();
        }

    } failure:failure];
}

@end
