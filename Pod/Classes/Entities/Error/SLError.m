//
//  SLError.m
//  Pods
//
//  Created by Mikhail on 12.02.16.
//
//

#import "SLError.h"

@implementation SLError

+ (NSArray <NSString *> *)mandatoryFields {
    return @[
             @"code",
             @"alias",
             @"userMessage",
             @"developerMessage",
             ];
}

@end
