//
//  SLChatsMany.h
//  Pods
//
//  Created by Mikhail on 01.03.16.
//
//

#import "SLObject.h"
#import "SLChat.h"
#import "SLAdditionalInfo.h"
#import "SLPagingAfterMeta.h"

@interface SLChatsMany :SLObject

@property (nonatomic, strong) NSArray <SLChat *> *chats;
@property (nonatomic, strong) SLPagingAfterMeta *meta;
@property (nonatomic, strong) SLAdditionalInfo *additionalInfo;

@end