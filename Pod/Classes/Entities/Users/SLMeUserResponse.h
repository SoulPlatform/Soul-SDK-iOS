//
//  SLMeUserResponse.h
//  Pods
//
//  Created by Mikhail on 09.03.16.
//
//

#import "SLObject.h"

#import "SLMeUser.h"
#import "SLAdditionalInfo.h"

@interface SLMeUserResponse :SLObject

@property (nonatomic, strong) SLMeUser *me;
@property (nonatomic, strong) SLAdditionalInfo *additionalInfo;

@end