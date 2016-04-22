//
//  SLFilterableParameters.h
//  Pods
//
//  Created by Mikhail on 07.03.16.
//
//

#import "SLObject.h"
#import "SLLocation.h"

@interface SLFilterableParameters :SLObject

@property (nonatomic, strong) SLLocation *_Nonnull location;

#pragma mark - Accessors

- (nullable id)objectForKey:(nonnull NSString *)key;
- (void)setObject:(nonnull id)object forKey:(nonnull NSString *)key;
- (void)removeObjectForKey:(nonnull NSString *)key;

- (nullable id)objectForKeyedSubscript:(nonnull NSString *)key;
- (void)setObject:(nonnull id)object forKeyedSubscript:(nonnull NSString *)key;

- (nonnull NSArray *)allKeys;

@end