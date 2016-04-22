//
//  SLUser.h
//  Pods
//
//  Created by Mikhail on 08.03.16.
//
//

#import "SLBaseUser.h"
#import "SLChat.h"
#import "SLReactions.h"

@interface SLUser :SLBaseUser

@property (nonatomic, strong) SLChat *chat;
@property (nonatomic, strong) SLReactions *reactions;

@end