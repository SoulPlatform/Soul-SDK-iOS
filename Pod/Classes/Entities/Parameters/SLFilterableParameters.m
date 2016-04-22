//
//  SLFilterableParameters.m
//  Pods
//
//  Created by Mikhail on 07.03.16.
//
//

#import "SLFilterableParameters.h"

@interface SLFilterableParameters ()

@property (nonatomic, strong) NSMutableDictionary *params;

@end

@implementation SLFilterableParameters

- (nullable instancetype)init {
    self = [super init];

    if (self) {
        _params = [NSMutableDictionary dictionary];
    }

    return self;
}

+ (NSArray <NSString *> *)mandatoryFields {
    return @[
             @"location",
             ];
}

#pragma mark - Accessors

- (void)setObject:(nonnull id)object forKey:(nonnull NSString *)key {

    @synchronized(self) {
        [_params setObject:object forKey:key];
    }
}

- (void)setObject:(nonnull id)object forKeyedSubscript:(nonnull NSString *)key {
    [self setObject:object forKey:key];
}

- (nullable id)objectForKey:(nonnull NSString *)key {

    @synchronized (self) {
        return [_params objectForKey:key];
    }
}

- (nullable id)objectForKeyedSubscript:(nonnull NSString *)key {
    return [self objectForKey:key];
}

- (void)removeObjectForKey:(NSString *)key {
    @synchronized (self) {
        [_params removeObjectForKey:key];
    }
}

- (nonnull NSArray *)allKeys {
    @synchronized (self) {
        return _params.allKeys;
    }
}

@end
