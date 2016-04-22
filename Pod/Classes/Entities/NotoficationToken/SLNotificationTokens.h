//
//  SLNotificationTokens.h
//  Pods
//
//  Created by Mikhail on 25.02.16.
//
//

#import "SLObject.h"

@interface SLNotificationTokens :SLObject

@property (nonatomic, strong) NSString *gcmToken;
@property (nonatomic, strong) NSString *apnsToken;

@end
