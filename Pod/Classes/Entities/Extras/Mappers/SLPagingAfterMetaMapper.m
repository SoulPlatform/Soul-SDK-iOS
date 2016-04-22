//
//  SLPagingAfterMetaMapper.m
//  Pods
//
//  Created by Mikhail on 07.03.16.
//
//

#import "SLPagingAfterMetaMapper.h"

static NSString *const kAfterKey = @"after";
static NSString *const kAfterProp = @"after";

static NSString *const kLimitKey = @"limit";
static NSString *const kLimitProp = @"limit";

static NSString *const kTotalKey = @"total";
static NSString *const kTotalProp = @"total";

@implementation SLPagingAfterMetaMapper

+ (EKObjectMapping *)objectMapping {

    EKObjectMapping *mapper = [[EKObjectMapping alloc] initWithObjectClass:[SLPagingAfterMeta class]];

    EKMappingValueBlock integerBlock = [self integerValueBlock];

    [mapper mapKeyPath:kAfterKey toProperty:kAfterProp withValueBlock:integerBlock];
    [mapper mapKeyPath:kLimitKey toProperty:kLimitProp withValueBlock:integerBlock];
    [mapper mapKeyPath:kTotalKey toProperty:kTotalProp withValueBlock:integerBlock];

    return mapper;
}

- (SLPagingAfterMeta *)mapAfterMeta:(id)dict {
    SLPagingAfterMeta *meta = [self map:dict];
    return meta;
}

@end
