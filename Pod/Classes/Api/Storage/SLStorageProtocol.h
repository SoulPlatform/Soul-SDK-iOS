//
//  SLStorageProtocol.h
//  Pods
//
//  Created by Mikhail on 12.04.16.
//
//

#import <Foundation/Foundation.h>
#import "SLAuthorization.h"

@protocol SLStorageProtocol <NSObject>

@required

@property (nonatomic, strong) NSString *userId;
@property (nonatomic, strong) NSString *sessionToken;

@property (nonatomic, strong) NSString *phoneNumber;
@property (nonatomic, strong) NSString *verification;

- (NSNumber *)nextMessageIdByChatId:(NSString *)chatId;

- (void)cleanUp;

@end
