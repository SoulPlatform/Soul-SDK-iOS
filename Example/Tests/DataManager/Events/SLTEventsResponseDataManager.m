//
//  SLTEventsResponseDataManager.m
//  SoulSDK
//
//  Created by Mikhail on 11.04.16.
//  Copyright © 2016 Mikhail Shershnev. All rights reserved.
//

#import "SLTEventsResponseDataManager.h"

#import "SLTEventsDataManager.h"
#import "SLTAdditionalInfoDataManager.h"
#import "SLTPagingAfterMetaDataManager.h"

NSString *_Nonnull const kTEREventsKey = @"events";
NSString *_Nonnull const kTERInfoKey = @"additionalInfo";
NSString *_Nonnull const kTERMetaKey = @"_meta";

@implementation SLTEventsResponseDataManager

- (nonnull NSDictionary *)eventsResponse {

    return @{
             kTEREventsKey: [self events],
             kTERInfoKey: [self info],
             kTERMetaKey: [self meta],
             };
}

- (nonnull NSArray *)events {
    SLTEventsDataManager *eventsData = [SLTEventsDataManager new];

    return @[
             [eventsData meEvent],
             [eventsData userEvent],
             [eventsData chatEvent],
             [eventsData endpointEvent],
             [eventsData reactionsEvent],
             ];
}

- (nonnull NSDictionary *)meta {
    SLTPagingAfterMetaDataManager *metaData = [SLTPagingAfterMetaDataManager new];
    return [metaData meta];
}

- (nonnull NSDictionary *)info {
    SLTAdditionalInfoDataManager *infoData = [SLTAdditionalInfoDataManager new];
    return [infoData additionalInfo];
}

@end
