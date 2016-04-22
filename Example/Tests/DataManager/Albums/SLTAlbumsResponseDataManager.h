//
//  SLTAlbumsResponseDataManager.h
//  SoulSDK
//
//  Created by Mikhail on 30.03.16.
//  Copyright © 2016 Mikhail Shershnev. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *_Nonnull const kTMetaKey;
extern NSString *_Nonnull const kTAlbumsKey;
extern NSString *_Nonnull const kTAdditionalInfoKey;

@interface SLTAlbumsResponseDataManager :NSObject

- (nonnull NSDictionary *)miniAlbumsResponse;
- (nonnull NSDictionary *)completeAlbumsResponse;

- (nonnull NSArray *)miniAlbums;
- (nonnull NSArray *)completeAlbums;

- (nonnull NSDictionary *)meta;
- (nonnull NSDictionary *)info;

@end
