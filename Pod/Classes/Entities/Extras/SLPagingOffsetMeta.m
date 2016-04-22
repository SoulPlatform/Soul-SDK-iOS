//
//  SLPagingOffsetMeta.m
//  Pods
//
//  Created by Mikhail on 07.03.16.
//
//

#import "SLPagingOffsetMeta.h"

@implementation SLPagingOffsetMeta

+ (NSArray <NSString *> *)mandatoryFields {
    return @[
             @"offset",
             @"limit",
             @"total",
             ];
}

@end
