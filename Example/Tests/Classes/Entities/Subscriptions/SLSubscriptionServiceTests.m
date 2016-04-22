//
//  SLSubscriptionServiceTests.m
//  SoulSDK
//
//  Created by Mikhail on 06.03.16.
//  Copyright © 2016 Mikhail Shershnev. All rights reserved.
//

SpecBegin(SLSubscriptionService)

describe(@"subscription service object mapping", ^{

    // given
    NSString *kSubscriptionIdKey = @"subscriptionId";
    NSString *kExpiresTimeKey = @"expiresTime";

    NSString *subscriptionIdString = @"gor3e73jf93";
    NSInteger subscriptionIdInteger = 123456;

    double expiresTimeDouble = 1447116497.321;
    NSString *expiresTimeString = @"1447116497.321";

    SLSubscriptionServiceMapper *serviceMapper = [SLSubscriptionServiceMapper new];

    //
    it(@"mapping from nil dict", ^{

        NSDictionary *dict = nil;
        SLSubscriptionService *service = [serviceMapper mapService:dict];

        expect(service).to.beNil();
    });

    it(@"mapping from empty dict", ^{

        NSDictionary *dict = @{};
        SLSubscriptionService *service = [serviceMapper mapService:dict];

        expect(service).to.beNil();
    });

    it(@"mapping #1", ^{

        NSDictionary *dict = @{
                               kSubscriptionIdKey: subscriptionIdString,
                               kExpiresTimeKey: @(expiresTimeDouble),
                               };

        SLSubscriptionService *service = [serviceMapper mapService:dict];

        expect(service).notTo.beNil();
        expect(service.subscriptionId).to.equal(subscriptionIdString);
        expect(service.expiresTime).to.equal( @(expiresTimeDouble) );
    });

    it(@"mapping #2", ^{

        NSDictionary *dict = @{
                               kSubscriptionIdKey: @(subscriptionIdInteger),
                               kExpiresTimeKey: expiresTimeString,
                               };

        SLSubscriptionService *service = [serviceMapper mapService:dict];

        NSString *_subscriptionIdString = [NSString stringWithFormat:@"%d", subscriptionIdInteger];

        expect(service).notTo.beNil();
        expect(service.subscriptionId).to.equal( _subscriptionIdString );
        expect(service.expiresTime).to.equal( @(expiresTimeDouble) );
    });

    it(@"mapping from NSNull", ^{

        NSDictionary *dict = @{
                               kSubscriptionIdKey: [NSNull null],
                               kExpiresTimeKey: [NSNull null],
                               };

        SLSubscriptionService *service = [serviceMapper mapService:dict];

        expect(service).to.beNil();
    });

});

SpecEnd