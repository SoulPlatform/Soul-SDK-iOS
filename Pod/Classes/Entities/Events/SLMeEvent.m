//
//  SLMeEvent.m
//  Pods
//
//  Created by Mikhail on 09.03.16.
//
//

#import "SLMeEvent.h"

@implementation SLMeEvent

+ (NSArray <NSString *> *)mandatoryFields {

    NSArray *mandatoryFields = [super mandatoryFields];
    NSArray *_mandatoryFields = @[
                                  @"me",
                                  ];

    return [mandatoryFields arrayByAddingObjectsFromArray:_mandatoryFields];
}

@end
