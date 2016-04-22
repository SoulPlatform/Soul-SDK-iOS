//
//  SLPagingAfterMeta.m
//  Pods
//
//  Created by Mikhail on 07.03.16.
//
//

#import "SLPagingAfterMeta.h"

@implementation SLPagingAfterMeta

+ (NSArray <NSString *> *)mandatoryFields {
    return @[
             @"after",
             @"limit",
             @"total",
             ];
}

@end
