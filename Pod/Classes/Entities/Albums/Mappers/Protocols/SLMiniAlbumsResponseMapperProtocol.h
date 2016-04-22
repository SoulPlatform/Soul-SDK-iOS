//
//  SLMiniAlbumsResponseMapperProtocol.h
//  Pods
//
//  Created by Mikhail on 30.03.16.
//
//

#import "SLObjectMapperProtocol.h"
#import "SLMiniAlbumsResponse.h"

@protocol SLMiniAlbumsResponseMapperProtocol <SLObjectMapperProtocol>

@required
- (SLMiniAlbumsResponse *)mapMiniAlbumsResponse:(id)dict;

@end