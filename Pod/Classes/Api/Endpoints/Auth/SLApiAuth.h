//
//  SLApiAuth.h
//  Pods
//
//  Created by Mikhail on 18.03.16.
//
//

#import "SLApiBase.h"

@interface SLApiAuth :SLApiBase

typedef void (^SLApiAuthLogoutSuccess)(void);

// /auth/logout
- (void)logoutFull:(BOOL)full
           success:(nullable SLApiAuthLogoutSuccess)success
           failure:(nullable SLApiRequestFailure)failure;

@end
