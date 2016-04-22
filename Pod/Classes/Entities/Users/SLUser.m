//
//  SLUser.m
//  Pods
//
//  Created by Mikhail on 08.03.16.
//
//

#import "SLUser.h"

@implementation SLUser

+ (NSArray <NSString *> *)mandatoryFields {

    NSArray *mandatoryFields = [super mandatoryFields];
    NSArray *_mandatoryFields = @[
                                  //@"chat" is not required
                                  @"reactions",
                                  ];

    return [mandatoryFields arrayByAddingObjectsFromArray:_mandatoryFields];
}

@end
