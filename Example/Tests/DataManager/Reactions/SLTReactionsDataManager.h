//
//  SLTReactionsDataManager.h
//  SoulSDK
//
//  Created by Mikhail on 11.04.16.
//  Copyright © 2016 Mikhail Shershnev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SLTReactionsDataManager : NSObject

- (nonnull NSDictionary *)reactions;

- (nonnull NSDictionary *)sentByMe;
- (nonnull NSDictionary *)received;

@end
