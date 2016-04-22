//
//  SLUserParameters.m
//  Pods
//
//  Created by Mikhail on 07.03.16.
//
//

#import "SLUserParameters.h"

@implementation SLUserParameters

+ (NSArray <NSString *> *)mandatoryFields {
    return @[
             @"filterable",
             @"individual",
             @"publicVisible",
             @"publicWritable",
             ];
}

@end
