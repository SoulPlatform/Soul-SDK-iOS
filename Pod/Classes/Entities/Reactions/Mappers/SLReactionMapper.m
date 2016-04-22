//
//  SLReactionMapper.m
//  Pods
//
//  Created by Mikhail on 08.03.16.
//
//

#import "SLReactionMapper.h"
#import "SLReaction.h"

static NSString *const kValueKey = @"value";
static NSString *const kValueProp = @"value";

static NSString *const kExpiresTimeKey = @"expiresTime";
static NSString *const kExpiresTimeProp = @"expiresTime";

@implementation SLReactionMapper

+ (EKObjectMapping *)objectMapping {
    
    EKObjectMapping *mapper = [[EKObjectMapping alloc] initWithObjectClass:[SLReaction class]];

    EKMappingValueBlock doubleBlock = [self doubleValueBlock];
    EKMappingValueBlock stringBlock = [self stringValueBlock];

    [mapper mapKeyPath:kValueKey toProperty:kValueProp withValueBlock:stringBlock];
    [mapper mapKeyPath:kExpiresTimeKey toProperty:kExpiresTimeProp withValueBlock:doubleBlock];

    return mapper;
}

- (SLReaction *)mapReaction:(id)dict atType:(NSString *)type {

    SLReaction *reaction = [self map:dict];
    reaction.type = type;

    return reaction;
}

@end
