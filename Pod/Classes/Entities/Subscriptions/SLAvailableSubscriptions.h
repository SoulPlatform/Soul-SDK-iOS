//
//  SLAvailableSubscriptions.h
//  Pods
//
//  Created by Mikhail on 29.02.16.
//
//

#import "SLObject.h"
#import "SLAvailableSubscription.h"

@interface SLAvailableSubscriptions :SLObject

@property (nonatomic, strong) NSArray <SLAvailableSubscription *> *items;

@end