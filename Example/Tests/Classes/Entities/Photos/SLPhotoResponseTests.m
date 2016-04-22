//
//  SLPhotoResponseTests.m
//  SoulSDK
//
//  Created by Mikhail on 05.04.16.
//  Copyright © 2016 Mikhail Shershnev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SLTPhotoDataManager.h"
#import "SLPhotoResponseMapper.h"

SpecBegin(SLPhotoResponse)

describe(@"photo response object mapping", ^{

    // given
    SLTPhotoDataManager *photoData = [SLTPhotoDataManager new];
    NSDictionary *responseDict = [photoData photoResponse];

    NSObject <SLPhotoResponseMapperProtocol> *mapper = [SLPhotoResponseMapper new];

    it(@"mapping from nil dict", ^{

        NSDictionary *dict = nil;
        SLPhotoResponse *photoResponse = [mapper mapPhotoResponse:dict];

        expect(photoResponse).to.beNil();
    });
    
    it(@"mapping from empty dict", ^{
        
        NSDictionary *dict = @{};
        SLPhotoResponse *photoResponse = [mapper mapPhotoResponse:dict];
        
        expect(photoResponse).to.beNil();
    });
    
    it(@"normal mapping", ^{

        NSDictionary *dict = responseDict;
        SLPhotoResponse *photoResponse = [mapper mapPhotoResponse:dict];

        expect(photoResponse).notTo.beNil();
        expect(photoResponse.photo).notTo.beNil();
        expect(photoResponse.additionalInfo).notTo.beNil();
    });
    
});

SpecEnd