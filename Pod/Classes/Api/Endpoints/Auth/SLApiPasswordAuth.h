//
//  SLApiPasswordAuth.h
//  Pods
//
//  Created by Mikhail on 22.04.16.
//
//

#import "SLApiAuth.h"
#import "SLPhoneAuthVerify.h"

@interface SLApiPasswordAuth :SLApiAuth

typedef void (^SLApiPasswordAuthRequest)(SLPhoneAuthVerify *_Nonnull responce);

// /auth/login/register
- (void)signUpWithLogin:(nonnull NSString *)login
               password:(nonnull NSString *)password
                success:(nullable SLApiPasswordAuthRequest)success
                failure:(nullable SLApiRequestFailure)failure;

// /auth/login/login
- (void)signInWithLogin:(nonnull NSString *)login
               password:(nonnull NSString *)password
                success:(nullable SLApiPasswordAuthRequest)success
                failure:(nullable SLApiRequestFailure)failure;

@end
