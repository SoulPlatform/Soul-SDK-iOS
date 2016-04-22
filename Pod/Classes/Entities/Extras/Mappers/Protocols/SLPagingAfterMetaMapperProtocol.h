//
//  SLPagingAfterMetaMapperProtocol.h
//  Pods
//
//  Created by Mikhail on 07.03.16.
//
//

#import "SLObjectMapperProtocol.h"
#import "SLPagingAfterMeta.h"

@protocol SLPagingAfterMetaMapperProtocol <SLObjectMapperProtocol>

@required
- (SLPagingAfterMeta *)mapAfterMeta:(id)dict;

@end
