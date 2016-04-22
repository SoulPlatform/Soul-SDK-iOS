//
//  SLEventsResponse.h
//  Pods
//
//  Created by Mikhail on 11.04.16.
//
//

#import "SLObject.h"
#import "SLEvent.h"
#import "SLAdditionalInfo.h"
#import "SLPagingAfterMeta.h"

@interface SLEventsResponse :SLObject

@property (nonatomic, strong) NSArray <SLEvent *> *events;
@property (nonatomic, strong) SLPagingAfterMeta *meta;
@property (nonatomic, strong) SLAdditionalInfo *additionalInfo;

@end