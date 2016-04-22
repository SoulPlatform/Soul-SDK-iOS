//
//  SLReactionsMapper.m
//  Pods
//
//  Created by Mikhail on 08.03.16.
//
//

#import "SLReactionsMapper.h"
#import "SLReactionMapper.h"

static NSString *const kSentByMeKey = @"sentByMe";
static NSString *const kReceivedKey = @"receivedFromUser";

@implementation SLReactionsMapper

+ (EKObjectMapping *)objectMapping {

    EKObjectMapping *mapper = [[EKObjectMapping alloc] initWithObjectClass:[SLReactions class]];
    return mapper;
}

- (SLReactions *)mapReactions:(id)dict {

    SLReactions *reactions = [self map:dict];

    if (reactions) {

        NSObject<SLReactionMapperProtocol> *mapper = [SLReactionMapper new];

        NSDictionary *sentByMe = dict[kSentByMeKey];
        NSMutableArray *sentByMeArray = [NSMutableArray array];

        for (NSString *type in sentByMe.allKeys) {

            NSDictionary *reactionDict = sentByMe[type];
            SLReaction *reaction = [mapper mapReaction:reactionDict atType:type];

            if (reaction) {
                [sentByMeArray addObject:reaction];
            }
        }
        reactions.sentByMe = sentByMeArray;

        NSDictionary *received = dict[kReceivedKey];
        NSMutableArray *receivedArray = [NSMutableArray array];

        for (NSString *type in received.allKeys) {

            NSDictionary *reactionDict = received[type];
            SLReaction *reaction = [mapper mapReaction:reactionDict atType:type];

            if (reaction) {
                [receivedArray addObject:reaction];
            }
        }
        reactions.receivedFromUser = receivedArray;

    }

    return reactions;
}

@end