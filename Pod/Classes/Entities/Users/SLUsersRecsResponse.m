//
//  SLUsersRecsResponse.m
//  Pods
//
//  Created by Mikhail on 05.04.16.
//
//

#import "SLUsersRecsResponse.h"

@implementation SLUsersRecsResponse

+ (NSArray <NSString *> *)mandatoryFields {
    return @[
             //@"meta",
             @"users",
             @"additionalInfo",
             ];
}

@end
