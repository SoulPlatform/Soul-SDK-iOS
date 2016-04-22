//
//  NSDictionary+SLHelper.m
//  Pods
//
//  Created by Mikhail on 11.04.16.
//
//

#import "NSMutableDictionary+SLHelper.h"

@implementation NSMutableDictionary (SLHelper)

- (void)forKey:(NSString *)key setValue:(id)value {

    if (key == nil) {
        return;
    }

    if (value == nil) {
        value = [NSNull null];
    }

    [self setValue:value forKey:key];
}

@end
