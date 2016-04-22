//
//  SLReactions.h
//  Pods
//
//  Created by Mikhail on 08.03.16.
//
//

#import "SLObject.h"
#import "SLReaction.h"

@interface SLReactions :SLObject

@property (nonatomic, strong) NSArray <SLReaction *> *sentByMe;
@property (nonatomic, strong) NSArray <SLReaction *> *receivedFromUser;

@end