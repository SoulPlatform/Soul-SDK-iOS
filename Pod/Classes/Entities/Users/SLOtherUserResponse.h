//
//  SLOtherUserResponse.h
//  Pods
//
//  Created by Mikhail on 06.04.16.
//
//

#import "SLObject.h"

#import "SLUser.h"
#import "SLAdditionalInfo.h"

@interface SLOtherUserResponse :SLObject

@property (nonatomic, strong) SLUser *user;
@property (nonatomic, strong) SLAdditionalInfo *additionalInfo;

@end