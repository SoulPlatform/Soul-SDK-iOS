//
//  SLEventType.h
//  Pods
//
//  Created by Mikhail on 09.03.16.
//
//

#import "SLObject.h"

typedef NS_ENUM(NSInteger, SLEventActionType) {
    SLEventActionUnknownType = 0,
    SLEventActionChangeType,
    SLEventActionAdditionType,
};

typedef NS_ENUM(NSInteger, SLEventObjectType) {
    SLEventObjectUnknownType = 0,
    SLEventObjectMeType,
    SLEventObjectUserType,
    SLEventObjectChatType,
    SLEventObjectEndpointType,
    SLEventObjectReactionsType,
};

@interface SLEventType :SLObject

@property (nonatomic, assign) SLEventActionType action; // SLEventActionType
@property (nonatomic, assign) SLEventObjectType object; // SLEventObjectType

@end