//
//  SLMeEvent.h
//  Pods
//
//  Created by Mikhail on 09.03.16.
//
//

#import "SLEvent.h"
#import "SLMeUser.h"

@interface SLMeEvent :SLEvent

@property (nonatomic, strong) SLMeUser *me;

@end