//
//  SLLocationTests.m
//  SoulSDK
//
//  Created by Mikhail on 12.02.16.
//  Copyright © 2016 Mikhail Shershnev. All rights reserved.
//

SpecBegin(SLLocation)

describe(@"location mapping", ^{
    
    // given
    NSString *kLatitudeKey = @"lat";
    NSString *kLongitudeKey = @"lng";

    double latitudeDouble = 40.712784;
    double longitudeDouble = -74.005941;

    NSNumber *latitudeNumber = @(40.712784);
    NSNumber *longitudeNumber = @(-74.005941);

    NSString *latitudeString = @"40.712784";
    NSString *longitudeString = @"-74.005941";

    SLLocationMapper *locationMapper = [SLLocationMapper new];

    //
    it(@"mapping from nil dict", ^{

        NSDictionary *dict = nil;
        SLLocation *location = [locationMapper mapLocation:dict];

        expect(location).to.beNil();
    });

    it(@"mapping from empty dict", ^{

        NSDictionary *dict = @{};
        SLLocation *location = [locationMapper mapLocation:dict];

        //
        expect(location.latitude).to.beFalsy();
        expect(location.longitude).to.beFalsy();
    });

    it(@"mapping from double", ^{

        NSDictionary *dict = @{
                               kLatitudeKey: @(latitudeDouble),
                               kLongitudeKey: @(longitudeDouble),
                               };

        SLLocation *location = [locationMapper mapLocation:dict];
        
        //
        expect(location.latitude).to.equal(latitudeDouble);
        expect(location.longitude).to.equal(longitudeDouble);
    });

    it(@"mapping from NSNumber", ^{

        NSDictionary *dict = @{
                               kLatitudeKey: latitudeNumber,
                               kLongitudeKey: longitudeNumber,
                               };

        SLLocation *location = [locationMapper mapLocation:dict];

        //
        expect(location.latitude).to.equal(latitudeDouble);
        expect(location.longitude).to.equal(longitudeDouble);
    });

    it(@"mapping from NSString", ^{

        NSDictionary *dict = @{
                               kLatitudeKey: latitudeString,
                               kLongitudeKey: longitudeString,
                               };

        SLLocation *location = [locationMapper mapLocation:dict];

        //
        expect(location.latitude).to.equal(latitudeDouble);
        expect(location.longitude).to.equal(longitudeDouble);
    });

    it(@"mapping from BOOL", ^{

        NSDictionary *dict = @{
                               kLatitudeKey: @(NO),
                               kLongitudeKey: @(YES),
                               };

        SLLocation *location = [locationMapper mapLocation:dict];

        //
        expect(location.latitude).to.beFalsy();
        expect(location.longitude).to.beTruthy();
    });

    it(@"mapping from NSNull", ^{
        
        NSDictionary *dict = @{
                               kLatitudeKey: [NSNull null],
                               kLongitudeKey: [NSNull null],
                               };

        SLLocation *location = [locationMapper mapLocation:dict];

        //
        expect(location.latitude).to.beFalsy();
        expect(location.longitude).to.beFalsy();
    });

});

SpecEnd