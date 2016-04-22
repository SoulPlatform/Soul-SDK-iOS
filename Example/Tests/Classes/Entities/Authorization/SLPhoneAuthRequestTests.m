//
//  SLPhoneAuthRequestTests.m
//  SoulSDK
//
//  Created by Mikhail on 01.03.16.
//  Copyright © 2016 Mikhail Shershnev. All rights reserved.
//

#import "SLTPhoneAuthRequestDataManager.h"

SpecBegin(SLPhoneAuthRequest)

describe(@"phone auth request object mapping", ^{

    // given
    SLTPhoneAuthRequestDataManager *phoneAuthRequestData = [SLTPhoneAuthRequestDataManager new];

    NSString *statusStringWait = [phoneAuthRequestData statusWait];
    NSString *statusStringAccepted = [phoneAuthRequestData statusAccepted];

    NSInteger providerIdInteger = [phoneAuthRequestData providerIdInteger];
    NSString *providerIdString = [phoneAuthRequestData providerIdString];

    NSObject <SLPhoneAuthRequestMapperProtocol> *authRequestMapper = [SLPhoneAuthRequestMapper new];

    //
    it(@"mapping from nil dict", ^{

        NSDictionary *dict = nil;
        SLPhoneAuthRequest *request = [authRequestMapper mapPhoneAuthRequest:dict];

        expect(request).to.beNil();
    });

    it(@"mapping from empty dict", ^{

        NSDictionary *dict = @{};
        SLPhoneAuthRequest *request = [authRequestMapper mapPhoneAuthRequest:dict];

        expect(request).notTo.beNil();
    });
    
    it(@"mapping #1", ^{
        
        NSDictionary *dict = @{
                               kStatusKey: statusStringWait,
                               kProviderIdKey: @(providerIdInteger),
                               };
        
        SLPhoneAuthRequest *request = [authRequestMapper mapPhoneAuthRequest:dict];

        expect(request).notTo.beNil();
        expect(request.status).to.equal( @(SLPhoneAuthRequestWaitStatus) );
        expect(request.provider).to.equal( @(SLPhoneAuthRequestUnknownProvider) );
    });
    
    it(@"mapping #2", ^{
        
        NSDictionary *dict = @{
                               kStatusKey: statusStringAccepted,
                               kProviderIdKey: providerIdString,
                               };
        
        SLPhoneAuthRequest *request = [authRequestMapper mapPhoneAuthRequest:dict];
        
        expect(request).notTo.beNil();
        expect(request.status).to.equal( @(SLPhoneAuthRequestAcceptedStatus) );
        expect(request.provider).to.equal( @(SLPhoneAuthRequestSinchProvider) );
    });
    
    it(@"mapping from NSNull", ^{

        NSDictionary *dict = @{
                               kStatusKey: [NSNull null],
                               kProviderIdKey: [NSNull null],
                               };

        SLPhoneAuthRequest *request = [authRequestMapper mapPhoneAuthRequest:dict];

        expect(request).notTo.beNil();
    });
    
});

SpecEnd