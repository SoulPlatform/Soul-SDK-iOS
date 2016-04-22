//
//  SLApiUsersTestSpec.m
//  SoulSDK
//
//  Created by Mikhail on 05.04.16.
//  Copyright © 2016 Mikhail Shershnev. All rights reserved.
//

#import "SLTHttpClientMock.h"
#import "SLTUsersResponseDataManager.h"
#import "SLTErrorResponseDataManager.h"

SpecBegin(SLApiUsers)

describe(@"users endpoint", ^{

    NSObject<SLHttpClientProtocol> *httpClient;
    SLApiUsers *usersApi = [[SLApiUsers alloc] initWithHttpClient:httpClient storage:nil config:nil];

    SLTUsersResponseDataManager *usersData = [SLTUsersResponseDataManager new];
    NSDictionary *recsResponse = [usersData usersRecsResponse];
    NSDictionary *filterResponse = [usersData usersFilterResponse];

    SLTErrorResponseDataManager *errorResponseData = [SLTErrorResponseDataManager new];
    NSDictionary *errorResponse = [errorResponseData errorResponse];

    NSInteger statusCode200 = 200;
    NSInteger statusCode400 = 400;

    describe(@"get recs users", ^{

        NSString *sessionName = @"";
        NSString *uniqueToken = @"";

        it(@"loading success", ^{

            usersApi.httpClient = [SLTHttpClientMock executedSuccessfullyWithStatusCode:statusCode200 response:recsResponse];

            [usersApi loadBySession:sessionName
                        uniqueToken:uniqueToken
                            success:^(SLUsersRecsResponse * _Nonnull usersRecs) {
                                expect(usersRecs).notTo.beNil();
                                expect(usersRecs.users).notTo.beNil();
                                expect(usersRecs.meta).notTo.beNil();
                                expect(usersRecs.additionalInfo).notTo.beNil();
                            }
                            failure:nil];
        });

        it(@"loading failure", ^{

            usersApi.httpClient = [SLTHttpClientMock executedSuccessfullyWithStatusCode:statusCode400 response:nil];

            [usersApi loadBySession:sessionName
                        uniqueToken:uniqueToken
                            success:nil
                            failure:^(NSError * _Nullable error) {
                                expect(error).to.beNil();
                            }];
        });
    });
    
    describe(@"get filter users", ^{

        NSString *filterName = @"nearby";
        NSNumber *after = @(10);
        NSNumber *limit = @(20);

        it(@"loading success", ^{

            usersApi.httpClient = [SLTHttpClientMock executedSuccessfullyWithStatusCode:statusCode200 response:filterResponse];

            [usersApi loadByFilter:filterName
                             after:after
                             limit:limit
                           success:^(SLUsersFilterResponse * _Nonnull usersFilter) {
                               expect(usersFilter).notTo.beNil();
                               expect(usersFilter.users).notTo.beNil();
                               expect(usersFilter.meta).notTo.beNil();
                               expect(usersFilter.additionalInfo).notTo.beNil();
                           }
                           failure:nil];
        });

        it(@"loading failure #1", ^{

            usersApi.httpClient = [SLTHttpClientMock executedSuccessfullyWithStatusCode:statusCode400 response:errorResponse];

            [usersApi loadByFilter:filterName
                             after:after
                             limit:limit
                           success:nil
                           failure:^(NSError * _Nullable error) {
                               expect(error).to.beNil();
                           }];
        });

        it(@"loading failure #2", ^{

            usersApi.httpClient = [SLTHttpClientMock executedSuccessfullyWithStatusCode:statusCode400 response:nil];

            [usersApi loadByFilter:filterName
                             after:after
                             limit:limit
                           success:nil
                           failure:^(NSError * _Nullable error) {
                               expect(error).to.beNil();
                           }];
        });

    });
    
});

SpecEnd