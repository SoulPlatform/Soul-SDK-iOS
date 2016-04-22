//
//  SLMeUserResponse.m
//  Pods
//
//  Created by Mikhail on 09.03.16.
//
//

#import "SLMeUserResponse.h"

@implementation SLMeUserResponse

+ (NSArray <NSString *> *)mandatoryFields {
    return @[
             @"me",
             @"additionalInfo",
             ];
}

@end
