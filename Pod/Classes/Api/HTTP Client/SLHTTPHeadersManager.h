//
//  SLHTTPHeadersManager.h
//  Pods
//
//  Created by Mikhail on 12.04.16.
//
//

#import <Foundation/Foundation.h>
#import "SLHTTPRequest.h"
#import "SLStorageProtocol.h"

@interface SLHTTPHeadersManager :NSObject

- (NSDictionary *)headersByRequest:(SLHTTPRequest *)request andBody:(NSString *)body;
- (instancetype)initWithStorage:(NSObject <SLStorageProtocol> *)storage;

@end
