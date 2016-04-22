//
//  SLTextMessage.m
//  Pods
//
//  Created by Mikhail on 18.04.16.
//
//

#import "SLTextMessage.h"
#import "NSMutableDictionary+SLHelper.h"

@implementation SLTextMessage

+ (instancetype)messageWithText:(NSString *)text {

    SLTextMessage *msg = [SLTextMessage new];

    msg.text = text;
    return msg;
}

- (NSDictionary *)toDictionary {

    NSMutableDictionary *dict = [NSMutableDictionary new];

    [dict forKey:@"m" setValue:_text];
    [dict forKey:@"t" setValue:_timestamp];
    [dict forKey:@"id" setValue:_messageId];
    [dict forKey:@"u" setValue:_userId];

    return [dict copy];
}

+ (instancetype)messageFromDictionary:(NSDictionary *)dict {
    SLTextMessage *message = [SLTextMessage new];

    message.text = dict[@"m"];
    message.userId = dict[@"u"];
    message.messageId = dict[@"id"];
    message.timestamp = dict[@"t"];

    return message;
}

@end
