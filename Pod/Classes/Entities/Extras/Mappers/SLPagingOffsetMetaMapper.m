//
//  SLPagingOffsetMetaMapper.m
//  Pods
//
//  Created by Mikhail on 07.03.16.
//
//

#import "SLPagingOffsetMetaMapper.h"

static NSString *const kOffsetKey = @"offset";
static NSString *const kOffsetProp = @"offset";

static NSString *const kLimitKey = @"limit";
static NSString *const kLimitProp = @"limit";

static NSString *const kTotalKey = @"total";
static NSString *const kTotalProp = @"total";

@implementation SLPagingOffsetMetaMapper

+ (EKObjectMapping *)objectMapping {

    EKObjectMapping *mapper = [[EKObjectMapping alloc] initWithObjectClass:[SLPagingOffsetMeta class]];

    EKMappingValueBlock integerBlock = [self integerValueBlock];

    [mapper mapKeyPath:kOffsetKey toProperty:kOffsetProp withValueBlock:integerBlock];
    [mapper mapKeyPath:kLimitKey toProperty:kLimitProp withValueBlock:integerBlock];
    [mapper mapKeyPath:kTotalKey toProperty:kTotalProp withValueBlock:integerBlock];

    return mapper;
}

- (SLPagingOffsetMeta *)mapOffsetMeta:(id)dict {
    SLPagingOffsetMeta *meta = [self map:dict];
    return meta;
}

@end
