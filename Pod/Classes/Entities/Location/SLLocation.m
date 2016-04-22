//
//  SLLocation.m
//  Pods
//
//  Created by Mikhail on 12.02.16.
//
//

#import "SLLocation.h"

@implementation SLLocation

+ (NSArray <NSString *> *)mandatoryFields {
    return @[
             @"latitude",
             @"longitude",
             ];
}

@end
