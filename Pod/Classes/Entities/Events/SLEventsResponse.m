//
//  SLEventsResponse.m
//  Pods
//
//  Created by Mikhail on 11.04.16.
//
//

#import "SLEventsResponse.h"

@implementation SLEventsResponse

+ (NSArray <NSString *> *)mandatoryFields {
    
    return @[
             //@"events",
             @"meta",
             @"additionalInfo",
             ];
}

@end
