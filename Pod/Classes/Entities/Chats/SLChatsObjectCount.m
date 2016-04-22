//
//  SLChatsObjectCount.m
//  Pods
//
//  Created by Mikhail on 26.02.16.
//
//

#import "SLChatsObjectCount.h"

@implementation SLChatsObjectCount

+ (NSArray <NSString *> *)mandatoryFields {
    return @[
             @"notDeletedByMe",
             @"notDeletedByAnyone",
             @"notExpiredAndNotDeletedByAnyone",
             ];
}

@end
