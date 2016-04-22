//
//  SLTHttpClientMock.h
//  SoulSDK
//
//  Created by Mikhail on 29.03.16.
//  Copyright © 2016 Mikhail Shershnev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SLHttpClientProtocol.h"

@interface SLTHttpClientMock :NSObject

+ (nonnull NSObject <SLHttpClientProtocol> *)executedFailure;
+ (nonnull NSObject <SLHttpClientProtocol> *)executedFailureWithError:(nonnull NSError *)error;

+ (nonnull NSObject <SLHttpClientProtocol> *)executedSuccessfullyWithStatusCode:(NSInteger)statusCode
                                                                       response:(id _Nullable)response;
@end
