//
//  SLReactionsEvent.h
//  Pods
//
//  Created by Mikhail on 16.03.16.
//
//

#import "SLEvent.h"
#import "SLEventReactions.h"

@interface SLReactionsEvent :SLEvent

@property (nonatomic, strong) SLEventReactions *reactions;

@end