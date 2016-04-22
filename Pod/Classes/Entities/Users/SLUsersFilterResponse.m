//
//  SLUsersFilterResponse.m
//  Pods
//
//  Created by Mikhail on 05.04.16.
//
//

#import "SLUsersFilterResponse.h"

@implementation SLUsersFilterResponse

+ (NSArray <NSString *> *)mandatoryFields {
    return @[
             //@"meta",
             @"users",
             @"additionalInfo",
             ];
}


@end
