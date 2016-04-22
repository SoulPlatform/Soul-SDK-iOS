//
//  SLReaction.h
//  Pods
//
//  Created by Mikhail on 08.03.16.
//
//

#import "SLObject.h"

@interface SLReaction :SLObject

@property (nonatomic, strong) NSString *type;

@property (nonatomic, strong) NSString *value;
@property (nonatomic, strong) NSNumber *expiresTime;

@end
