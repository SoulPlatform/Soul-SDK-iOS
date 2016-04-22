//
//  SLApiEvents.m
//  Pods
//
//  Created by Mikhail on 11.04.16.
//
//

#import "SLApiEvents.h"
#import "SLEventsResponseMapper.h"

static NSString *_Nonnull const kEventsEndpoint = @"/events";

@implementation SLApiEvents

// GET: /events
- (void)loadAfter:(nonnull NSNumber *)after
            limit:(nonnull NSNumber *)limit
          success:(nullable SLApiEventsSuccess)success
          failure:(nullable SLApiRequestFailure)failure {

    NSMutableDictionary *query = [NSMutableDictionary dictionary];
    [query forKey:@"after" setValue:after];
    [query forKey:@"limit" setValue:limit];

    [self _loadWithQuery:query success:success failure:failure];
}

// GET: /events
- (void)loadSince:(nonnull NSNumber *)since
            limit:(nonnull NSNumber *)limit
          success:(nullable SLApiEventsSuccess)success
          failure:(nullable SLApiRequestFailure)failure {

    NSMutableDictionary *query = [NSMutableDictionary dictionary];
    [query forKey:@"since" setValue:since];
    [query forKey:@"limit" setValue:limit];

    [self _loadWithQuery:query success:success failure:failure];
}

- (void)_loadWithQuery:(nonnull NSDictionary *)query
               success:(nullable SLApiEventsSuccess)success
               failure:(nullable SLApiRequestFailure)failure {

    NSString *uri = [self uriFrom:kEventsEndpoint withQueryParams:query];

    [self GET:uri params:nil success:^(SLResponse *_Nonnull response) {

        if (success) {

            NSObject <SLEventsResponseMapperProtocol> *mapper = [SLEventsResponseMapper new];
            SLEventsResponse *eventsResponse = [mapper mapEventsResponse:response.dict];

            success(eventsResponse);
        }
        
    } failure:failure];
}

@end
