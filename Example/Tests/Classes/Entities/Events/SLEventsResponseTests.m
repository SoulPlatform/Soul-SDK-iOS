//
//  SLEventsResponseTests.m
//  SoulSDK
//
//  Created by Mikhail on 11.04.16.
//  Copyright © 2016 Mikhail Shershnev. All rights reserved.
//

#import "SLTEventsResponseDataManager.h"

SpecBegin(SLEventsResponse)

describe(@"events response mapping", ^{

    // given
    SLTEventsResponseDataManager *eventsResponseData = [SLTEventsResponseDataManager new];
    NSDictionary *responseDict = [eventsResponseData eventsResponse];

    NSObject <SLEventsResponseMapperProtocol> *mapper = [SLEventsResponseMapper new];

    it(@"mapping from nil dict", ^{

        NSDictionary *dict = nil;
        SLEventsResponse *eventsResponse = [mapper mapEventsResponse:dict];

        expect(eventsResponse).to.beNil();
    });

    it(@"mapping from empty dict", ^{

        NSDictionary *dict = @{};
        SLEventsResponse *eventsResponse = [mapper mapEventsResponse:dict];

        expect(eventsResponse).to.beNil();
    });

    it(@"normal mapping", ^{
        
        NSDictionary *dict = responseDict;
        SLEventsResponse *eventsResponse = [mapper mapEventsResponse:dict];

        expect(eventsResponse).notTo.beNil();
        expect(eventsResponse.meta).notTo.beNil();
        expect(eventsResponse.events).notTo.beNil();
        expect(eventsResponse.additionalInfo).notTo.beNil();
    });

});

SpecEnd