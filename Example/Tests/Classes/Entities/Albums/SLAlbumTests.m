//
//  SLAlbumTests.m
//  SoulSDK
//
//  Created by Mikhail on 06.03.16.
//  Copyright © 2016 Mikhail Shershnev. All rights reserved.
//

#import "SLTAlbumsDataManager.h"

SpecBegin(SLAlbum)

describe(@"album object mapping", ^{

    // given
    SLTAlbumsDataManager *albumsData = [SLTAlbumsDataManager new];

    NSString *name = [albumsData name];

    NSString *privacyPublic = [albumsData privacyPublic];
    NSString *privacyPrivate = [albumsData privacyPrivate];
    NSString *privacyUnknown = [albumsData privacyUnknown];

    CGFloat photoCountFloat = [albumsData photoCountFloat];
    NSInteger photoCountInteger = [albumsData photoCountInteger];
    NSString *photoCountString = [albumsData photoCountString];

    NSDictionary *params = [albumsData parameters];

    NSString *paramKey1 = params.allKeys[0];
    NSString *paramVal1 = params[paramKey1];
    
    NSString *paramKey2 = params.allKeys[1];
    NSNumber *paramVal2 = params[paramKey2];

    NSDictionary *mainPhoto = [albumsData mainPhoto];
    NSArray *photosArray = [albumsData photos];

    SLAlbumMapper *albumMapper = [SLAlbumMapper new];

    ////////////////////////////////////////////////////
    // SLCompleteAlbum
    ////////////////////////////////////////////////////

    it(@"complete object mapping from nil dict", ^{

        NSDictionary *dict = nil;
        SLCompleteAlbum *album = [albumMapper mapCompleteAlbum:dict];

        expect(album).to.beNil();
    });

    it(@"complete object mapping from empty dict", ^{

        NSDictionary *dict = @{};
        SLCompleteAlbum *album = [albumMapper mapCompleteAlbum:dict];

        expect(album).to.beNil();
    });

    it(@"complete object mapping #1", ^{

        NSDictionary *dict = @{
                               kTNameKey: name,
                               kTPrivacyKey: privacyPrivate,
                               kTPhotoCountKey: @( photoCountInteger ),
                               kTParametersKey: params,
                               kTMainPhotoKey: mainPhoto,
                               kTPhotosKey: photosArray,
                               };

        SLCompleteAlbum *album = [albumMapper mapCompleteAlbum:dict];

        expect(album).notTo.beNil();
        expect(album.name).to.equal( name );
        expect(album.privacy).to.equal( @(SLAlbumPrivacyPrivate) );
        expect(album.photoCount).to.equal( @(photoCountInteger) );

        expect(album.parameters).notTo.beNil();
        expect(album.parameters[paramKey1]).to.equal(paramVal1);
        expect(album.parameters[paramKey2]).to.equal(paramVal2);

        expect(album.mainPhoto).notTo.beNil();
        expect(album.photos).notTo.beNil();
        expect(album.photos).to.haveCountOf( photosArray.count );
    });

    it(@"complete object mapping #2", ^{

        NSDictionary *dict = @{
                               kTNameKey: name,
                               kTPrivacyKey: privacyPublic,
                               kTPhotoCountKey: @( photoCountFloat ),
                               kTParametersKey: params,
                               kTMainPhotoKey: mainPhoto,
                               kTPhotosKey: photosArray,
                               };

        SLCompleteAlbum *album = [albumMapper mapCompleteAlbum:dict];

        expect(album).notTo.beNil();
        expect(album.name).to.equal( name );
        expect(album.privacy).to.equal( @(SLAlbumPrivacyPublic) );
        expect(album.photoCount).to.equal( @(photoCountInteger) );
        expect(album.mainPhoto).notTo.beNil();
        expect(album.photos).notTo.beNil();
        expect(album.photos).to.haveCountOf( photosArray.count );
    });

    it(@"complete object mapping #3", ^{

        NSDictionary *dict = @{
                               kTNameKey: name,
                               kTPrivacyKey: privacyUnknown,
                               kTPhotoCountKey: photoCountString,
                               kTParametersKey: params,
                               kTMainPhotoKey: mainPhoto,
                               kTPhotosKey: photosArray,
                               };

        SLCompleteAlbum *album = [albumMapper mapCompleteAlbum:dict];

        expect(album).notTo.beNil();
        expect(album.name).to.equal( name );
        expect(album.privacy).to.equal( @(SLAlbumPrivacyUnknown) );
        expect(album.photoCount).to.equal( @(photoCountInteger) );
        expect(album.mainPhoto).notTo.beNil();
        expect(album.photos).notTo.beNil();
        expect(album.photos).to.haveCountOf( photosArray.count );
    });

    it(@"complete object mapping from NSNull", ^{

        NSDictionary *dict = @{
                               kTPrivacyKey: [NSNull null],
                               kTPhotoCountKey: [NSNull null],
                               kTParametersKey: [NSNull null],
                               kTMainPhotoKey: [NSNull null],
                               kTPhotosKey: [NSNull null],
                               };

        SLCompleteAlbum *album = [albumMapper mapCompleteAlbum:dict];

        expect(album).to.beNil();
    });

    ////////////////////////////////////////////////////
    // SLMiniAlbum
    ////////////////////////////////////////////////////

    it(@"mini object mapping from nil dict", ^{

        NSDictionary *dict = nil;
        SLMiniAlbum *miniAlbum = [albumMapper mapMiniAlbum:dict];

        expect(miniAlbum).to.beNil();
    });

    it(@"mini object mapping from empty dict", ^{

        NSDictionary *dict = @{};
        SLMiniAlbum *miniAlbum = [albumMapper mapMiniAlbum:dict];

        expect(miniAlbum).to.beNil();
    });

    it(@"mini object mapping #1", ^{

        NSDictionary *dict = @{
                               kTNameKey: name,
                               kTPrivacyKey: privacyPrivate,
                               kTPhotoCountKey: @( photoCountInteger ),
                               kTParametersKey: params,
                               kTMainPhotoKey: mainPhoto,
                               };

        SLMiniAlbum *miniAlbum = [albumMapper mapMiniAlbum:dict];

        expect(miniAlbum).notTo.beNil();
        expect(miniAlbum.name).to.equal( name );
        expect(miniAlbum.privacy).to.equal( @(SLAlbumPrivacyPrivate) );
        expect(miniAlbum.photoCount).to.equal( @(photoCountInteger) );

        expect(miniAlbum.parameters).notTo.beNil();
        expect(miniAlbum.parameters[paramKey1]).to.equal(paramVal1);
        expect(miniAlbum.parameters[paramKey2]).to.equal(paramVal2);

        expect(miniAlbum.mainPhoto).notTo.beNil();
    });

    it(@"mini object mapping #2", ^{

        NSDictionary *dict = @{
                               kTNameKey: name,
                               kTPrivacyKey: privacyPublic,
                               kTPhotoCountKey: @( photoCountFloat ),
                               kTParametersKey: params,
                               kTMainPhotoKey: mainPhoto,
                               };

        SLMiniAlbum *miniAlbum = [albumMapper mapMiniAlbum:dict];

        expect(miniAlbum).notTo.beNil();
        expect(miniAlbum.name).to.equal( name );
        expect(miniAlbum.privacy).to.equal( @(SLAlbumPrivacyPublic) );
        expect(miniAlbum.photoCount).to.equal( @(photoCountInteger) );
        expect(miniAlbum.mainPhoto).notTo.beNil();
    });

    it(@"mini object mapping #3", ^{

        NSDictionary *dict = @{
                               kTNameKey: name,
                               kTPrivacyKey: privacyUnknown,
                               kTPhotoCountKey: photoCountString,
                               kTParametersKey: params,
                               kTMainPhotoKey: mainPhoto,
                               };

        SLMiniAlbum *miniAlbum = [albumMapper mapMiniAlbum:dict];

        expect(miniAlbum).notTo.beNil();
        expect(miniAlbum.name).to.equal( name );
        expect(miniAlbum.privacy).to.equal( @(SLAlbumPrivacyUnknown) );
        expect(miniAlbum.photoCount).to.equal( @(photoCountInteger) );
        expect(miniAlbum.mainPhoto).notTo.beNil();
    });

    it(@"mini object mapping from NSNull", ^{

        NSDictionary *dict = @{
                               kTPrivacyKey: [NSNull null],
                               kTPhotoCountKey: [NSNull null],
                               kTParametersKey: [NSNull null],
                               kTMainPhotoKey: [NSNull null],
                               };

        SLMiniAlbum *miniAlbum = [albumMapper mapMiniAlbum:dict];

        expect(miniAlbum).to.beNil();
    });

});

SpecEnd