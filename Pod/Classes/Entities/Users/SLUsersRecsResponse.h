//
//  SLUsersRecsResponse.h
//  Pods
//
//  Created by Mikhail on 05.04.16.
//
//

#import "SLObject.h"

#import "SLUser.h"
#import "SLUserRecsMeta.h"
#import "SLAdditionalInfo.h"

@interface SLUsersRecsResponse :SLObject

@property (nonatomic, strong) SLUserRecsMeta *meta;
@property (nonatomic, strong) NSArray <SLUser *> *users;
@property (nonatomic, strong) SLAdditionalInfo *additionalInfo;

@end