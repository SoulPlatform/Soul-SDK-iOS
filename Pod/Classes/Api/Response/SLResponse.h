//
//  SLResponse.h
//  Pods
//
//  Created by Mikhail on 26.03.16.
//
//

#import <Foundation/Foundation.h>
@class SLHTTPRequest;

@interface SLResponse :NSObject

@property (nonatomic, weak, nullable) SLHTTPRequest *request;
@property (nonatomic, strong, nullable) NSDictionary *dict;

@end
