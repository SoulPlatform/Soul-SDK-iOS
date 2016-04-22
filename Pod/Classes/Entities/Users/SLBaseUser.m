//
//  SLBaseUser.m
//  Pods
//
//  Created by Mikhail on 08.03.16.
//
//

#import "SLBaseUser.h"

@implementation SLBaseUser

+ (NSArray <NSString *> *)mandatoryFields {
    return @[
             @"userId",
             @"parameters",
             @"albums",
             ];
}

@end
