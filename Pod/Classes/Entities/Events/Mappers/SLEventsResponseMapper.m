//
//  SLEventsResponseMapper.m
//  Pods
//
//  Created by Mikhail on 11.04.16.
//
//

#import "SLEventsResponseMapper.h"

#import "SLEventMapper.h"
#import "SLAdditionalInfoMapper.h"
#import "SLPagingAfterMetaMapper.h"

static NSString *const kEventsKey = @"events";
//static NSString *const kEventsProp = @"events";

static NSString *const kMetaKey = @"_meta";
static NSString *const kMetaProp = @"meta";

static NSString *const kInfoKey = @"additionalInfo";
static NSString *const kInfoProp = @"additionalInfo";

@implementation SLEventsResponseMapper

+ (EKObjectMapping *)objectMapping {

    EKObjectMapping *mapper = [[EKObjectMapping alloc] initWithObjectClass:[SLEventsResponse class]];

    Class infoClass = [SLAdditionalInfoMapper class];
    [mapper hasOne:infoClass forKeyPath:kInfoKey forProperty:kInfoProp];

    Class metaClass = [SLPagingAfterMetaMapper class];
    [mapper hasOne:metaClass forKeyPath:kMetaKey forProperty:kMetaProp];

    return mapper;
}

- (SLEventsResponse *)mapEventsResponse:(id)dict {

    SLEventsResponse *eventsResponse = [self map:dict];

    SLEventMapper *mapper = [SLEventMapper new];
    NSMutableArray *events = [NSMutableArray new];

    for (NSDictionary *eventDict in dict[kEventsKey]) {
        SLEvent *event = [mapper mapEvent:eventDict];
        [events addObject:event];
    }
    eventsResponse.events = events;

    return eventsResponse;
}

@end