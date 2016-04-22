//
//  SLPhoneAuthVerify.m
//  Pods
//
//  Created by Mikhail on 28.03.16.
//
//

#import "SLPhoneAuthVerify.h"

@implementation SLPhoneAuthVerify

+ (NSArray <NSString *> *)mandatoryFields {
    return @[
             @"me",
             //@"provider",
             //@"objectCount",
             @"authorization",
             @"additionalInfo",
             ];
}

@end
