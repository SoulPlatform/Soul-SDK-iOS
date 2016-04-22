//
//  SLUserRecsMeta.m
//  Pods
//
//  Created by Mikhail on 06.03.16.
//
//

#import "SLUserRecsMeta.h"

@implementation SLUserRecsMeta

+ (NSArray <NSString *> *)mandatoryFields {
    return @[
             @"sessionName",
             @"uniqueToken",
             ];
}

@end
