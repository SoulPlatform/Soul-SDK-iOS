//
//  SLApiEventsTestSpec.m
//  SoulSDK
//
//  Created by Mikhail on 11.04.16.
//  Copyright © 2016 Mikhail Shershnev. All rights reserved.
//

#import "SLTHttpClientMock.h"
#import "SLTEventsResponseDataManager.h"

SpecBegin(SLApiEvents)

describe(@"users endpoint", ^{

    NSObject<SLHttpClientProtocol> *httpClient;
    SLApiEvents *eventsApi = [[SLApiEvents alloc] initWithHttpClient:httpClient storage:nil config:nil];

    SLTEventsResponseDataManager *eventsResponseData = [SLTEventsResponseDataManager new];
    NSDictionary *eventsResponse = [eventsResponseData eventsResponse];

    NSInteger statusCode200 = 200;
    NSInteger statusCode400 = 400;

    NSNumber *after = @(14);
    NSNumber *limit = @(20);
    NSNumber *since = @(3242234324324.223);

    describe(@"after", ^{

        it(@"success", ^{

            eventsApi.httpClient = [SLTHttpClientMock executedSuccessfullyWithStatusCode:statusCode200 response:eventsResponse];

            [eventsApi loadAfter:after
                           limit:limit
                         success:^(SLEventsResponse * _Nonnull eventsResponse) {

                             expect(eventsResponse).notTo.beNil();
                             expect(eventsResponse.meta).notTo.beNil();
                             expect(eventsResponse.events).notTo.beNil();
                             expect(eventsResponse.additionalInfo).notTo.beNil();

                         } failure:nil];

        });

        it(@"failure", ^{

            eventsApi.httpClient = [SLTHttpClientMock executedSuccessfullyWithStatusCode:statusCode400 response:nil];

            [eventsApi loadAfter:after
                           limit:limit
                         success:nil
                         failure:^(NSError * _Nullable error) {
                             expect(error).to.beNil();
                         }];
        });

    });

    describe(@"since", ^{

        it(@"success", ^{

            eventsApi.httpClient = [SLTHttpClientMock executedSuccessfullyWithStatusCode:statusCode200 response:eventsResponse];

            [eventsApi loadSince:since
                           limit:limit
                         success:^(SLEventsResponse * _Nonnull eventsResponse) {

                             expect(eventsResponse).notTo.beNil();
                             expect(eventsResponse.meta).notTo.beNil();
                             expect(eventsResponse.events).notTo.beNil();
                             expect(eventsResponse.additionalInfo).notTo.beNil();

                         } failure:nil];

        });

        it(@"failure", ^{

            eventsApi.httpClient = [SLTHttpClientMock executedSuccessfullyWithStatusCode:statusCode400 response:nil];

            [eventsApi loadAfter:after
                           limit:limit
                         success:nil
                         failure:^(NSError * _Nullable error) {
                             expect(error).to.beNil();
                         }];
        });

    });

});

SpecEnd