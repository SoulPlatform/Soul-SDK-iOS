//
//  SLApiEvents.h
//  Pods
//
//  Created by Mikhail on 11.04.16.
//
//

#import "SLApiBase.h"
#import "SLEventsResponse.h"

@interface SLApiEvents :SLApiBase

typedef void (^SLApiEventsSuccess)(SLEventsResponse *_Nonnull responce);

// GET: /events
- (void)loadAfter:(nonnull NSNumber *)after
            limit:(nonnull NSNumber *)limit
          success:(nullable SLApiEventsSuccess)success
          failure:(nullable SLApiRequestFailure)failure;

// GET: /events
- (void)loadSince:(nonnull NSNumber *)since
            limit:(nonnull NSNumber *)limit
          success:(nullable SLApiEventsSuccess)success
          failure:(nullable SLApiRequestFailure)failure;

@end
