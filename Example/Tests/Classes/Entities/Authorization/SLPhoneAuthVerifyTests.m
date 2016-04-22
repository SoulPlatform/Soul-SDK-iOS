//
//  SLPhoneAuthVerifyTests.m
//  SoulSDK
//
//  Created by Mikhail on 28.03.16.
//  Copyright © 2016 Mikhail Shershnev. All rights reserved.
//

#import "SLTPhoneAuthVerifyDataManager.h"

SpecBegin(SLPhoneAuthVerify)

describe(@"phone auth verify object mapping", ^{

    // given
    SLTPhoneAuthVerifyDataManager *phoneAuthVerifyData = [SLTPhoneAuthVerifyDataManager new];

    NSNumber *providerId = [phoneAuthVerifyData providerId];
    NSDictionary *phoneAuthVerifyDit = [phoneAuthVerifyData phoneAuthVerify];

    NSObject <SLPhoneAuthVerifyMapperProtocol> *mapper = [SLPhoneAuthVerifyMapper new];

    //
    it(@"mapping from nil dict", ^{

        NSDictionary *dict = nil;
        SLPhoneAuthVerify *verify = [mapper mapPhoneAuthVerify:dict];

        expect(verify).to.beNil();
    });

    it(@"mapping from empty dict", ^{

        NSDictionary *dict = @{};
        SLPhoneAuthVerify *verify = [mapper mapPhoneAuthVerify:dict];

        expect(verify).to.beNil();
    });

    it(@"normal mapping", ^{

        NSDictionary *dict = phoneAuthVerifyDit;
        SLPhoneAuthVerify *verify = [mapper mapPhoneAuthVerify:dict];

        expect(verify).notTo.beNil();
        expect(verify.provider).to.equal(providerId);
        expect(verify.me).notTo.beNil();
        expect(verify.objectCount).notTo.beNil();
        expect(verify.authorization).notTo.beNil();
        expect(verify.additionalInfo).notTo.beNil();
    });

    it(@"mapping from NSNull", ^{

        NSDictionary *dict = @{
                               kMeKey: [NSNull null],
                               kProviderKey: [NSNull null],
                               kObjectCountKey: [NSNull null],
                               kAuthorizationKey: [NSNull null],
                               kAdditionalInfoKey: [NSNull null],
                               };

        SLPhoneAuthVerify *verify = [mapper mapPhoneAuthVerify:dict];

        expect(verify).to.beNil();
    });

});

SpecEnd