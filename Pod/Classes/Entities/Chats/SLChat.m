//
//  SLChat.m
//  Pods
//
//  Created by Mikhail on 01.03.16.
//
//

#import "SLChat.h"

@implementation SLChat

+ (NSArray <NSString *> *)mandatoryFields {

    return @[
             @"chatId",
             @"partnerId",
             @"channelName",
             @"expiresTime",
             @"deletedByMe",
             @"deletedByPartner",
             ];
}

@end
