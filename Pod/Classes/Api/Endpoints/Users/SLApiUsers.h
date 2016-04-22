//
//  SLApiUsers.h
//  Pods
//
//  Created by Mikhail on 05.04.16.
//
//

#import "SLApiBase.h"
#import "SLUsersRecsResponse.h"
#import "SLUsersFilterResponse.h"
#import "SLFilter.h"

@interface SLApiUsers :SLApiBase

typedef void (^SLApiUsersRecsSuccess)(SLUsersRecsResponse *_Nonnull responce);
typedef void (^SLApiUsersFilterSuccess)(SLUsersFilterResponse *_Nonnull responce);

// GET: /users/recommendations
- (void)loadBySession:(nonnull NSString *)sessionName
          uniqueToken:(nonnull NSString *)uniqueToken
              success:(nullable SLApiUsersRecsSuccess)success
              failure:(nullable SLApiRequestFailure)failure;

- (void)setFilter:(nullable SLFilter *)filter
          success:(nullable SLApiRequestSuccess)success
          failure:(nullable SLApiRequestFailure)failure;

// GET: /users/{filterName}
//- (void)loadByFilter:(nonnull NSString *)filterName
//               after:(nonnull NSNumber *)after
//               limit:(nonnull NSNumber *)limit
//             success:(nullable SLApiUsersFilterSuccess)success
//             failure:(nullable SLApiRequestFailure)failure;

@end
