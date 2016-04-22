//
//  SLEventReactionsMapper.m
//  Pods
//
//  Created by Mikhail on 16.03.16.
//
//

#import "SLEventReactionsMapper.h"
#import "SLReactionsMapper.h"
#import "SLEventReactionsUserMapper.h"

static NSString *const kUserKey = @"user";
static NSString *const kUserProp = @"user";

static NSString *const kReactionsKey = @"receivedFromUser";
static NSString *const kReactionsProp = @"received";

@implementation SLEventReactionsMapper

+ (EKObjectMapping *)objectMapping {

    EKObjectMapping *mapper = [[EKObjectMapping alloc] initWithObjectClass:[SLEventReactions class]];

    Class reactionsClass = [SLReactionsMapper class];
    Class userClass = [SLEventReactionsUserMapper class];

    [mapper hasOne:userClass      forKeyPath:kUserKey      forProperty:kUserProp     ];
    [mapper hasOne:reactionsClass forKeyPath:kReactionsKey forProperty:kReactionsProp];

    return mapper;
}

#pragma mark SLEventReactionsMapperProtocol
- (SLEventReactions *)mapEventReactions:(id)dict {
    return [self map:dict];
}

@end
