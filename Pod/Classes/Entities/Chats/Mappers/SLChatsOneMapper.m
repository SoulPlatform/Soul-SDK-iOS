//
//  SLChatsOneMapper.m
//  Pods
//
//  Created by Mikhail on 01.03.16.
//
//

#import "SLChatsOneMapper.h"
#import "SLChatMapper.h"
#import "SLAdditionalInfoMapper.h"

static NSString *const kChatKey = @"chat";
static NSString *const kChatProperty = @"chat";

static NSString *const kAdditionalInfoKey = @"additionalInfo";
static NSString *const kAdditionalInfoProperty = @"additionalInfo";

@implementation SLChatsOneMapper

+ (EKObjectMapping *)objectMapping {

    EKObjectMapping *mapper = [[EKObjectMapping alloc] initWithObjectClass:[SLChatsOne class]];

    Class chatClass = [SLChatMapper class];
    Class infoClass = [SLAdditionalInfoMapper class];

    [mapper hasOne:chatClass forKeyPath:kChatKey forProperty:kChatProperty];
    [mapper hasOne:infoClass forKeyPath:kAdditionalInfoKey forProperty:kAdditionalInfoProperty];

    return mapper;
}

- (SLChatsOne *)mapChatsOne:(id)dict {
    return [self map:dict];
}

@end
