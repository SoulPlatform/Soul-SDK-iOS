//
//  SLEndpointTests.m
//  SoulSDK
//
//  Created by Mikhail on 16.03.16.
//  Copyright © 2016 Mikhail Shershnev. All rights reserved.
//

SpecBegin(SLEndpoint)

describe(@"endpoint mapping", ^{

    // given
    NSString *kUriKey = @"uri";
    NSString *kTypeKey = @"type";

    NSString *uriString = @"/users/recommendations";
    NSString *newType = @"newItems";
    NSString *unknownType = @"unknown";

    NSObject<SLEndpointMapperProtocol> *mapper = [SLEndpointMapper new];

    it(@"mapping from nil dict", ^{

        NSDictionary *dict = nil;
        SLEndpoint *endpoint = [mapper mapEndpoint:dict];

        expect(endpoint).to.beNil();
    });

    it(@"mapping from empty dict", ^{

        NSDictionary *dict = nil;
        SLEndpoint *endpoint = [mapper mapEndpoint:dict];

        expect(endpoint).to.beNil();
    });

    it(@"mapping #1", ^{

        NSDictionary *dict = @{
                               kUriKey: uriString,
                               kTypeKey: newType,
                               };

        SLEndpoint *endpoint = [mapper mapEndpoint:dict];

        expect(endpoint).notTo.beNil();
        expect(endpoint.uri).to.equal( uriString );
        expect(endpoint.type).to.equal( @(SLEndpointNewItemType) );
    });

    it(@"mapping #2", ^{

        NSDictionary *dict = @{
                               kUriKey: uriString,
                               kTypeKey: unknownType,
                               };

        SLEndpoint *endpoint = [mapper mapEndpoint:dict];

        expect(endpoint).notTo.beNil();
        expect(endpoint.uri).to.equal( uriString );
        expect(endpoint.type).to.equal( @(SLEndpointUnknownType) );
    });

    it(@"mapping from NSNull", ^{
        
        NSDictionary *dict = @{
                               kUriKey: [NSNull null],
                               kTypeKey: [NSNull null],
                               };

        SLEndpoint *endpoint = [mapper mapEndpoint:dict];

        expect(endpoint).to.beNil();
    });
    
});

SpecEnd