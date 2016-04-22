//
//  SLTUserDataManager.m
//  SoulSDK
//
//  Created by Mikhail on 29.03.16.
//  Copyright © 2016 Mikhail Shershnev. All rights reserved.
//

#import "SLTUserDataManager.h"
#import "SLTChatsDataManager.h"

NSString *const kIdKey = @"id";
NSString *const kTokensKey = @"notificationTokens";
NSString *const kServicesKey = @"subscriptionServices";
NSString *const kParametersKey = @"parameters";
NSString *const kAlbumsKey = @"albums";

NSString *const kRecordIdKey = @"recordId";
NSString *const kChatKey = @"chat";
NSString *const kReactionsKey = @"reactions";

@implementation SLTUserDataManager

- (nonnull NSDictionary *)meUser {
    return @{
             kIdKey: [self identifier],
             kTokensKey: [self tokens],
             kServicesKey: [self services],
             kParametersKey: [self parameters],
             kAlbumsKey: [self albums],
             };
}

- (NSString *)identifier {
    return @"kru5porj05h";
}

- (nonnull NSDictionary *)tokens {
    return @{
             @"GCM": [NSNull null],
             @"APNS": @"weoij*****************hjkewewj"
             };
}

- (nonnull NSDictionary *)services {
    return @{
             @"membership": @{
                     @"subscriptionId": @"gor3e73jf93",
                     @"expiresTime": @(1447116497.321)
                     }
             };
}

- (nonnull NSDictionary *)parameters {
    return @{
             @"private": @{},
             @"publicWritable": @{},
             @"publicVisible": @{
                     @"headline": @"Let's have some fun tonight!"
                     },
             @"filterable": @{
                     @"banned": @(NO),
                     @"availableTill": @(1447116497.321),
                     @"location": @{
                             @"lat": @(55.3422433),
                             @"lng": @(34.432432343),
                             },
                     @"gender": @"F",
                     @"lookingForGender": @"M"
                     },
             };
}

- (nonnull NSArray *)albums {
    NSDictionary *album = [self album];
    return @[album, album, album];
}

- (nonnull NSDictionary *)album {
    return @{
             @"name": @"someName",
             @"privacy": @"public",
             @"photoCount": @(1),
             @"order": @(10),
             @"parameters": @{
                     @"foo": @"bar"
                     },
             @"mainPhoto": @{
                     @"id": @"rjyudlgbdu7",
                     @"expiresTime": @(1447196497.291),
                     @"original": @{
                             @"url": @"http://example.com/path/to/photo/original.jpg",
                             @"width": @(640),
                             @"height": @(1136)
                             },
                     @"300px": @{
                             @"url": @"http://example.com/path/to/photo/300px.jpg",
                             @"width": @(300),
                             @"height": @(580)
                             },
                     @"main": @(YES)
                     }
             };
}

// other users
- (nonnull NSDictionary *)user {
    return @{
             kIdKey: [self identifier],
             kRecordIdKey: [self recordId],
             kChatKey: [self chat],
             kReactionsKey: [self reactions],
             kParametersKey: [self parameters],
             kAlbumsKey: [self albums],
             };
}

- (NSNumber *)recordId {
    return @(633424);
}

- (nonnull NSDictionary *)reactions {
    return @{
             @"sentByMe": @{
                     @"liking": @{
                             @"value": @"liked",
                             @"expiresTime": @(1447196497.291)
                             },
                     @"blocking": [NSNull null]
                     },
             @"receivedFromUser": @{
                     @"liking": @{
                             @"value": @"disliked",
                             @"expiresTime": @(1447190239.492)
                             },
                     @"blocking": @{
                             @"value": @"blocked",
                             @"expiresTime": @(1447190239.492)
                             }
                     }
             };
}

- (nonnull NSDictionary *)chat {

    SLTChatsDataManager *chatData = [SLTChatsDataManager new];

    return [chatData chat];
}

@end
