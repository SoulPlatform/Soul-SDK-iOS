//
//  SLHTTPHeadersManager.m
//  Pods
//
//  Created by Mikhail on 12.04.16.
//
//

#import "SLHTTPHeadersManager.h"
#import "SLStorageProtocol.h"

#import <sys/utsname.h>
#import <CommonCrypto/CommonHMAC.h>
#import <AFNetworking/AFHTTPSessionManager.h>

static NSString *const kUserAgent = @"User-Agent";
static NSString *const kAuthorization = @"Authorization";

@interface SLHTTPHeadersManager ()
@property (nonatomic, strong) NSObject<SLStorageProtocol> *storage;
@end

@implementation SLHTTPHeadersManager

- (instancetype)initWithStorage:(NSObject <SLStorageProtocol> *)storage {
    self = [self init];

    if (self) {
        _storage = storage;
    }

    return self;
}

- (NSDictionary *)headersByRequest:(SLHTTPRequest *)request andBody:(NSString *)body {

    NSMutableDictionary *headers = [NSMutableDictionary dictionary];

    headers[kUserAgent] = [self _userAgent];

    if (request.isSecure) {
        headers[kAuthorization] = [self _hmacAtRequest:request andBody:body];
    }

    return headers;
}

- (NSString *)_hmacAtRequest:(SLHTTPRequest *)request andBody:(NSString *)body {

    NSString *userId = _storage.userId;
    NSString *sessionToken = _storage.sessionToken;

    NSTimeInterval ti = [[NSDate date] timeIntervalSince1970];
    NSString *unixtime = [NSString stringWithFormat:@"%ld", (long)round(ti)];

    NSString *httpMethod = [request methodString];
    NSString *uri = request.endpoint;

    NSString *digestRaw = [NSString stringWithFormat:@"%@+%@+%@+%@", httpMethod, uri, body, unixtime];
    NSLog(@"%@", digestRaw);
    NSString *digest = [self HMACSHA256FromString:digestRaw withKey:sessionToken];

    return [NSString stringWithFormat:@"hmac %@:%@:%@", userId, unixtime, digest];
}

- (NSString *)HMACSHA256FromString:(NSString *)string withKey:(NSString *)key {

    const char *cKey  = [key cStringUsingEncoding:NSUTF8StringEncoding];
    const char *cString = [string cStringUsingEncoding:NSUTF8StringEncoding];
    unsigned char cHMAC[CC_SHA256_DIGEST_LENGTH];
    CCHmac(kCCHmacAlgSHA256, cKey, strlen(cKey), cString, strlen(cString), cHMAC);

    NSMutableString *hmac = [NSMutableString string];
    for (int i = 0; i < sizeof cHMAC; i++) {
        [hmac appendFormat:@"%02hhx", cHMAC[i]];
    }

    return hmac;
}

- (NSString *)_userAgent {
    
    NSBundle *bundle = [NSBundle mainBundle];

    NSString *buildName = [bundle objectForInfoDictionaryKey:@"CFBundleName"]; // AppName
    NSString *buildVersion = [bundle objectForInfoDictionaryKey:@"CFBundleVersion"]; // 251
    NSString *appVersion = [bundle objectForInfoDictionaryKey:@"CFBundleShortVersionString"]; // 1.2.3-production

    NSString *model = [self _model]; // iPhone 5S
    NSString *iosVersion = [[UIDevice currentDevice] systemVersion]; // 8.3

    // appVersion may have suffix, for example 1.2.3-production. We don't need it here
    NSRange range = [appVersion rangeOfString:@"-"];
    if (range.location != NSNotFound) {
        appVersion = [appVersion substringToIndex:range.location];
    }

    NSString *language = [[NSLocale currentLocale] localeIdentifier];

    // BestApp/2.0.0 (iOS 9.1; iPhone 5S; en-US; b2331) SoulSDK/1.0.1 (iOS)
    NSString *userAgent = [NSString stringWithFormat:@"%@/%@ (iOS %@; %@; %@; b%@) SoulSDK/1.0.1 (iOS)",
                           buildName,
                           appVersion,
                           iosVersion,
                           model,
                           language,
                           buildVersion
                           ];

    //userAgent = @"BestApp/2.0.0 (iOS 9.1; iPhone 5S; en-US; b2331) SoulSDK/1.0.1 (iOS)";
    return userAgent;
}

- (NSString *)_model {

    NSDictionary *hardware = @{
                               @"i386": @"Simulator",
                               @"x86_64": @"Simulator",
                               @"iPod1,1": @"iPod Touch",
                               @"iPod2,1": @"iPod Touch 2nd Generation",
                               @"iPod3,1": @"iPod Touch 3rd Generation",
                               @"iPod4,1": @"iPod Touch 4th Generation",
                               @"iPhone1,1": @"iPhone",
                               @"iPhone1,2": @"iPhone 3G",
                               @"iPhone2,1": @"iPhone 3GS",
                               @"iPhone3,1": @"iPhone 4",
                               @"iPhone4,1": @"iPhone 4S",
                               @"iPhone5,1": @"iPhone 5",
                               @"iPhone5,2": @"iPhone 5",
                               @"iPhone5,3": @"iPhone 5c",
                               @"iPhone5,4": @"iPhone 5c",
                               @"iPhone6,1": @"iPhone 5s",
                               @"iPhone6,2": @"iPhone 5s",
                               @"iPad1,1": @"iPad",
                               @"iPad2,1": @"iPad 2",
                               @"iPad3,1": @"iPad 3rd Generation ",
                               @"iPad3,4": @"iPad 4th Generation ",
                               @"iPad2,5": @"iPad Mini",
                               @"iPad4,4": @"iPad Mini 2nd Generation - Wifi",
                               @"iPad4,5": @"iPad Mini 2nd Generation - Cellular",
                               @"iPad4,1": @"iPad Air 5th Generation - Wifi",
                               @"iPad4,2": @"iPad Air 5th Generation - Cellular",
                               @"iPhone7,1": @"iPhone 6 Plus",
                               @"iPhone7,2": @"iPhone 6",
                               @"iPhone8,1": @"iPhone 6S (GSM+CDMA)",
                               @"iPhone8,2": @"iPhone 6S+ (GSM+CDMA)"
                               };

    struct utsname systemInfo;
    uname(&systemInfo);

    NSString *deviceType = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    NSString *model = [hardware objectForKey:deviceType];

    return model;
}

@end
