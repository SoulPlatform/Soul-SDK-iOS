//
//  SLFilterableParametersMapper.m
//  Pods
//
//  Created by Mikhail on 07.03.16.
//
//

#import "SLFilterableParametersMapper.h"
#import "SLLocationMapper.h"

static NSString *const kLocationKey = @"location";
static NSString *const kLocationProp = @"location";

@implementation SLFilterableParametersMapper

+ (EKObjectMapping *)objectMapping {

    EKObjectMapping *mapper = [[EKObjectMapping alloc] initWithObjectClass:[SLFilterableParameters class]];

    Class locationMapperClass = [SLLocationMapper class];
    [mapper hasOne:locationMapperClass forKeyPath:kLocationKey forProperty:kLocationProp];

    return mapper;
}

- (SLFilterableParameters *)mapFilterableParameters:(NSDictionary *)dict {

    SLFilterableParameters *filterable = [self map:dict];

    if (filterable) {

        for (NSString *key in dict.allKeys) {

            if ([key isEqualToString:kLocationKey]) {
                continue;
            }

            filterable[key] = dict[key];
        }
    }

    return filterable;
}

@end
