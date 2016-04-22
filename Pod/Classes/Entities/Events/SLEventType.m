//
//  SLEventType.m
//  Pods
//
//  Created by Mikhail on 09.03.16.
//
//

#import "SLEventType.h"

@implementation SLEventType

+ (NSArray <NSString *> *)mandatoryFields {
    return @[
             @"action",
             @"object",
             ];
}

@end
