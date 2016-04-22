//
//  SLEventMapper.h
//  Pods
//
//  Created by Mikhail on 09.03.16.
//
//

#import "SLObjectMapper.h"
#import "SLEventMapperProtocol.h"

@interface SLEventMapper :SLObjectMapper <SLEventMapperProtocol>

+ (EKObjectMapping *)eventMapperAtClass:(Class)klass;

@end