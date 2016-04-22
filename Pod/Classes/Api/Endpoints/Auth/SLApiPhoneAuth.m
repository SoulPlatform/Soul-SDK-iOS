//
//  SLApiPhoneAuth.m
//  Pods
//
//  Created by Mikhail on 18.03.16.
//
//

#import "SLApiPhoneAuth.h"
#import "SLPhoneAuthRequestMapper.h"
#import "SLPhoneAuthVerifyMapper.h"

@interface SLApiPhoneAuth ()
@end

static NSString *const kApiKeyKey = @"apiKey";
static NSString *const kPhoneKey = @"phoneNumber";

static NSString *const kMethodKey = @"method";
static NSString *const kCodeKey = @"code";
static NSString *const kAccessTokenKey = @"lastSessionToken";

static NSString *const kRequestEndpoint = @"/auth/phone/request";
static NSString *const kVerifyEndpoint = @"/auth/phone/verify";
static NSString *const kLoginEndpoint = @"/auth/phone/login";

@implementation SLApiPhoneAuth

- (nonnull NSString *)stringAtMethod:(SLAuthMethod)method {

    NSDictionary *methodDict = @{
                                   @(SLAuthMethodSMS) : @"sms",
                                   };

    NSString *methodString = methodDict[ @(method) ];
    if (methodString == nil) {
        methodString = @"";
    }

    return methodString;
}

- (void)getCode:(nonnull NSString *)phoneNumber
        success:(nullable SLApiPhoneAuthRequest)success
        failure:(nullable SLApiRequestFailure)failure {

    SLAuthMethod method = SLAuthMethodSMS;
    NSString *methodString = [self stringAtMethod:method];

    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params forKey:kMethodKey setValue:methodString];
    [params forKey:kPhoneKey setValue:phoneNumber];
    [params forKey:kApiKeyKey setValue:self.config.apiKey];

    NSString *uri = [self uriFrom:kRequestEndpoint];

    [self POST:uri isSecure:NO params:params success:^(SLResponse *_Nonnull response) {

        if (success) {

            NSObject <SLPhoneAuthRequestMapperProtocol> *authRequestMapper = [SLPhoneAuthRequestMapper new];
            SLPhoneAuthRequest *authRequest = [authRequestMapper mapPhoneAuthRequest:response.dict];

            success(authRequest);
        }

    } failure:failure];
}

- (void)verify:(nonnull NSString *)phoneNumber
          code:(nonnull NSString *)code
       success:(nullable SLApiPhoneAuthLogin)success
       failure:(nullable SLApiRequestFailure)failure {

    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params forKey:kCodeKey setValue:code];
    [params forKey:kPhoneKey setValue:phoneNumber];
    [params forKey:kApiKeyKey setValue:self.config.apiKey];

    NSString *uri = [self uriFrom:kVerifyEndpoint];

    [self POST:uri isSecure:NO params:params success:^(SLResponse *_Nonnull response) {

        if (success) {

            NSObject <SLPhoneAuthVerifyMapperProtocol> *authVerifyMapper = [SLPhoneAuthVerifyMapper new];
            SLPhoneAuthVerify *authVerify = [authVerifyMapper mapPhoneAuthVerify:response.dict];

            if (authVerify) {

                self.storage.userId = authVerify.me.userId;
                self.storage.sessionToken = authVerify.authorization.sessionToken;

                self.storage.phoneNumber = phoneNumber;
                self.storage.verification = code;
            }
            success(authVerify);
        }

    } failure:failure];
}

- (void)refreshToken:(nonnull NSString *)accessToken
         phoneNumber:(nonnull NSString *)phoneNumber
                code:(nonnull NSString *)code
             success:(nullable SLApiPhoneAuthLogin)success
             failure:(nullable SLApiRequestFailure)failure {

    NSMutableDictionary *params = [NSMutableDictionary dictionary];

    [params forKey:kCodeKey setValue:code];
    [params forKey:kAccessTokenKey setValue:accessToken];
    [params forKey:kPhoneKey setValue:phoneNumber];
    [params forKey:kApiKeyKey setValue:self.config.apiKey];

    NSString *uri = [self uriFrom:kLoginEndpoint];

    [self POST:uri isSecure:NO params:params success:^(SLResponse *_Nonnull response) {

        if (success) {

            NSObject <SLPhoneAuthVerifyMapperProtocol> *authVerifyMapper = [SLPhoneAuthVerifyMapper new];
            SLPhoneAuthVerify *authVerify = [authVerifyMapper mapPhoneAuthVerify:response.dict];

            success(authVerify);
        }

    } failure:failure];
}

@end
