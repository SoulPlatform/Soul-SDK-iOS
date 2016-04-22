//
//  SLErrorTests.m
//  SoulSDK
//
//  Created by Mikhail on 12.02.16.
//  Copyright © 2016 Mikhail Shershnev. All rights reserved.
//

#import "SLTErrorDataManager.h"

SpecBegin(SLError)

describe(@"error mapping", ^{

    // given
    SLTErrorDataManager *errorData = [SLTErrorDataManager new];

    NSInteger codePositiveInteger = [errorData codePositiveInteger];
    NSInteger codeNegativeInteger = [errorData codeNegativeInteger];

    NSString *codePositiveString = [errorData codePositiveString];
    NSString *codeNegativeString = [errorData codeNegativeString];

    NSString *aliasString = [errorData alias];
    NSString *userMessageString = [errorData userMessage];
    NSString *developerMessageString = [errorData developerMessage];

    SLErrorMapper *mapper = [SLErrorMapper new];

    it(@"mapping from nil dict", ^{

        NSDictionary *dict = nil;
        SLError *error = [mapper mapError:dict];

        expect(error).to.beNil();
    });

    it(@"mapping from empty dict", ^{
        
        NSDictionary *dict = @{};
        SLError *error = [mapper mapError:dict];

        expect(error).to.beNil();
    });

    it(@"mapping from eligible dict", ^{

        NSDictionary *dict = @{
                               kAliaseKey: aliasString,
                               kUserMessage: userMessageString,
                               kDeveloperMessage: developerMessageString,
                               };

        SLError *error = [mapper mapError:dict];

        expect(error).notTo.beNil();
    });

    it(@"code from positive integer", ^{

        NSDictionary *dict = @{
                               kCodeKey: @(codePositiveInteger),
                               kAliaseKey: aliasString,
                               kUserMessage: userMessageString,
                               kDeveloperMessage: developerMessageString,
                               };

        SLError *error = [mapper mapError:dict];

        expect(error).notTo.beNil();
        expect(error.code).to.equal(codePositiveInteger);
    });

    it(@"code from negative integer", ^{

        NSDictionary *dict = @{
                               kCodeKey: @(codeNegativeInteger),
                               kAliaseKey: aliasString,
                               kUserMessage: userMessageString,
                               kDeveloperMessage: developerMessageString,
                               };

        SLError *error = [mapper mapError:dict];

        expect(error).notTo.beNil();
        expect(error.code).to.equal(codeNegativeInteger);
    });

    it(@"code from string with positive int", ^{

        NSDictionary *dict = @{
                               kCodeKey: codePositiveString,
                               kAliaseKey: aliasString,
                               kUserMessage: userMessageString,
                               kDeveloperMessage: developerMessageString,
                               };

        SLError *error = [mapper mapError:dict];

        expect(error).notTo.beNil();
        expect(error.code).to.equal(codePositiveInteger);
    });

    it(@"code from string with positive int", ^{

        NSDictionary *dict = @{
                               kCodeKey: codeNegativeString,
                               kAliaseKey: aliasString,
                               kUserMessage: userMessageString,
                               kDeveloperMessage: developerMessageString,
                               };

        SLError *error = [mapper mapError:dict];

        expect(error).notTo.beNil();
        expect(error.code).to.equal(codeNegativeInteger);
    });

    it(@"code from BOOL", ^{

        NSDictionary *dict = @{
                               kCodeKey: @(YES),
                               kAliaseKey: aliasString,
                               kUserMessage: userMessageString,
                               kDeveloperMessage: developerMessageString,
                               };

        SLError *error = [mapper mapError:dict];

        expect(error).notTo.beNil();
        expect(error.code).to.equal(1);
    });

    it(@"code from NSNull", ^{

        NSDictionary *dict = @{
                               kCodeKey: [NSNull null],
                               kAliaseKey: aliasString,
                               kUserMessage: userMessageString,
                               kDeveloperMessage: developerMessageString,
                               };

        SLError *error = [mapper mapError:dict];

        expect(error).notTo.beNil();
        expect(error.code).to.beFalsy();
    });

});

SpecEnd