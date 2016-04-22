//
//  SLUploadRequest.h
//  Pods
//
//  Created by Mikhail on 05.04.16.
//
//

#import "SLRequest.h"

@interface SLUploadRequest :SLRequest

@property (nonatomic, strong, readonly, nonnull) NSMutableDictionary <NSString *, NSData*> *uploads;

- (void)addData:(nonnull NSData *)data name:(nonnull NSString *)name;

@end
