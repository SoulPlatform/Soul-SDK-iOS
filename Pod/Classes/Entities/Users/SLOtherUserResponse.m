//
//  SLOtherUserResponse.m
//  Pods
//
//  Created by Mikhail on 06.04.16.
//
//

#import "SLOtherUserResponse.h"

@implementation SLOtherUserResponse

+ (NSArray <NSString *> *)mandatoryFields {

    return @[
             @"user",
             @"additionalInfo",
             ];
}

@end
