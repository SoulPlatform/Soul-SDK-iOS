//
//  SLFilterableParametersTests.m
//  SoulSDK
//
//  Created by Mikhail on 07.03.16.
//  Copyright © 2016 Mikhail Shershnev. All rights reserved.
//

SpecBegin(SLFilterableParameters)

describe(@"filterable parameters object mapping", ^{

    // given
    NSString *kBannedKey = @"banned";
    NSString *kAvailableTillKey = @"availableTill";
    NSString *kGenderKey = @"gender";
    NSString *kLookingForKey = @"lookingForGender";
    NSString *kLocationKey = @"location";

    BOOL bannedBool = NO;
    NSString *bannedString = @"true";

    double availableTillDouble = 1447116497.321;
    NSString *availableTillString = @"1447116497.321";

    NSString *genderMaleLowerString = @"m";
    NSString *genderMaleUpperString = @"M";

    NSString *genderFemaleLowerString = @"f";
    NSString *genderFemaleUpperString = @"F";

    NSDictionary *location = @{
                               @"lat": @(55.3422433),
                               @"lng": @(34.432432343),
                               };

    SLFilterableParametersMapper *filterableParametersMapper = [SLFilterableParametersMapper new];

    //
    it(@"mapping from nil dict", ^{

        NSDictionary *dict = nil;
        SLFilterableParameters *params = [filterableParametersMapper mapFilterableParameters:dict];

        expect(params).to.beNil();
    });

    it(@"mapping from empty dict", ^{

        NSDictionary *dict = @{};
        SLFilterableParameters *params = [filterableParametersMapper mapFilterableParameters:dict];

        expect(params).to.beNil();
    });

    it(@"mapping #1", ^{

        NSDictionary *dict = @{
                               kBannedKey: @(bannedBool),
                               kAvailableTillKey: availableTillString,
                               kGenderKey: genderMaleUpperString,
                               kLookingForKey: genderFemaleUpperString,
                               kLocationKey: location,
                               };

        SLFilterableParameters *params = [filterableParametersMapper mapFilterableParameters:dict];

        expect(params).notTo.beNil();
        //expect(params.banned).to.beFalsy();
        //expect(params.availableTill).to.equal( @(availableTillDouble) );
        //expect(params.gender).to.equal( @(SLUserGenderMaleType) );
        //expect(params.lookingForGender).to.equal( @(SLUserGenderFemaleType) );
        expect(params.location).notTo.beNil();
    });

    it(@"mapping #2", ^{

        NSDictionary *dict = @{
                               kBannedKey: bannedString,
                               kAvailableTillKey: @(availableTillDouble),
                               kGenderKey: genderMaleLowerString,
                               kLookingForKey: genderFemaleLowerString,
                               kLocationKey: location,
                               };
        
        SLFilterableParameters *params = [filterableParametersMapper mapFilterableParameters:dict];
        
        expect(params).notTo.beNil();
        //expect(params.banned).to.beTruthy();
        //expect(params.availableTill).to.equal( @(availableTillDouble) );
        //expect(params.gender).to.equal( @(SLUserGenderMaleType) );
        //expect(params.lookingForGender).to.equal( @(SLUserGenderFemaleType) );
        expect(params.location).notTo.beNil();
    });

    it(@"mapping from NSNull", ^{

        NSDictionary *dict = @{
                               kBannedKey: [NSNull null],
                               kAvailableTillKey: [NSNull null],
                               kGenderKey: [NSNull null],
                               kLookingForKey: [NSNull null],
                               kLocationKey: [NSNull null],
                               };

        SLFilterableParameters *params = [filterableParametersMapper mapFilterableParameters:dict];

        expect(params).to.beNil();
    });

});

SpecEnd