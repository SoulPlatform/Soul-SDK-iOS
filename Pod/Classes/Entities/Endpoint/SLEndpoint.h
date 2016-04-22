//
//  SLEndpoint.h
//  Pods
//
//  Created by Mikhail on 16.03.16.
//
//

#import "SLObject.h"

typedef NS_ENUM(NSInteger, SLEndpointType) {
    SLEndpointUnknownType = 0,
    SLEndpointNewItemType,
};

@interface SLEndpoint :SLObject

@property (nonatomic, strong) NSString *uri;
@property (nonatomic, assign) SLEndpointType type; //SLEndpointType

@end