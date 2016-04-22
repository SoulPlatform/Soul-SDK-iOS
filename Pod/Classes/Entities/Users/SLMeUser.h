//
//  SLMeUser.h
//  Pods
//
//  Created by Mikhail on 08.03.16.
//
//

#import "SLBaseUser.h"
#import "SLNotificationTokens.h"
#import "SLSubscriptionServices.h"

@interface SLMeUser :SLBaseUser

@property (nonatomic, strong) SLNotificationTokens *notificationTokens;
@property (nonatomic, strong) SLSubscriptionServices *subscriptionServices;

@end
