//
//  SLAdditionalInfoMapper.m
//  Pods
//
//  Created by Mikhail on 04.02.16.
//
//

#import "SLAdditionalInfoMapper.h"

static NSString *const kServerTimeKey = @"serverTime";
static NSString *const kServerTimeProperty = @"serverTime";

@implementation SLAdditionalInfoMapper

+ (EKObjectMapping *)objectMapping {

    EKObjectMapping *mapper = [[EKObjectMapping alloc] initWithObjectClass:[SLAdditionalInfo class]];

    EKMappingValueBlock doubleBlock = [self doubleValueBlock];
    [mapper mapKeyPath:kServerTimeKey toProperty:kServerTimeProperty withValueBlock:doubleBlock];

    return mapper;
}

- (SLAdditionalInfo *)mapAdditionalInfo:(id)dict {
    return [self map:dict];
}

@end
