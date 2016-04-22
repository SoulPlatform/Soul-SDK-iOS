//
//  SLPhotoURLTests.m
//  SoulSDK
//
//  Created by Mikhail on 06.03.16.
//  Copyright © 2016 Mikhail Shershnev. All rights reserved.
//

SpecBegin(SLPhotoURL)

describe(@"photo url object mapping", ^{

    // given
    NSString *kURLKey = @"url";
    NSString *kWidthKey = @"width";
    NSString *kHeightKey = @"height";

    NSString *urlString = @"http://example.com/path/to/photo/a0b1c2.jpg";
    NSURL *URL = [NSURL URLWithString:urlString];

    NSString *widthString = @"200";
    NSInteger widthInteger = 200;

    NSString *heightString = @"400";
    NSInteger heightInteger = 400;

    SLPhotoURLMapper *photoURLMapper = [SLPhotoURLMapper new];

    //
    it(@"mapping from nil dict", ^{
        
        NSDictionary *dict = nil;
        SLPhotoURL *photoURL = [photoURLMapper mapPhotoURL:dict];

        expect(photoURL).to.beNil();
    });
    
    it(@"mapping from empty dict", ^{

        NSDictionary *dict = @{};
        SLPhotoURL *photoURL = [photoURLMapper mapPhotoURL:dict];

        expect(photoURL).to.beNil();
    });

    it(@"mapping #1", ^{
        
        NSDictionary *dict = @{
                               kURLKey: urlString,
                               kWidthKey: @(widthInteger),
                               kHeightKey: @(heightInteger),
                               };

        SLPhotoURL *photoURL = [photoURLMapper mapPhotoURL:dict];

        expect(photoURL).notTo.beNil();
        expect(photoURL.url).to.equal(URL);
        expect(photoURL.width).to.equal( @(widthInteger) );
        expect(photoURL.height).to.equal( @(heightInteger) );
    });

    it(@"mapping #2", ^{
        
        NSDictionary *dict = @{
                               kURLKey: urlString,
                               kWidthKey: widthString,
                               kHeightKey: heightString,
                               };

        SLPhotoURL *photoURL = [photoURLMapper mapPhotoURL:dict];

        expect(photoURL).notTo.beNil();
        expect(photoURL.url).to.equal(URL);
        expect(photoURL.width).to.equal( @(widthInteger) );
        expect(photoURL.height).to.equal( @(heightInteger) );
    });

    it(@"mapping from NSNull", ^{

        NSDictionary *dict = @{
                               kURLKey: [NSNull null],
                               kWidthKey: [NSNull null],
                               kHeightKey: [NSNull null],
                               };

        SLPhotoURL *photoURL = [photoURLMapper mapPhotoURL:dict];

        expect(photoURL).to.beNil();
    });

});

SpecEnd