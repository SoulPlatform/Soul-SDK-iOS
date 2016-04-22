//
//  SLEndpointEvent.h
//  Pods
//
//  Created by Mikhail on 16.03.16.
//
//

#import "SLEvent.h"
#import "SLEndpoint.h"

@interface SLEndpointEvent :SLEvent

@property (nonatomic, strong) SLEndpoint *endpoint;

@end