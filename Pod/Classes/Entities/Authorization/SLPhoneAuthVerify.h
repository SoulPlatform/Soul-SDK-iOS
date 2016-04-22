//
//  SLPhoneAuthVerify.h
//  Pods
//
//  Created by Mikhail on 28.03.16.
//
//

#import "SLObject.h"
#import "SLMeUser.h"
#import "SLObjectCount.h"
#import "SLAuthorization.h"
#import "SLAdditionalInfo.h"
#import "SLPhoneAuthRequest.h"

@interface SLPhoneAuthVerify :SLObject

@property (nonatomic, strong) SLMeUser *me;
@property (nonatomic, strong) SLObjectCount *objectCount;
@property (nonatomic, strong) SLAuthorization *authorization;
@property (nonatomic, strong) SLAdditionalInfo *additionalInfo;
@property (nonatomic, assign) SLPhoneAuthRequestProvider provider;

@end
