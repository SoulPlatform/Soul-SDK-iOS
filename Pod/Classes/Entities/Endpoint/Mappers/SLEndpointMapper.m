//
//  SLEndpointMapper.m
//  Pods
//
//  Created by Mikhail on 16.03.16.
//
//

#import "SLEndpointMapper.h"

static NSString *const kUriKey = @"uri";
static NSString *const kUriProp = @"uri";

static NSString *const kTypeKey = @"type";
static NSString *const kTypeProp = @"type";

@implementation SLEndpointMapper

+ (EKObjectMapping *)objectMapping {

    EKObjectMapping *mapper = [[EKObjectMapping alloc] initWithObjectClass:[SLEndpoint class]];

    EKMappingValueBlock typeBlock = [self typeValueBlock];
    EKMappingValueBlock stringBlock = [self stringValueBlock];

    [mapper mapKeyPath:kUriKey toProperty:kUriProp withValueBlock:stringBlock];
    [mapper mapKeyPath:kTypeKey toProperty:kTypeProp withValueBlock:typeBlock];

    return mapper;
}

+ (EKMappingValueBlock)typeValueBlock {

    return ^id(NSString * key, id value) {

        SLEndpointType type;

        if ([value isKindOfClass:[NSString class]]) {

            NSString *stringValue = (NSString *)value;

            if ([stringValue isEqualToString:@"newItems"]) {
                type = SLEndpointNewItemType;
            }
            else {
                type = SLEndpointUnknownType;
            }

        }
        else {
            type = SLEndpointUnknownType;
        }

        return @(type);
    };
}

#pragma mark SLEndpointMapperProtocol
- (SLEndpoint *)mapEndpoint:(id)dict {
    SLEndpoint *e = [self map:dict];
    return e;
}

@end
