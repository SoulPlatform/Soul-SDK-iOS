//
//  SLPhoneAuthRequestMapperProtocol.h
//  Pods
//
//  Created by Mikhail on 01.03.16.
//
//

#import "SLObjectMapperProtocol.h"
#import "SLPhoneAuthRequest.h"

@protocol SLPhoneAuthRequestMapperProtocol <SLObjectMapperProtocol>

@required
- (SLPhoneAuthRequest *)mapPhoneAuthRequest:(id)dict;

@end