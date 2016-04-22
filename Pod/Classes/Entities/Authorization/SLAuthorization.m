//
//  SLAuthorization.m
//  Pods
//
//  Created by Mikhail on 12.02.16.
//
//

#import "SLAuthorization.h"

@implementation SLAuthorization

+ (NSArray <NSString *> *)mandatoryFields {
    return @[
             @"expiresTime",
             @"sessionToken",
             ];
}

@end
