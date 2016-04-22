//
//  SLLocationMapper.m
//  Pods
//
//  Created by Mikhail on 12.02.16.
//
//

#import "SLLocationMapper.h"

// latitude
static NSString *const kLatitudeKey = @"lat";
static NSString *const kLatitudeProperty = @"latitude";

// longitude
static NSString *const kLongitudeKey = @"lng";
static NSString *const kLongitudeProperty = @"longitude";

@implementation SLLocationMapper

+ (EKObjectMapping *)objectMapping {

    EKObjectMapping *mapper = [[EKObjectMapping alloc] initWithObjectClass:[SLLocation class]];

    EKMappingValueBlock doubleBlock = [self doubleValueBlock];

    [mapper mapKeyPath:kLatitudeKey toProperty:kLatitudeProperty withValueBlock:doubleBlock];
    [mapper mapKeyPath:kLongitudeKey toProperty:kLongitudeProperty withValueBlock:doubleBlock];

    return mapper;
}

- (SLLocation *)mapLocation:(id)dict {
    return [self map:dict];
}

@end
