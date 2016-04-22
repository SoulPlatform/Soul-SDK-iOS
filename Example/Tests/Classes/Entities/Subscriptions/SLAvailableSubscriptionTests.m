//
//  SLAvailableSubscriptionTests.m
//  SoulSDK
//
//  Created by Mikhail on 29.02.16.
//  Copyright © 2016 Mikhail Shershnev. All rights reserved.
//

SpecBegin(SLAvailableSubscription)

describe(@"available subscription mapping", ^{
    
    // given
    NSString *kProductNameKey = @"productName";
    NSString *kDurationKey = @"duration";
    NSString *kServicesKey = @"services";
    NSString *kAutoRenewableKey = @"autoRenewable";

    NSString *productNameString = @"org.acme.MonthlyMembership";
    NSInteger productNameInteger = 14;

    NSDictionary *durationDict = @{
                                   @"number": @(1),
                                   @"unit": @"month"
                                   };

    NSArray *servicesArrayFirst = @[ @"membership" ];
    NSArray *servicesArraySecond = @[ @"shmembership" ];

    BOOL autoRenewableBool = YES;
    NSInteger autoRenewableInteger = 1;

    SLAvailableSubscriptionMapper *availableSubscriptionMapper = [SLAvailableSubscriptionMapper new];

    //
    it(@"mapping from nil dict", ^{

        NSDictionary *dict = nil;
        SLAvailableSubscription *availableSubscription = [availableSubscriptionMapper mapAvailableSubscription:dict];

        expect(availableSubscription).to.beNil();
    });

    it(@"mapping from empty dict", ^{
        
        NSDictionary *dict = @{};
        SLAvailableSubscription *availableSubscription = [availableSubscriptionMapper mapAvailableSubscription:dict];

        expect(availableSubscription).to.beNil();
    });
    
    it(@"mapping #1", ^{
        
        NSDictionary *dict = @{
                               kProductNameKey: productNameString,
                               kDurationKey: durationDict,
                               kServicesKey: servicesArrayFirst,
                               kAutoRenewableKey: @(autoRenewableBool),
                               };

        SLAvailableSubscription *availableSubscription = [availableSubscriptionMapper mapAvailableSubscription:dict];

        //
        expect(availableSubscription).notTo.beNil();
        expect(availableSubscription.duration).notTo.beNil();

        expect(availableSubscription.productName).to.equal(productNameString);
        expect(availableSubscription.services).notTo.beNil();
        expect(availableSubscription.services.firstObject).to.equal( @(SLSubscriptionServiceMembershipType) );
        expect(availableSubscription.autoRenewable).to.equal(@(autoRenewableBool));
    });

    it(@"mapping #2", ^{

        NSDictionary *dict = @{
                               kProductNameKey: @(productNameInteger),
                               kDurationKey: durationDict,
                               kServicesKey: servicesArraySecond,
                               kAutoRenewableKey: @(autoRenewableInteger),
                               };

        SLAvailableSubscription *availableSubscription = [availableSubscriptionMapper mapAvailableSubscription:dict];

        NSString *_productNameString = [NSString stringWithFormat:@"%d", productNameInteger];
        //
        expect(availableSubscription).notTo.beNil();
        expect(availableSubscription.duration).notTo.beNil();
        expect(availableSubscription.productName).to.equal( _productNameString );
        expect(availableSubscription.services).notTo.beNil();
        expect(availableSubscription.services.firstObject).to.equal( @(SLSubscriptionServiceUnknownType) );
        expect(availableSubscription.autoRenewable).to.equal( @(YES) );
    });

    it(@"mapping from NSNull", ^{

        NSDictionary *dict = @{
                               kProductNameKey: [NSNull null],
                               kDurationKey: durationDict,
                               kServicesKey: [NSNull null],
                               kAutoRenewableKey: [NSNull null],
                               };

        SLAvailableSubscription *availableSubscription = [availableSubscriptionMapper mapAvailableSubscription:dict];

        //
        expect(availableSubscription).to.beNil();
    });
    
});

SpecEnd
