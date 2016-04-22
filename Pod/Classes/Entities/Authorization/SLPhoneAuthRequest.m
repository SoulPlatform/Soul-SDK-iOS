//
//  SLPhoneAuthRequest.m
//  Pods
//
//  Created by Mikhail on 01.03.16.
//
//

#import "SLPhoneAuthRequest.h"

@implementation SLPhoneAuthRequest

+ (NSArray <NSString *> *)mandatoryFields {
    return @[
             @"status",
             @"provider",
             ];
}

@end
