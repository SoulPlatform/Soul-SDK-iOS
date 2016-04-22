//
//  SLFilter.h
//  Pods
//
//  Created by Mikhail on 21.04.16.
//
//

#import "SLObject.h"

typedef NS_ENUM(NSInteger, SLFilterRelation) {
    SLFilterRelationEqual,
    SLFilterRelationGreaterThan,
    SLFilterRelationGreaterThanOrEqual,
    SLFilterRelationLessThan,
    SLFilterRelationLessThanOrEqual
};

@interface SLFilter :SLObject

@property (nonatomic, strong) NSMutableDictionary *parameters;

- (void)setGeoSensitive:(BOOL)value;

- (void)addConditionFor:(NSString *)parameter equalTo:(NSObject *)value;

- (void)addConditionFor:(NSString *)parameter greaterThan:(NSObject *)value;
- (void)addConditionFor:(NSString *)parameter greaterThanOrEqualTo:(NSObject *)value;

- (void)addConditionFor:(NSString *)parameter lessThan:(NSObject *)value;
- (void)addConditionFor:(NSString *)parameter lessThanOrEqualTo:(NSObject *)value;

- (void)addConditionFor:(NSString *)parameter relation:(SLFilterRelation)relation than:(NSObject *)value;

@end
