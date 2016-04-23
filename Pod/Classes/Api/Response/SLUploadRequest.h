//
//  SLUploadRequest.h
//  Pods
//
//  Created by Mikhail on 05.04.16.
//
//

#import "SLHTTPRequest.h"

@interface SLUploadRequest :SLHTTPRequest

@property (nonatomic, strong, readonly, nonnull) NSMutableDictionary <NSString *, NSData*> *uploads;

- (void)addData:(nonnull NSData *)data name:(nonnull NSString *)name;

@end
