//
//  SLChat.h
//  Pods
//
//  Created by Mikhail on 01.03.16.
//
//

#import "SLObject.h"

@interface SLChat :SLObject

@property (nonatomic, strong) NSString *chatId;
@property (nonatomic, strong) NSString *partnerId;
@property (nonatomic, strong) NSString *channelName;

@property (nonatomic, strong) NSString *expiresTime;
@property (nonatomic, strong) NSString *deletedByMe;
@property (nonatomic, strong) NSString *deletedByPartner;

@end
