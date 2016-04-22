//
//  SLEventReactionsUserMapperProtocol.h
//  Pods
//
//  Created by Mikhail on 16.03.16.
//
//

#import "SLObjectMapperProtocol.h"
#import "SLEventReactionsUser.h"

@protocol SLEventReactionsUserMapperProtocol <SLObjectMapperProtocol>

@required
- (SLEventReactionsUser *)mapEventReactionsUser:(id)dict;

@end