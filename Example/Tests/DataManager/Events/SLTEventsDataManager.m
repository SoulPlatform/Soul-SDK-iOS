//
//  SLTEventsDataManager.m
//  SoulSDK
//
//  Created by Mikhail on 11.04.16.
//  Copyright © 2016 Mikhail Shershnev. All rights reserved.
//

#import "SLTEventsDataManager.h"
#import "SLTUserDataManager.h"
#import "SLTChatsDataManager.h"

NSString *_Nonnull const kTEIdKey = @"recordId";
NSString *_Nonnull const kTETimeKey = @"time";
NSString *_Nonnull const kTETypeKey = @"type";
NSString *_Nonnull const kTEObjectKey = @"object";
NSString *_Nonnull const kTEActionKey = @"action";

@implementation SLTEventsDataManager

- (nonnull NSNumber *)eventId {
    return @(14);
}

- (nonnull NSNumber *)eventTime {
    return @(13424123423.239);
}

// meEvent
- (nonnull NSDictionary *)meEvent {

    NSString *kMeKey = @"me";

    return @{
             kMeKey: [self meDict],
             kTETypeKey: [self meType],

             kTEIdKey: [self eventId],
             kTETimeKey: [self eventTime],
             };
}

- (nonnull NSDictionary *)meType {

    return @{
             kTEObjectKey: @"me",
             kTEActionKey: @"change",
             };
}

- (nonnull NSDictionary *)meDict {

    SLTUserDataManager *userData = [SLTUserDataManager new];
    return [userData meUser];
}

// userEvent
- (nonnull NSDictionary *)userEvent {

    NSString *kUserKey = @"user";

    return @{
             kUserKey: [self userDict],
             kTETypeKey: [self userType],

             kTEIdKey: [self eventId],
             kTETimeKey: [self eventTime],
             };
}

- (nonnull NSDictionary *)userType {

    return @{
             kTEObjectKey: @"user",
             kTEActionKey: @"change",
             };
}

- (nonnull NSDictionary *)userDict {

    SLTUserDataManager *userData = [SLTUserDataManager new];
    return [userData user];
}

// chatEvent;
- (nonnull NSDictionary *)chatEvent {

    NSString *kChatKey = @"chat";

    return @{
             kChatKey: [self chatDict],
             kTETypeKey: [self chatType],

             kTEIdKey: [self eventId],
             kTETimeKey: [self eventTime],
             };
}

- (nonnull NSDictionary *)chatType {

    return @{
             kTEObjectKey: @"chat",
             kTEActionKey: @"change",
             };
}

- (nonnull NSDictionary *)chatDict {

    SLTChatsDataManager *chatData = [SLTChatsDataManager new];
    return [chatData chat];
}

// endpointEvent
- (nonnull NSDictionary *)endpointEvent {

    NSString *kEndpointKey = @"endpoint";

    return @{
             kEndpointKey: [self endpointDict],
             kTETypeKey: [self endpointType],

             kTEIdKey: [self eventId],
             kTETimeKey: [self eventTime],
             };
}

- (nonnull NSDictionary *)endpointType {

    return @{
             kTEObjectKey: @"endpoint",
             kTEActionKey: @"addition",
             };
}

- (nonnull NSDictionary *)endpointDict {

    return @{
             @"uri": @"/users/recommendations",
             @"type": @"newItems"
             };
}

// reactionsEvent
- (nonnull NSDictionary *)reactionsEvent {

    NSString *kReactionsKey = @"reactions";

    return @{
             kReactionsKey: [self reactionsDict],
             kTETypeKey: [self reactionsType],
             
             kTEIdKey: [self eventId],
             kTETimeKey: [self eventTime],
             };
}

- (nonnull NSDictionary *)reactionsType {

    return @{
             kTEObjectKey: @"reactions",
             kTEActionKey: @"change",
             };
}

- (nonnull NSDictionary *)reactionsDict {

    return @{
             @"user": @{
                     @"id": @"3vn2ivwm13z"
                     },
             @"receivedFromUser": @{
                     @"liking": @{
                             @"value": @"disliked",
                             @"expiresTime": @(1447190239.492)
                             },
                     @"blocking": [NSNull null],
                     }
             };
}

@end
