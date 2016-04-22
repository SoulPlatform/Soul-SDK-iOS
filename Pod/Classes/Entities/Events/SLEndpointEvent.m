//
//  SLEndpointEvent.m
//  Pods
//
//  Created by Mikhail on 16.03.16.
//
//

#import "SLEndpointEvent.h"

@implementation SLEndpointEvent

+ (NSArray <NSString *> *)mandatoryFields {

    NSArray *mandatoryFields = [super mandatoryFields];
    NSArray *_mandatoryFields = @[
                                  @"endpoint",
                                  ];

    return [mandatoryFields arrayByAddingObjectsFromArray:_mandatoryFields];
}

@end
