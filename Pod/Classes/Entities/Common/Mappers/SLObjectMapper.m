//
//  SLObjectMapper.m
//  Pods
//
//  Created by Mikhail on 04.02.16.
//
//

#import "SLObjectMapper.h"

@implementation SLObjectMapper

+ (EKObjectMapping *)objectMapping {
    return nil;
}

- (id)checkMandatoryFields:(id)object {

    SLObject *slObject = nil;
    Class klass = [SLObject class];

    if ([object isKindOfClass:klass]) {

        slObject = (SLObject *)object;
        NSArray *mandatoryFields = [[slObject class] mandatoryFields];

        for (NSString *field in mandatoryFields) {

            if ([slObject valueForKey:field]) {
                continue;
            }
            else {
                slObject = nil;
                break;
            }
        }

    }

    return slObject;
}

- (id)map:(id)dict {

    EKObjectMapping *mapperObject = [[self class] objectMapping];
    id retObject = [self map:dict mapperObject:mapperObject];

    return retObject;
}

- (id)map:(id)dict mapperObject:(EKObjectMapping *)mapperObject {

    id retObject;
    id object = [EKMapper objectFromExternalRepresentation:dict withMapping:mapperObject];

    Class retObjectClass = mapperObject.objectClass;

    if (
        object
        &&
        [object class] == retObjectClass
        ) {
        retObject = [self checkMandatoryFields:object];
    }

    return retObject;
}

+ (EKMappingValueBlock)urlValueBlock {

    return ^id(NSString * key, id value) {

        NSURL *urlValue = nil;
        
        if ([value isKindOfClass:[NSString class]]) {
            NSString *stringValue = (NSString *)value;
            urlValue = [NSURL URLWithString:stringValue];
        }

        return urlValue;
    };

}

+ (EKMappingValueBlock)stringValueBlock {

    return ^id(NSString * key, id value) {

        NSString *stringValue = nil;

        if ([value isKindOfClass:[NSString class]]) {
            stringValue = value;
        }
        else if ([value isKindOfClass:[NSNumber class]]) {
            NSNumber *numberValue = (NSNumber *)value;
            stringValue = [numberValue stringValue];
        }

        return stringValue;
    };

}

+ (EKMappingValueBlock)integerValueBlock {

    return ^id(NSString * key, id value) {

        NSInteger integerValue;

        if ([value isKindOfClass:[NSNumber class]]) {
            NSNumber *numberValue = (NSNumber *)value;
            integerValue = numberValue.integerValue;
        }
        else if ([value isKindOfClass:[NSString class]]) {
            NSString *stringValue = (NSString *)value;
            integerValue = [stringValue integerValue];
        }
        else {
            integerValue = 0;
        }

        return @(integerValue);
    };
}

+ (EKMappingValueBlock)doubleValueBlock {

    return ^id(NSString * key, id value) {

        double doubleValue;

        if ([value isKindOfClass:[NSNumber class]]) {
            NSNumber *numberValue = (NSNumber *)value;
            doubleValue = numberValue.doubleValue;
        }
        else if ([value isKindOfClass:[NSString class]]) {
            NSString *stringValue = (NSString *)value;
            doubleValue = stringValue.doubleValue;
        }
        else {
            doubleValue = 0;
        }

        return @(doubleValue);
    };
}

+ (EKMappingValueBlock)boolValueBlock {

    return ^id(NSString * key, id value) {

        BOOL boolValue;

        if ([value isKindOfClass:[NSNumber class]]) {
            NSNumber *numberValue = (NSNumber *)value;
            boolValue = numberValue.boolValue;
        }
        else if ([value isKindOfClass:[NSString class]]) {
            NSString *stringValue = (NSString *)value;
            boolValue = [stringValue boolValue];
        }
        else {
            boolValue = NO;
        }

        return @(boolValue);
    };
}

@end
