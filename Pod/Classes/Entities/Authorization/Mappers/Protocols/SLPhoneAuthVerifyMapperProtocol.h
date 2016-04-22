//
//  SLPhoneAuthVerifyMapperProtocol.h
//  Pods
//
//  Created by Mikhail on 28.03.16.
//
//

#import "SLObjectMapperProtocol.h"
#import "SLPhoneAuthVerify.h"

@protocol SLPhoneAuthVerifyMapperProtocol <SLObjectMapperProtocol>

@required
- (SLPhoneAuthVerify *)mapPhoneAuthVerify:(id)dict;

@end