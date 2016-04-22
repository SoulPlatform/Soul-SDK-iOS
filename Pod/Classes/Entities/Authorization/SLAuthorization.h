//
//  SLAuthorization.h
//  Pods
//
//  Created by Mikhail on 12.02.16.
//
//

#import "SLObject.h"

@interface SLAuthorization :SLObject

@property (nonatomic, strong) NSNumber *expiresTime;
@property (nonatomic, strong) NSString *sessionToken;

@end
