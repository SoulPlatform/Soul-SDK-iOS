//
//  SLReaction.m
//  Pods
//
//  Created by Mikhail on 08.03.16.
//
//

#import "SLReaction.h"

@implementation SLReaction

+ (NSArray <NSString *> *)mandatoryFields {
    
    return @[
             //@"type",
             @"value",
             @"expiresTime"
             ];
}

@end
