//
//  SLTPagingOffsetMetaDataManager.h
//  SoulSDK
//
//  Created by Mikhail on 30.03.16.
//  Copyright © 2016 Mikhail Shershnev. All rights reserved.
//

#import <Foundation/Foundation.h>


extern NSString *_Nonnull const kTOffsetKey;
extern NSString *_Nonnull const kTLimitKey;
extern NSString *_Nonnull const kTTotalKey;

@interface SLTPagingOffsetMetaDataManager :NSObject

- (NSInteger)offsetInteger;
- (NSInteger)limitInteger;
- (NSInteger)totalInteger;

- (nonnull NSString *)offsetString;
- (nonnull NSString *)limitString;
- (nonnull NSString *)totalString;

- (nonnull NSDictionary *)meta;

@end
