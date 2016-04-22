//
//  SLApiPasswordAuth.m
//  Pods
//
//  Created by Mikhail on 22.04.16.
//
//

#import "SLApiPasswordAuth.h"
#import "SLPhoneAuthVerifyMapper.h"

static NSString *const kLoginKey = @"login";
static NSString *const kPasswordKey = @"passwd";
static NSString *const kApiKeyKey = @"apiKey";

static NSString *const kSignUpEndpoint = @"/auth/login/register";
static NSString *const kSignInEndpoint = @"/auth/login/login";

@implementation SLApiPasswordAuth

// /auth/login/register
- (void)signUpWithLogin:(nonnull NSString *)login
               password:(nonnull NSString *)password
                success:(nullable SLApiPasswordAuthRequest)success
                failure:(nullable SLApiRequestFailure)failure {

    [self _authWithEndpoint:kSignUpEndpoint login:login password:password success:success failure:failure];
}

// /auth/login/login
- (void)signInWithLogin:(nonnull NSString *)login
               password:(nonnull NSString *)password
                success:(nullable SLApiPasswordAuthRequest)success
                failure:(nullable SLApiRequestFailure)failure {
    [self _authWithEndpoint:kSignInEndpoint login:login password:password success:success failure:failure];
}

- (void)_authWithEndpoint:(nonnull NSString *)endpoint
                    login:(nonnull NSString *)login
                 password:(nonnull NSString *)password
                  success:(nullable SLApiPasswordAuthRequest)success
                  failure:(nullable SLApiRequestFailure)failure {

    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params forKey:kLoginKey setValue:login];
    [params forKey:kPasswordKey setValue:password];
    [params forKey:kApiKeyKey setValue:self.config.apiKey];

    NSString *uri = [self uriFrom:endpoint];

    [self POST:uri isSecure:NO params:params success:^(SLResponse *_Nonnull response) {

        NSObject <SLPhoneAuthVerifyMapperProtocol> *authVerifyMapper = [SLPhoneAuthVerifyMapper new];
        SLPhoneAuthVerify *authVerify = [authVerifyMapper mapPhoneAuthVerify:response.dict];

        if (authVerify) {
            self.storage.userId = authVerify.me.userId;
            self.storage.sessionToken = authVerify.authorization.sessionToken;
        }

        if (success) {
             success(authVerify);
        }

    } failure:failure];
}

@end
