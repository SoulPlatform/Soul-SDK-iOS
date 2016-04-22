//
//  SLEventTypeMapper.m
//  Pods
//
//  Created by Mikhail on 09.03.16.
//
//

#import "SLEventTypeMapper.h"

static NSString *const kActionKey = @"action";
static NSString *const kActionProp = @"action";

static NSString *const kObjectKey = @"object";
static NSString *const kObjectProp = @"object";

@implementation SLEventTypeMapper

+ (EKObjectMapping *)objectMapping {

    EKObjectMapping *mapper = [[EKObjectMapping alloc] initWithObjectClass:[SLEventType class]];

    EKMappingValueBlock actionValueBlock = [self actionValueBlock];
    EKMappingValueBlock objectValueBlock = [self objectValueBlock];

    [mapper mapKeyPath:kActionKey toProperty:kActionProp withValueBlock:actionValueBlock];
    [mapper mapKeyPath:kObjectKey toProperty:kObjectProp withValueBlock:objectValueBlock];

    return mapper;
}

+ (EKMappingValueBlock)actionValueBlock {

    return ^id(NSString * key, id value) {

        SLEventActionType actionType;

        if ([value isKindOfClass:[NSString class]]) {

            NSString *stringValue = (NSString *)value;
            stringValue = stringValue.lowercaseString;

            if ([stringValue isEqualToString:@"change"]) {
                actionType = SLEventActionChangeType;
            }
            else if ([stringValue isEqualToString:@"addition"]) {
                actionType = SLEventActionAdditionType;
            }
            else {
                actionType = SLEventActionUnknownType;
            }

        }
        else {
            actionType = SLEventActionUnknownType;
        }

        return @(actionType);
    };
}

+ (EKMappingValueBlock)objectValueBlock {

    return ^id(NSString * key, id value) {

        SLEventObjectType objectType;

        if ([value isKindOfClass:[NSString class]]) {

            NSString *stringValue = (NSString *)value;
            stringValue = stringValue.lowercaseString;

            if ([stringValue isEqualToString:@"me"]) {
                objectType = SLEventObjectMeType;
            }
            else if ([stringValue isEqualToString:@"user"]) {
                objectType = SLEventObjectUserType;
            }
            else if ([stringValue isEqualToString:@"chat"]) {
                objectType = SLEventObjectChatType;
            }
            else if ([stringValue isEqualToString:@"endpoint"]) {
                objectType = SLEventObjectEndpointType;
            }
            else if ([stringValue isEqualToString:@"reactions"]) {
                objectType = SLEventObjectReactionsType;
            }
            else {
                objectType = SLEventObjectUnknownType;
            }

        }
        else {
            objectType = SLEventObjectUnknownType;
        }

        return @(objectType);
    };
}

#pragma mark SLEventTypeMapperProtocol
- (SLEventType *)mapEventType:(id)dict {
    return [self map:dict];
}

@end
