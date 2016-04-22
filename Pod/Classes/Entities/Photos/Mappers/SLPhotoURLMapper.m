//
//  SLPhotoURLMapper.m
//  Pods
//
//  Created by Mikhail on 06.03.16.
//
//

#import "SLPhotoURLMapper.h"
#import "SLPhotoURL.h"

static NSString *const kURLKey = @"url";
static NSString *const kURLProperty = @"url";

static NSString *const kWidthKey = @"width";
static NSString *const kWidthProperty = @"width";

static NSString *const kHeightKey = @"height";
static NSString *const kHeightProperty = @"height";

@implementation SLPhotoURLMapper

+ (EKObjectMapping *)objectMapping {

    EKObjectMapping *mapper = [[EKObjectMapping alloc] initWithObjectClass:[SLPhotoURL class]];

    EKMappingValueBlock urlBlock = [self urlValueBlock];
    EKMappingValueBlock integerBlock = [self integerValueBlock];

    [mapper mapKeyPath:kURLKey toProperty:kURLProperty withValueBlock:urlBlock];
    [mapper mapKeyPath:kWidthKey toProperty:kWidthProperty withValueBlock:integerBlock];
    [mapper mapKeyPath:kHeightKey toProperty:kHeightProperty withValueBlock:integerBlock];

    return mapper;
}

- (SLPhotoURL *)mapPhotoURL:(id)dict {
    return [self map:dict];
}

@end