//
//  SLPhotoTests.m
//  SoulSDK
//
//  Created by Mikhail on 06.03.16.
//  Copyright © 2016 Mikhail Shershnev. All rights reserved.
//

SpecBegin(SLPhoto)

describe(@"photo object mapping", ^{

    // given
    NSString *kPhotoIdKey = @"id";
    NSString *kExpiresTimeKey = @"expiresTime";
    NSString *kMainKey = @"main";
    NSString *kOriginalKey = @"original";
    NSString *k300Key = @"300px";

    NSString *photoIdString = @"rjyudlgbdu7";
    NSInteger photoIdInteger = 123456;

    double expiresTimeDouble = 1447196497.291;
    NSString *expiresTimeString = @"1447196497.291";

    BOOL mainBool = NO;
    NSString *mainString = @"false";

    NSDictionary *urlOriginal = @{
                                   @"url": @"http://example.com/path/to/photo/original.jpg",
                                   @"width": @(640),
                                   @"height": @(1136),
                                   };

    NSDictionary *url300px = @{
                               @"url": @"http://example.com/path/to/photo/300px.jpg",
                               @"width": @(300),
                               @"height": @(580),
                               };

    SLPhotoMapper *photoMapper = [SLPhotoMapper new];

    //
    it(@"mapping from nil dict", ^{

        NSDictionary *dict = nil;
        SLPhoto *photo = [photoMapper mapPhoto:dict];

        expect(photo).to.beNil();
    });

    it(@"mapping from empty dict", ^{

        NSDictionary *dict = @{};
        SLPhoto *photo = [photoMapper mapPhoto:dict];

        expect(photo).to.beNil();
    });

    it(@"mapping #1", ^{

        NSDictionary *dict = @{
                               kPhotoIdKey: photoIdString,
                               kExpiresTimeKey: @(expiresTimeDouble),
                               kMainKey: @(mainBool),
                               kOriginalKey: urlOriginal,
                               k300Key: url300px,
                               };

        SLPhoto *photo = [photoMapper mapPhoto:dict];

        expect(photo).notTo.beNil();
        expect(photo.photoId).to.equal( photoIdString );
        expect(photo.expiresTime).to.equal( @(expiresTimeDouble) );
        expect(photo.isMain).to.equal( @(mainBool) );
        expect(photo.original).notTo.beNil();
    });

    it(@"mapping #2", ^{

        NSDictionary *dict = @{
                               kPhotoIdKey: @( photoIdInteger ),
                               kExpiresTimeKey: expiresTimeString,
                               kMainKey: mainString,
                               kOriginalKey: urlOriginal,
                               };

        SLPhoto *photo = [photoMapper mapPhoto:dict];

        NSString *_photoIdString = [NSString stringWithFormat:@"%d", photoIdInteger];

        expect(photo).notTo.beNil();
        expect(photo.photoId).to.equal( _photoIdString );
        expect(photo.expiresTime).to.equal( @(expiresTimeDouble) );
        expect(photo.isMain).to.equal( @(mainBool) );
        expect(photo.original).notTo.beNil();
    });

    it(@"mapping #3", ^{

        NSDictionary *dict = @{
                               kPhotoIdKey: photoIdString,
                               kExpiresTimeKey: @(expiresTimeDouble),
                               };

        SLPhoto *photo = [photoMapper mapPhoto:dict];

        expect(photo).to.beNil();
    });

    it(@"mapping from NSNull", ^{

        NSDictionary *dict = @{
                               kPhotoIdKey: [NSNull null],
                               kExpiresTimeKey: [NSNull null],
                               kOriginalKey: [NSNull null],
                               };

        SLPhoto *photo = [photoMapper mapPhoto:dict];

        expect(photo).to.beNil();
    });

});

SpecEnd