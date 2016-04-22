//
//  SLEventReactionsUserMapper.m
//  Pods
//
//  Created by Mikhail on 16.03.16.
//
//

#import "SLEventReactionsUserMapper.h"

static NSString *const kUserIdKey = @"id";
static NSString *const kUserIdProp = @"userId";

@implementation SLEventReactionsUserMapper

+ (EKObjectMapping *)objectMapping {

    EKObjectMapping *mapper = [[EKObjectMapping alloc] initWithObjectClass:[SLEventReactionsUser class]];

    EKMappingValueBlock stringBlock = [self stringValueBlock];

    [mapper mapKeyPath:kUserIdKey toProperty:kUserIdProp withValueBlock:stringBlock];

    return mapper;
}

#pragma mark SLEventReactionsUserMapperProtocol
- (SLEventReactionsUser *)mapEventReactionsUser:(id)dict {
    return [self map:dict];
}

@end
