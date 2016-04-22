//
//  SLUserRecsMetaMapperProtocol.h
//  Pods
//
//  Created by Mikhail on 06.03.16.
//
//

#import "SLObjectMapperProtocol.h"
#import "SLUserRecsMeta.h"

@protocol SLUserRecsMetaMapperProtocol <SLObjectMapperProtocol>

@required
- (SLUserRecsMeta *)mapMeta:(id)dict;

@end