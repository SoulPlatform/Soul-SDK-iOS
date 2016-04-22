//
//  SLChatEvent.m
//  Pods
//
//  Created by Mikhail on 09.03.16.
//
//

#import "SLChatEvent.h"

@implementation SLChatEvent

+ (NSArray <NSString *> *)mandatoryFields {

    NSArray *mandatoryFields = [super mandatoryFields];
    NSArray *_mandatoryFields = @[
                                  @"chat",
                                  ];

    return [mandatoryFields arrayByAddingObjectsFromArray:_mandatoryFields];
}

@end
