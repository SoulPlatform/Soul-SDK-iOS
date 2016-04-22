//
//  SLChatsOne.h
//  Pods
//
//  Created by Mikhail on 01.03.16.
//
//

#import "SLObject.h"
#import "SLChat.h"
#import "SLAdditionalInfo.h"

@interface SLChatsOne :SLObject

@property (nonatomic, strong) SLChat *chat;
@property (nonatomic, strong) SLAdditionalInfo *additionalInfo;

@end