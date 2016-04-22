//
//  SLUserMapperProtocol.h
//  Pods
//
//  Created by Mikhail on 08.03.16.
//
//

#import "SLMeUser.h"
#import "SLUser.h"

@protocol SLUserMapperProtocol

@required
- (SLMeUser *)mapMeUser:(id)dict;
- (SLUser *)mapOtherUser:(id)dict;

@end