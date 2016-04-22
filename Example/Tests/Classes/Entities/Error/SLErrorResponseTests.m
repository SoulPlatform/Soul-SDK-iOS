//
//  SLErrorResponseTests.m
//  SoulSDK
//
//  Created by Mikhail on 28.03.16.
//  Copyright © 2016 Mikhail Shershnev. All rights reserved.
//

#import "SLTErrorResponseDataManager.h"

SpecBegin(SLErrorResponseTests)

describe(@"error response mapping", ^{

    // given
    SLTErrorResponseDataManager *errorResponseData = [SLTErrorResponseDataManager new];
    NSDictionary *errorResponseDict = [errorResponseData errorResponse];

    SLErrorResponseMapper *mapper = [SLErrorResponseMapper new];

    it(@"mapping from nil dict", ^{

        NSDictionary *dict = nil;
        SLErrorResponse *errorResponse = [mapper mapErrorResponse:dict];

        expect(errorResponse).to.beNil();
    });

    it(@"mapping from empty dict", ^{

        NSDictionary *dict = @{};
        SLErrorResponse *errorResponse = [mapper mapErrorResponse:dict];

        expect(errorResponse).to.beNil();
    });

    it(@"normal mapping", ^{

        NSDictionary *dict = errorResponseDict;
        SLErrorResponse *errorResponse = [mapper mapErrorResponse:dict];

        expect(errorResponse).notTo.beNil();
        expect(errorResponse.error).notTo.beNil();
        expect(errorResponse.additionalInfo).notTo.beNil();
    });

    it(@"code from NSNull", ^{

        NSDictionary *dict = @{
                               kErrorKey: [NSNull null],
                               kAdditionalKey: [NSNull null],
                               };

        SLErrorResponse *errorResponse = [mapper mapErrorResponse:dict];

        expect(errorResponse).to.beNil();
    });
    
});

SpecEnd
