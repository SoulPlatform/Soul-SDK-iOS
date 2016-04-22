//
//  SLEventReactions.h
//  Pods
//
//  Created by Mikhail on 16.03.16.
//
//

#import "SLObject.h"
#import "SLReactions.h"
#import "SLEventReactionsUser.h"

@interface SLEventReactions :SLObject

@property (nonatomic, strong) SLReactions *received;
@property (nonatomic, strong) SLEventReactionsUser *user;

@end