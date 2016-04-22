//
//  SLConfig.m
//  Pods
//
//  Created by Mikhail on 12.04.16.
//
//

#import "SLConfig.h"

static NSString *const kURLString = @"https://api-1.soulplatform.com";
static NSString *const kSdkVersion = @"1.0.0";

@interface SLConfig ()

@property (nonatomic, strong, readwrite) NSURL *_Nonnull baseURL;
@property (nonatomic, strong, readwrite) NSString *_Nonnull sdkVersion;

@end

@implementation SLConfig

+ (nullable instancetype)defaultConfig {

    SLConfig *config = [SLConfig new];

    if (config) {
        config.baseURL = [NSURL URLWithString:kURLString];
        config.sdkVersion = kSdkVersion;
    }

    return config;
}

@end
