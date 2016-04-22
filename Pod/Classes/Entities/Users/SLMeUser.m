//
//  SLMeUser.m
//  Pods
//
//  Created by Mikhail on 08.03.16.
//
//

#import "SLMeUser.h"

@implementation SLMeUser

+ (NSArray <NSString *> *)mandatoryFields {

    NSArray *mandatoryFields = [super mandatoryFields];
    NSArray *_mandatoryFields = @[
                                  @"notificationTokens",
                                  @"subscriptionServices",
                                  ];

    return [mandatoryFields arrayByAddingObjectsFromArray:_mandatoryFields];
}

@end
