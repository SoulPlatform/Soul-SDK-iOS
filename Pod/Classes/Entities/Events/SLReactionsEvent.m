//
//  SLReactionsEvent.m
//  Pods
//
//  Created by Mikhail on 16.03.16.
//
//

#import "SLReactionsEvent.h"

@implementation SLReactionsEvent

+ (NSArray <NSString *> *)mandatoryFields {

    NSArray *mandatoryFields = [super mandatoryFields];
    NSArray *_mandatoryFields = @[
                                  @"reactions",
                                  ];

    return [mandatoryFields arrayByAddingObjectsFromArray:_mandatoryFields];
}

@end
