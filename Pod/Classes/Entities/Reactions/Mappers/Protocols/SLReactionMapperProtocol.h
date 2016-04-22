//
//  SLReactionMapperProtocol.h
//  Pods
//
//  Created by Mikhail on 08.03.16.
//
//

#import "SLObjectMapperProtocol.h"
#import "SLReaction.h"

@protocol SLReactionMapperProtocol <SLObjectMapperProtocol>

@required
- (SLReaction *)mapReaction:(id)dict atType:(NSString *)type;

@end