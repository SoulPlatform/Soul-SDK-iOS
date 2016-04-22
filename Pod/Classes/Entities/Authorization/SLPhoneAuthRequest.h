//
//  SLPhoneAuthRequest.h
//  Pods
//
//  Created by Mikhail on 01.03.16.
//
//

#import "SLObject.h"

typedef NS_ENUM(NSInteger, SLPhoneAuthRequestStatus) {
    SLPhoneAuthRequestUnknownStatus = 0,
    SLPhoneAuthRequestWaitStatus,
    SLPhoneAuthRequestAcceptedStatus,
};

typedef NS_ENUM(NSInteger, SLPhoneAuthRequestProvider) {
    SLPhoneAuthRequestUnknownProvider = 0,
    SLPhoneAuthRequestSinchProvider = 1,
};

@interface SLPhoneAuthRequest :SLObject

@property (nonatomic, assign) SLPhoneAuthRequestStatus status; // SLPhoneAuthRequestStatus
@property (nonatomic, assign) SLPhoneAuthRequestProvider provider; // SLPhoneAuthRequestProvider

@end