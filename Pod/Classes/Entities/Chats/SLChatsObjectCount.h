//
//  SLChatsObjectCount.h
//  Pods
//
//  Created by Mikhail on 26.02.16.
//
//

#import "SLObject.h"

@interface SLChatsObjectCount :SLObject

@property (nonatomic, strong) NSNumber *notDeletedByMe;
@property (nonatomic, strong) NSNumber *notDeletedByAnyone;
@property (nonatomic, strong) NSNumber *notExpiredAndNotDeletedByAnyone;

@end
