//
//  SLPhotoURLMapperProtocol.h
//  Pods
//
//  Created by Mikhail on 06.03.16.
//
//

#import "SLObjectMapperProtocol.h"
#import "SLPhotoURL.h"

@protocol SLPhotoURLMapperProtocol <SLObjectMapperProtocol>

@required
- (SLPhotoURL *)mapPhotoURL:(id)dict;

@end