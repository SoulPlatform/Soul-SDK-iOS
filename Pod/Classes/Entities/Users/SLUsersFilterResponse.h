//
//  SLUsersFilterResponse.h
//  Pods
//
//  Created by Mikhail on 05.04.16.
//
//

#import "SLObject.h"

#import "SLUser.h"
#import "SLAdditionalInfo.h"
#import "SLPagingAfterMeta.h"

@interface SLUsersFilterResponse :SLObject

@property (nonatomic, strong) SLPagingAfterMeta *meta;
@property (nonatomic, strong) NSArray <SLUser *> *users;
@property (nonatomic, strong) SLAdditionalInfo *additionalInfo;

@end