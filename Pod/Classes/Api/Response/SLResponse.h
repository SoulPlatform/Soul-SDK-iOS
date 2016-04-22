//
//  SLResponse.h
//  Pods
//
//  Created by Mikhail on 26.03.16.
//
//

#import <Foundation/Foundation.h>
@class SLRequest;

@interface SLResponse :NSObject

@property (nonatomic, weak, nullable) SLRequest *request;
@property (nonatomic, strong, nullable) NSDictionary *dict;

@end
