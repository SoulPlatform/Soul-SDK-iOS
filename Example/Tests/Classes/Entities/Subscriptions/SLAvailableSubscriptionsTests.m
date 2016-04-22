//
//  SLAvailableSubscriptionsTests.m
//  SoulSDK
//
//  Created by Mikhail on 29.02.16.
//  Copyright © 2016 Mikhail Shershnev. All rights reserved.
//

#import "SLTAvailableSubscriptionsDataManager.h"

SpecBegin(SLAvailableSubscriptions)

describe(@"available subscription mapping", ^{

    // given
    SLAvailableSubscriptionsMapper *productsMapper = [SLAvailableSubscriptionsMapper new];

    SLTAvailableSubscriptionsDataManager *productsData = [SLTAvailableSubscriptionsDataManager new];
    NSDictionary *products = [productsData products];

    it(@"mapping #1", ^{
        
        NSDictionary *dict = products;
        SLAvailableSubscriptions *products = [productsMapper mapAvailableSubscriptions:dict];

        //
        expect(products).notTo.beNil();
        expect(products.items).notTo.beNil();
        expect(products.items).to.haveCountOf(2);

    });

});

SpecEnd