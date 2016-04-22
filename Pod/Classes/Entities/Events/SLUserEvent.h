//
//  SLUserEvent.h
//  Pods
//
//  Created by Mikhail on 09.03.16.
//
//

#import "SLEvent.h"
#import "SLUser.h"

@interface SLUserEvent :SLEvent

@property (nonatomic, strong) SLUser *user;

@end