//
//  SLCompleteAlbumsResponseMapperProtocol.h
//  Pods
//
//  Created by Mikhail on 07.04.16.
//
//

#import "SLObjectMapperProtocol.h"
#import "SLCompleteAlbumsResponse.h"

@protocol SLCompleteAlbumsResponseMapperProtocol <SLObjectMapperProtocol>

@required
- (SLCompleteAlbumsResponse *)mapCompleteAlbumsResponse:(id)dict;

@end