//
//  SLEvent.m
//  Pods
//
//  Created by Mikhail on 09.03.16.
//
//

#import "SLEvent.h"

@implementation SLEvent

+ (NSArray <NSString *> *)mandatoryFields {
    return @[
             @"recordId",
             @"time",
             @"type",
             ];
}

@end
