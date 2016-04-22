//
//  SLTextMessage.h
//  Pods
//
//  Created by Mikhail on 18.04.16.
//
//

#import <Foundation/Foundation.h>

@interface SLTextMessage :NSObject

+ (instancetype)messageWithText:(NSString *)text;

@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSString *userId;
@property (nonatomic, strong) NSNumber *messageId;
@property (nonatomic, strong) NSNumber *timestamp;

- (NSDictionary *)toDictionary;
+ (instancetype)messageFromDictionary:(NSDictionary *)dict;

@end
