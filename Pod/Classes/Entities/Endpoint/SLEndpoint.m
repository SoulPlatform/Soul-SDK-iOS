//
//  SLEndpoint.m
//  Pods
//
//  Created by Mikhail on 16.03.16.
//
//

#import "SLEndpoint.h"

@implementation SLEndpoint

+ (NSArray <NSString *> *)mandatoryFields {
    
    return @[
             @"uri",
             @"type",
             ];
}

@end
