//
//  SLUserEvent.m
//  Pods
//
//  Created by Mikhail on 09.03.16.
//
//

#import "SLUserEvent.h"

@implementation SLUserEvent

+ (NSArray <NSString *> *)mandatoryFields {

    NSArray *mandatoryFields = [super mandatoryFields];
    NSArray *_mandatoryFields = @[
                                  @"user",
                                  ];

    return [mandatoryFields arrayByAddingObjectsFromArray:_mandatoryFields];
}

@end
