//
//  SLSLSubscriptionDurationTests.m
//  SoulSDK
//
//  Created by Mikhail on 26.02.16.
//  Copyright © 2016 Mikhail Shershnev. All rights reserved.
//

SpecBegin(SLSubscriptionDuration)

describe(@"subscription duration mapping", ^{

    // given
    NSString *kUnitKey = @"unit";
    NSString *kNumberKey = @"number";

    //
    NSString *unitMonth = @"month";
    NSString *unitUnknown = @"twoMonths";

    //
    NSInteger numberInteger = 4;
    NSString *numberString = @"4";

    SLSubscriptionDurationMapper *subscriptionDurationMapper = [SLSubscriptionDurationMapper new];

    //
    it(@"mapping from nil dict", ^{

        NSDictionary *dict = nil;
        SLSubscriptionDuration *subscriptionDuration = [subscriptionDurationMapper mapSubscriptionDuration:dict];

        expect(subscriptionDuration).to.beNil();
    });

    it(@"mapping from empty dict", ^{
        
        NSDictionary *dict = @{};
        SLSubscriptionDuration *subscriptionDuration = [subscriptionDurationMapper mapSubscriptionDuration:dict];
        
        expect(subscriptionDuration).notTo.beNil();
    });

    it(@"mapping #1", ^{
        
        NSDictionary *dict = @{
                               kUnitKey: unitMonth,
                               kNumberKey: @(numberInteger),
                               };

        SLSubscriptionDuration *subscriptionDuration = [subscriptionDurationMapper mapSubscriptionDuration:dict];
        
        //
        expect(subscriptionDuration).notTo.beNil();
        expect(subscriptionDuration.unit).to.equal(@(SLSubscriptionDurationUnitMonth));
        expect(subscriptionDuration.number).to.equal(numberInteger);
    });

    it(@"mapping #2", ^{
        
        NSDictionary *dict = @{
                               kUnitKey: unitUnknown,
                               kNumberKey: numberString,
                               };
        
        SLSubscriptionDuration *subscriptionDuration = [subscriptionDurationMapper mapSubscriptionDuration:dict];
        
        //
        expect(subscriptionDuration).notTo.beNil();
        expect(subscriptionDuration.unit).to.equal(@(SLSubscriptionDurationUnitUnknown));
        expect(subscriptionDuration.number).to.equal(numberInteger);
    });

    it(@"mapping from NSNull", ^{

        NSDictionary *dict = @{
                               kUnitKey: [NSNull null],
                               kNumberKey: [NSNull null],
                               };

        SLSubscriptionDuration *subscriptionDuration = [subscriptionDurationMapper mapSubscriptionDuration:dict];

        //
        expect(subscriptionDuration).notTo.beNil();
        expect(subscriptionDuration.number).to.beFalsy();
        expect(subscriptionDuration.unit).to.equal( @(SLSubscriptionDurationUnitUnknown) );
    });
    
});

SpecEnd