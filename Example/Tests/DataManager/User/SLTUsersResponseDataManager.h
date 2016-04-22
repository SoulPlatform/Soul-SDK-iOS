//
//  SLTUsersResponseDataManager.h
//  SoulSDK
//
//  Created by Mikhail on 05.04.16.
//  Copyright © 2016 Mikhail Shershnev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SLTUsersResponseDataManager :NSObject

- (nonnull NSDictionary *)usersRecsResponse;
- (nonnull NSDictionary *)usersFilterResponse;

@end