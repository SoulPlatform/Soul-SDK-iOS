//
//  SLPhotoResponseMapperProtocol.h
//  Pods
//
//  Created by Mikhail on 05.04.16.
//
//

#import "SLObjectMapperProtocol.h"
#import "SLPhotoResponse.h"

@protocol SLPhotoResponseMapperProtocol <SLObjectMapperProtocol>

@required
- (SLPhotoResponse *)mapPhotoResponse:(id)dict;

@end