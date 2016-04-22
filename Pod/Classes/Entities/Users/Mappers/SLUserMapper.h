//
//  SLUserMapper.h
//  Pods
//
//  Created by Mikhail on 08.03.16.
//
//

#import "SLObjectMapper.h"
#import "SLUserMapperProtocol.h"

@interface SLUserMapper :SLObjectMapper <SLUserMapperProtocol>

+ (EKObjectMapping *)userMapperAtClass:(Class)klass;

@end