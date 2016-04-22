//
//  SLError.h
//  Pods
//
//  Created by Mikhail on 12.02.16.
//
//

#import "SLObject.h"

@interface SLError :SLObject

@property (nonatomic, strong) NSNumber *code;
@property (nonatomic, strong) NSString *alias;
@property (nonatomic, strong) NSString *userMessage;
@property (nonatomic, strong) NSString *developerMessage;

@end
