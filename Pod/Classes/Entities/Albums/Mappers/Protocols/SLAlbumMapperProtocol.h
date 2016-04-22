//
//  SLAlbumMapperProtocol.h
//  Pods
//
//  Created by Mikhail on 06.03.16.
//
//

#import "SLMiniAlbum.h"
#import "SLCompleteAlbum.h"

@protocol SLAlbumMapperProtocol

@required
- (SLMiniAlbum *)mapMiniAlbum:(id)dict;
- (SLCompleteAlbum *)mapCompleteAlbum:(id)dict;

@end