//
//  SLPagingOffsetMetaMapperProtocol.h
//  Pods
//
//  Created by Mikhail on 07.03.16.
//
//

#import "SLObjectMapperProtocol.h"
#import "SLPagingOffsetMeta.h"

@protocol SLPagingOffsetMetaMapperProtocol <SLObjectMapperProtocol>

@required
- (SLPagingOffsetMeta *)mapOffsetMeta:(id)dict;

@end