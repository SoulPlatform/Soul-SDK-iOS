//
//  SLPhotoMapper.m
//  Pods
//
//  Created by Mikhail on 06.03.16.
//
//

#import "SLPhotoMapper.h"
#import "SLPhoto.h"
#import "SLPhotoURLMapper.h"

static NSString *const kIDKey = @"id";
static NSString *const kIDProp = @"photoId";

static NSString *const kExpiresTimeKey = @"expiresTime";
static NSString *const kExpiresTimeProp = @"expiresTime";

static NSString *const kMainKey = @"main";
static NSString *const kMainProp = @"isMain";

static NSString *const kOriginalKey = @"original";
static NSString *const kOriginalProp = @"original";

@implementation SLPhotoMapper

+ (EKObjectMapping *)objectMapping {

    EKObjectMapping *mapper = [[EKObjectMapping alloc] initWithObjectClass:[SLPhoto class]];

    EKMappingValueBlock boolBlock = [self boolValueBlock];
    EKMappingValueBlock stringBlock = [self stringValueBlock];
    EKMappingValueBlock doubleBlock = [self doubleValueBlock];

    [mapper mapKeyPath:kIDKey toProperty:kIDProp withValueBlock:stringBlock];
    [mapper mapKeyPath:kMainKey toProperty:kMainProp withValueBlock:boolBlock];
    [mapper mapKeyPath:kExpiresTimeKey toProperty:kExpiresTimeProp withValueBlock:doubleBlock];

    Class photoURLClass = [SLPhotoURLMapper class];
    [mapper hasOne:photoURLClass forKeyPath:kOriginalKey forProperty:kOriginalProp];

    return mapper;
}

- (SLPhoto *)mapPhoto:(id)dict {
    return [self map:dict];
}

@end
