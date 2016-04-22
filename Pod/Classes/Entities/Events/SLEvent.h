//
//  SLEvent.h
//  Pods
//
//  Created by Mikhail on 09.03.16.
//
//

#import "SLObject.h"
#import "SLEventType.h"

@interface SLEvent :SLObject

@property (nonatomic, strong) NSNumber *recordId;
@property (nonatomic, strong) NSNumber *time;
@property (nonatomic, strong) SLEventType *type;

@end