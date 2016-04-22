//
//  SLUserParametersMapper.m
//  Pods
//
//  Created by Mikhail on 07.03.16.
//
//

#import "SLUserParametersMapper.h"
#import "SLFilterableParametersMapper.h"

static NSString *const kFilterableKey = @"filterable";
static NSString *const kFilterableProp = @"filterable";

static NSString *const kPrivateKey = @"private";
static NSString *const kPrivateProp = @"individual";

static NSString *const kPublicVisibleKey = @"publicVisible";
static NSString *const kPublicVisibleProp = @"publicVisible";

static NSString *const kPublicWritableKey = @"publicWritable";
static NSString *const kPublicWritableProp = @"publicWritable";

@implementation SLUserParametersMapper

+ (EKObjectMapping *)objectMapping {

    EKObjectMapping *mapper = [[EKObjectMapping alloc] initWithObjectClass:[SLUserParameters class]];

    [mapper mapKeyPath:kPrivateKey toProperty:kPrivateProp];
    [mapper mapKeyPath:kPublicVisibleKey toProperty:kPublicVisibleProp];
    [mapper mapKeyPath:kPublicWritableKey toProperty:kPublicWritableProp];
    [mapper mapKeyPath:kFilterableKey toProperty:kFilterableProp];

    //Class filterableMapperClass = [SLFilterableParametersMapper class];
    //[mapper hasOne:filterableMapperClass forKeyPath:kFilterableKey forProperty:kFilterableProp];

    return mapper;
}

- (SLUserParameters *)mapParameters:(NSDictionary *)dict {

    SLUserParameters *userParams = [self map:dict];
    return userParams;
}

@end