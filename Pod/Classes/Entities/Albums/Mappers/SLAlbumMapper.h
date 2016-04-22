//
//  SLAlbumMapper.h
//  Pods
//
//  Created by Mikhail on 06.03.16.
//
//

#import "SLObjectMapper.h"
#import "SLAlbumMapperProtocol.h"

@interface SLAlbumMapper :SLObjectMapper <SLAlbumMapperProtocol>

+ (EKObjectMapping *)albumMapperAtClass:(Class)klass;

@end