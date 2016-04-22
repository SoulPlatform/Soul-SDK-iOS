//
//  SLConfig.h
//  Pods
//
//  Created by Mikhail on 12.04.16.
//
//

#import <Foundation/Foundation.h>

@interface SLConfig : NSObject

@property (nonatomic, strong, readwrite) NSString *_Nonnull apiKey; // platform api key
@property (nonatomic, strong, readwrite) NSString *_Nonnull pubKey; // chat publisher key
@property (nonatomic, strong, readwrite) NSString *_Nonnull subKey; // chat subscriber key

@property (nonatomic, strong, readonly) NSURL *_Nonnull baseURL;
@property (nonatomic, strong, readonly) NSString *_Nonnull sdkVersion;

+ (nullable instancetype)defaultConfig;

@end
