//
//  SLTAvailableSubscriptionsDataManager.h
//  SoulSDK
//
//  Created by Mikhail on 30.03.16.
//  Copyright © 2016 Mikhail Shershnev. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *_Nonnull const kAvailableSubscriptions;

@interface SLTAvailableSubscriptionsDataManager :NSObject

- (nonnull NSDictionary *)products;

@end
