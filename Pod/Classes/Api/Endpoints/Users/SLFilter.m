//
//  SLFilter.m
//  Pods
//
//  Created by Mikhail on 21.04.16.
//
//

#import "SLFilter.h"
#import "NSMutableDictionary+SLHelper.h"

@implementation SLFilter

- (instancetype)init {
    self = [super init];

    if (self) {
        _parameters = [NSMutableDictionary new];
    }

    return self;
}

- (void)setGeoSensitive:(BOOL)value {

    NSString *key = @"geo";
    [_parameters forKey:key setValue:@(value)];
}

- (void)addConditionFor:(NSString *)parameter equalTo:(NSObject *)value {
    [self addConditionFor:parameter relation:SLFilterRelationEqual than:value];
}

- (void)addConditionFor:(NSString *)parameter greaterThan:(NSObject *)value {
    [self addConditionFor:parameter relation:SLFilterRelationGreaterThan than:value];
}
- (void)addConditionFor:(NSString *)parameter greaterThanOrEqualTo:(NSObject *)value {
    [self addConditionFor:parameter relation:SLFilterRelationGreaterThanOrEqual than:value];
}

- (void)addConditionFor:(NSString *)parameter lessThan:(NSObject *)value {
    [self addConditionFor:parameter relation:SLFilterRelationLessThan than:value];
}
- (void)addConditionFor:(NSString *)parameter lessThanOrEqualTo:(NSObject *)value {
    [self addConditionFor:parameter relation:SLFilterRelationLessThanOrEqual than:value];
}

- (void)addConditionFor:(NSString *)parameter relation:(SLFilterRelation)relation than:(NSObject *)value {

    NSString *key = [self fixedKey:parameter forRelation:relation];
    [_parameters forKey:key setValue:value];
}

- (NSString *)fixedKey:(NSString *)key forRelation:(SLFilterRelation)relation {

    NSString *postfix;

    switch (relation) {
        case SLFilterRelationGreaterThan:
            postfix = @"gt";
            break;
        case SLFilterRelationGreaterThanOrEqual:
            postfix = @"gte";
            break;
        case SLFilterRelationLessThan:
            postfix = @"lt";
            break;
        case SLFilterRelationLessThanOrEqual:
            postfix = @"lte";
            break;
        default:
            break;
    }

    NSString *fixedKey = key;

    if (postfix) {
        fixedKey = [NSString stringWithFormat:@"%@__%@", fixedKey, postfix];
    }

    return fixedKey;
}

@end
