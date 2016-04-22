//
//  SLObjectCountMapper.m
//  Pods
//
//  Created by Mikhail on 26.02.16.
//
//

#import "SLObjectCountMapper.h"
#import "SLChatsObjectCountMapper.h"

@implementation SLObjectCountMapper

static NSString *const kChatsKey = @"chats";
static NSString *const kChatsProperty = @"chats";

+ (EKObjectMapping *)objectMapping {

    EKObjectMapping *mapper = [[EKObjectMapping alloc] initWithObjectClass:[SLObjectCount class]];

    [mapper hasOne:[SLChatsObjectCountMapper class] forKeyPath:kChatsKey forProperty:kChatsProperty];

    return mapper;
}

- (SLObjectCount *)mapObjectCount:(id)dict {
    return [self map:dict];
}

@end
