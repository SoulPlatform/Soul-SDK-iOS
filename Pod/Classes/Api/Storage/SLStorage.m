//
//  SLStorage.m
//  Pods
//
//  Created by Mikhail on 12.04.16.
//
//

#import "SLStorage.h"

@interface SLStorage ()
@property (nonatomic, strong) NSUserDefaults *userDefaults;
@end

static NSString *const kPrefix = @"SL";
static NSString *const kUserIdKey = @"USER_ID";
static NSString *const kSessionTokenKey = @"SESSION_TOKEN";

static NSString *const kPhoneNumberKey = @"PHONE_NUMBER";
static NSString *const kVerificationKey = @"VERIFICATION";

static NSString *const kNextMessageIdPrefix = @"NEXT_MESSAGE_ID";

@implementation SLStorage

- (instancetype)init {
    self = [super init];

    if (self) {
        _userDefaults = [NSUserDefaults standardUserDefaults];
    }

    return self;
}

#pragma mark SLStorageProtocol
- (void)cleanUp {
    [self removeObjectForKey:kUserIdKey];
    [self removeObjectForKey:kPhoneNumberKey];
    [self removeObjectForKey:kVerificationKey];
    [self removeObjectForKey:kSessionTokenKey];
}

// userId;
- (NSString *)userId {
    return [self objectForKey:kUserIdKey];
}

- (void)setUserId:(NSString *)userId {
    [self saveObject:userId forKey:kUserIdKey];
}

// sessionToken
- (NSString *)sessionToken {
    return [self objectForKey:kSessionTokenKey];
}

- (void)setSessionToken:(NSString *)sessionToken {
    [self saveObject:sessionToken forKey:kSessionTokenKey];
}

// phoneNumber
- (NSString *)phoneNumber {
    return [self objectForKey:kPhoneNumberKey];
}

- (void)setPhoneNumber:(NSString *)phoneNumber {
    [self saveObject:phoneNumber forKey:kPhoneNumberKey];
}

// verification
- (NSString *)verification {
    return [self objectForKey:kVerificationKey];
}

- (void)setVerification:(NSString *)verification {
    [self saveObject:verification forKey:kVerificationKey];
}

// nextMessageId
- (NSNumber *)nextMessageIdByChatId:(NSString *)chatId {

    NSString *nextMessageIdKey = [NSString stringWithFormat:@"%@/%@", kNextMessageIdPrefix, chatId];
    NSNumber *messageId = [self objectForKey:nextMessageIdKey];

    messageId = @([messageId integerValue] + 1);
    [self saveObject:messageId forKey:nextMessageIdKey];

    return messageId;
}

- (id)objectForKey:(NSString *)key {

    NSString *fixedKey = [self fixKey:key];

    return [_userDefaults objectForKey:fixedKey];
}

- (void)saveObject:(id)object forKey:(NSString *)key {

    if (object == nil) {
        return;
    }

    NSString *fixedKey = [self fixKey:key];

    [_userDefaults setObject:object forKey:fixedKey];
    [_userDefaults synchronize];
}

- (void)removeObjectForKey:(NSString *)key {

    NSString *fixedKey = [self fixKey:key];

    [_userDefaults removeObjectForKey:fixedKey];
    [_userDefaults synchronize];
}

- (NSString *)fixKey:(NSString *)key {

    return [NSString stringWithFormat:@"%@/%@", kPrefix, key];
}

@end
