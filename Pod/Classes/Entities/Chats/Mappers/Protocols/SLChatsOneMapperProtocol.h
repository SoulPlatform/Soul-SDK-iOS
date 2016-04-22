//
//  SLChatsOneMapperProtocol.h
//  Pods
//
//  Created by Mikhail on 01.03.16.
//
//

#import "SLObjectMapperProtocol.h"
#import "SLChatsOne.h"

@protocol SLChatsOneMapperProtocol <SLObjectMapperProtocol>

@required
- (SLChatsOne *)mapChatsOne:(id)dict;

@end