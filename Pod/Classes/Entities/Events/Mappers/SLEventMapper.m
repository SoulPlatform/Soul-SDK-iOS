//
//  SLEventMapper.m
//  Pods
//
//  Created by Mikhail on 09.03.16.
//
//

#import "SLEventMapper.h"
#import "SLEventTypeMapper.h"

#import "SLMeEventMapper.h"
#import "SLUserEventMapper.h"
#import "SLChatEventMapper.h"
#import "SLEndpointEventMapper.h"
#import "SLReactionsEventMapper.h"

static NSString *const kIdKey = @"recordId";
static NSString *const kIdProp = @"recordId";

static NSString *const kTimeKey = @"time";
static NSString *const kTimeProp = @"time";

static NSString *const kTypeKey = @"type";
static NSString *const kTypeProp = @"type";

@implementation SLEventMapper

+ (EKObjectMapping *)eventMapperAtClass:(Class)klass {

    EKObjectMapping *mapper = [[EKObjectMapping alloc] initWithObjectClass:klass];

    EKMappingValueBlock doubleBlock = [self doubleValueBlock];
    EKMappingValueBlock integerBlock = [self integerValueBlock];

    [mapper mapKeyPath:kIdKey toProperty:kIdProp withValueBlock:integerBlock];
    [mapper mapKeyPath:kTimeKey toProperty:kTimeProp withValueBlock:doubleBlock];

    Class typeClass = [SLEventTypeMapper class];
    [mapper hasOne:typeClass forKeyPath:kTypeKey forProperty:kTypeProp];

    return mapper;
}

#pragma mark SLEventMapperProtocol

- (SLEvent *)mapEvent:(id)dict {

    Class eventClass = [SLEvent class];
    EKObjectMapping *mapper = [SLEventMapper eventMapperAtClass:eventClass];
    SLEvent *event = [self map:dict mapperObject:mapper];

    if (event) {

        switch (event.type.object) {

            case SLEventObjectMeType:
                event = [self mapMeEvent:dict];
                break;

            case SLEventObjectUserType:
                event = [self mapUserEvent:dict];
                break;

            case SLEventObjectChatType:
                event = [self mapChatEvent:dict];
                break;

            case SLEventObjectEndpointType:
                event = [self mapEndpointEvent:dict];
                break;

            case SLEventObjectReactionsType:
                event = [self mapReactionsEvent:dict];
                break;

            default:
                event = nil;
                break;
        }
    }

    return event;
}

- (SLEvent *)_mapEvent:(id)dict {

    Class eventClass = [SLEvent class];
    EKObjectMapping *mapper = [SLEventMapper eventMapperAtClass:eventClass];

    SLEvent *event = [self map:dict mapperObject:mapper];
    return event;
}

- (SLMeEvent *)mapMeEvent:(id)dict {

    EKObjectMapping *mapper = [SLMeEventMapper objectMapping];
    SLMeEvent *meEvent = [self map:dict mapperObject:mapper];

    return meEvent;
}

- (SLUserEvent *)mapUserEvent:(id)dict {

    EKObjectMapping *mapper = [SLUserEventMapper objectMapping];
    SLUserEvent *userEvent = [self map:dict mapperObject:mapper];

    return userEvent;
}

- (SLChatEvent *)mapChatEvent:(id)dict {

    EKObjectMapping *mapper = [SLChatEventMapper objectMapping];
    SLChatEvent *chatEvent = [self map:dict mapperObject:mapper];

    return chatEvent;
}

- (SLEndpointEvent *)mapEndpointEvent:(id)dict {

    EKObjectMapping *mapper = [SLEndpointEventMapper objectMapping];
    SLEndpointEvent *endpointEvent = [self map:dict mapperObject:mapper];

    return endpointEvent;
}

- (SLReactionsEvent *)mapReactionsEvent:(id)dict {

    EKObjectMapping *mapper = [SLReactionsEventMapper objectMapping];
    SLReactionsEvent *reactionsEvent = [self map:dict mapperObject:mapper];

    return reactionsEvent;
}

@end
