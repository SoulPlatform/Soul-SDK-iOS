//
//  SLAlbumResponseMapperProtocol.h
//  Pods
//
//  Created by Mikhail on 01.04.16.
//
//

#import "SLObjectMapperProtocol.h"
#import "SLAlbumResponse.h"

@protocol SLAlbumResponseMapperProtocol <SLObjectMapperProtocol>

@required
- (SLAlbumResponse *)mapAlbumResponse:(id)dict;

@end