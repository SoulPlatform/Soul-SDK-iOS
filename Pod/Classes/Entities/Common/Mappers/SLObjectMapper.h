//
//  SLObjectMapper.h
//  Pods
//
//  Created by Mikhail on 04.02.16.
//
//

#import <Foundation/Foundation.h>
#import "SLObjectMapperProtocol.h"

@interface SLObjectMapper :NSObject <SLObjectMapperProtocol>

- (id)map:(id)dict;
- (id)map:(id)dict mapperObject:(EKObjectMapping *)mapperObject;

// check all mandatory fields at mapping object
// return eligible object if all mandatory fields are existing
// otherwise return nil
- (id)checkMandatoryFields:(id)object;

+ (EKMappingValueBlock)stringValueBlock;
+ (EKMappingValueBlock)urlValueBlock;
+ (EKMappingValueBlock)integerValueBlock;
+ (EKMappingValueBlock)doubleValueBlock;
+ (EKMappingValueBlock)boolValueBlock;

@end
