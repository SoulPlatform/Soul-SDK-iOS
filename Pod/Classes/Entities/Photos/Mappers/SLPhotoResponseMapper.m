//
//  SLPhotoResponseMapper.m
//  Pods
//
//  Created by Mikhail on 05.04.16.
//
//

#import "SLPhotoResponseMapper.h"

#import "SLPhotoMapper.h"
#import "SLAdditionalInfoMapper.h"

static NSString *const kPhotoKey = @"photo";
static NSString *const kPhotoProp = @"photo";

static NSString *const kInfoKey = @"additionalInfo";
static NSString *const kInfoProp = @"additionalInfo";

@implementation SLPhotoResponseMapper

+ (EKObjectMapping *)objectMapping {

    EKObjectMapping *mapper = [[EKObjectMapping alloc] initWithObjectClass:[SLPhotoResponse class]];

    Class photoClass = [SLPhotoMapper class];
    [mapper hasOne:photoClass forKeyPath:kPhotoKey forProperty:kPhotoProp];

    Class infoClass = [SLAdditionalInfoMapper class];
    [mapper hasOne:infoClass forKeyPath:kInfoKey forProperty:kInfoProp];

    return mapper;
}

- (SLPhotoResponse *)mapPhotoResponse:(id)dict {
    SLPhotoResponse *photoResponse = [self map:dict];
    return photoResponse;
}

@end
