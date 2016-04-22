//
//  SLTEventsDataManager.h
//  SoulSDK
//
//  Created by Mikhail on 11.04.16.
//  Copyright © 2016 Mikhail Shershnev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SLTEventsDataManager : NSObject

- (nonnull NSDictionary *)meEvent;
- (nonnull NSDictionary *)userEvent;

- (nonnull NSDictionary *)chatEvent;
- (nonnull NSDictionary *)endpointEvent;
- (nonnull NSDictionary *)reactionsEvent;

@end
