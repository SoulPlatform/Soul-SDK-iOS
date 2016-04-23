//
//  SLApiPhoneAuth.h
//  Pods
//
//  Created by Mikhail on 18.03.16.
//
//

#import "SLApiAuth.h"
#import "SLHTTPRequest.h"

#import "SLError.h"
#import "SLPhoneAuthRequest.h"
#import "SLPhoneAuthVerify.h"

typedef NS_ENUM(NSInteger, SLAuthMethod) {
    SLAuthMethodUnknown = 0,
    SLAuthMethodSMS,
};

@interface SLApiPhoneAuth :SLApiAuth

typedef void (^SLApiPhoneAuthRequest)(SLPhoneAuthRequest *_Nonnull responce);
typedef void (^SLApiPhoneAuthLogin)(SLPhoneAuthVerify *_Nonnull responce);

// auth/phone/request
- (void)getCode:(nonnull NSString *)phoneNumber
        success:(nullable SLApiPhoneAuthRequest)success
        failure:(nullable SLApiRequestFailure)failure;

// auth/phone/verify
- (void)verify:(nonnull NSString *)phoneNumber
          code:(nonnull NSString *)code
       success:(nullable SLApiPhoneAuthLogin)success
       failure:(nullable SLApiRequestFailure)failure;

// auth/phone/login
- (void)refreshToken:(nonnull NSString *)accessToken
         phoneNumber:(nonnull NSString *)phoneNumber
                code:(nonnull NSString *)code
             success:(nullable SLApiPhoneAuthLogin)success
             failure:(nullable SLApiRequestFailure)failure;

@end
