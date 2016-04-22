//
//  SLUserParametersTests.m
//  SoulSDK
//
//  Created by Mikhail on 07.03.16.
//  Copyright © 2016 Mikhail Shershnev. All rights reserved.
//

SpecBegin(SLUserParameters)

describe(@"user parameters object mapping", ^{

    // given
    NSString *kFilterableKey = @"filterable";
    NSString *kPrivateKey = @"private";
    NSString *kPublicVisibleKey = @"publicVisible";
    NSString *kPublicWritableKey = @"publicWritable";

    //
    NSDictionary *filterableParams = @{
                                       @"banned": @(NO),
                                       @"availableTill": @(1447116497.321),
                                       @"location": @{
                                               @"lat": @(55.3422433),
                                               @"lng": @(34.432432343),
                                               },
                                       @"gender": @"F",
                                       @"lookingForGender": @"M",
                                       };

    //
    NSString *privateKey1 = @"foo";
    NSString *privateVal1 = @"bar";

    NSString *privateKey2 = @"disabledSound";
    NSNumber *privateVal2 = @(YES);

    NSDictionary *privateParams = @{
                                    privateKey1: privateVal1,
                                    privateKey2: privateVal2,
                                    };
    //
    NSString *publicVisibleKey1 = @"headline";
    NSString *publicVisibleVal1 = @"Let's have some fun tonight!";

    NSDictionary *publicVisibleParams = @{
                                          publicVisibleKey1: publicVisibleVal1,
                                          };
    //
    NSDictionary *publicWritableParams = @{};

    SLUserParametersMapper *parametersMapper = [SLUserParametersMapper new];

    //
    it(@"mapping from nil dict", ^{

        NSDictionary *dict = nil;
        SLUserParameters *params = [parametersMapper mapParameters:dict];

        expect(params).to.beNil();
    });

    it(@"mapping from empty dict", ^{

        NSDictionary *dict = @{};
        SLUserParameters *params = [parametersMapper mapParameters:dict];

        expect(params).to.beNil();
    });

    it(@"mapping", ^{

        NSDictionary *dict = @{
                               kFilterableKey: filterableParams,
                               kPrivateKey: privateParams,
                               kPublicVisibleKey: publicVisibleParams,
                               kPublicWritableKey: publicWritableParams,
                               };

        SLUserParameters *params = [parametersMapper mapParameters:dict];

        expect(params).notTo.beNil();
        expect(params.filterable).notTo.beNil();
        //expect(params.filterable.location).notTo.beNil();

        expect(params.individual).notTo.beNil();
        expect(params.individual[privateKey1]).to.equal( privateVal1 );
        expect(params.individual[privateKey2]).to.equal( privateVal2 );

        expect(params.publicVisible).notTo.beNil();
        expect(params.publicVisible[publicVisibleKey1]).to.equal( publicVisibleVal1 );

        expect(params.publicWritable).notTo.beNil();
        expect(params.publicWritable).to.beEmpty();
    });

    it(@"mapping from NSNull", ^{

        NSDictionary *dict = @{
                               kFilterableKey: [NSNull null],
                               kPrivateKey: [NSNull null],
                               kPublicVisibleKey: [NSNull null],
                               kPublicWritableKey: [NSNull null],
                               };

        SLUserParameters *params = [parametersMapper mapParameters:dict];

        expect(params).to.beNil();
    });

});

SpecEnd