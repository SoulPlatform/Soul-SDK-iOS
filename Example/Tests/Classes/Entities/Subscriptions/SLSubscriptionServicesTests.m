//
//  SLSubscriptionServicesTests.m
//  SoulSDK
//
//  Created by Mikhail on 07.03.16.
//  Copyright © 2016 Mikhail Shershnev. All rights reserved.
//

SpecBegin(SLSubscriptionServices)

describe(@"subscription services object mapping", ^{

    // given
    NSString *kMembershipKey = @"membership";

    NSDictionary *membershipValue = @{
                                      @"subscriptionId": @"gor3e73jf93",
                                      @"expiresTime": @(1447116497.321),
                                      };

    SLSubscriptionServicesMapper *servicesMapper = [SLSubscriptionServicesMapper new];

    //
    it(@"mapping from nil dict", ^{

        NSDictionary *dict = nil;
        SLSubscriptionServices *services = [servicesMapper mapServices:dict];

        expect(services).to.beNil();
    });

    it(@"mapping from empty dict", ^{

        NSDictionary *dict = @{};
        SLSubscriptionServices *services = [servicesMapper mapServices:dict];

        expect(services).notTo.beNil();
        expect(services.membership).to.beNil();
    });

    it(@"mapping", ^{

        NSDictionary *dict = @{
                               kMembershipKey: membershipValue,
                               };

        SLSubscriptionServices *services = [servicesMapper mapServices:dict];

        expect(services).notTo.beNil();
        expect(services.membership).notTo.beNil();
    });

    it(@"mapping from NSNull", ^{

        NSDictionary *dict = @{
                               kMembershipKey: [NSNull null],
                               };

        SLSubscriptionServices *services = [servicesMapper mapServices:dict];

        expect(services).notTo.beNil();
        expect(services.membership).to.beNil();
    });
    
});

SpecEnd