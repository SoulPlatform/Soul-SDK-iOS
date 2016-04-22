//
//  SLUserRecsMetaMapper.m
//  Pods
//
//  Created by Mikhail on 06.03.16.
//
//

#import "SLUserRecsMetaMapper.h"

static NSString *const kSessionNameKey = @"sessionName";
static NSString *const kSessionNameProp = @"sessionName";

static NSString *const kUniqueTokenKey = @"uniqueToken";
static NSString *const kUniqueTokenProp = @"uniqueToken";

@implementation SLUserRecsMetaMapper

+ (EKObjectMapping *)objectMapping {

    EKObjectMapping *mapper = [[EKObjectMapping alloc] initWithObjectClass:[SLUserRecsMeta class]];

    EKMappingValueBlock stringBlock = [self stringValueBlock];
    [mapper mapKeyPath:kSessionNameKey toProperty:kSessionNameProp withValueBlock:stringBlock];
    [mapper mapKeyPath:kUniqueTokenKey toProperty:kUniqueTokenProp withValueBlock:stringBlock];

    return mapper;
}

- (SLUserRecsMeta *)mapMeta:(id)dict {
    return [self map:dict];
}

@end