//
//  SLTErrorResponseDataManager.h
//  SoulSDK
//
//  Created by Mikhail on 29.03.16.
//  Copyright © 2016 Mikhail Shershnev. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *_Nonnull const kErrorKey;
extern NSString *_Nonnull const kAdditionalKey;

@interface SLTErrorResponseDataManager :NSObject

- (nonnull NSDictionary *)errorResponse;

@end
