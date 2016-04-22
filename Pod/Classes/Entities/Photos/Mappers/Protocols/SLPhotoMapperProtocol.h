//
//  SLPhotoMapperProtocol.h
//  Pods
//
//  Created by Mikhail on 06.03.16.
//
//

#import "SLObjectMapperProtocol.h"
#import "SLPhoto.h"

@protocol SLPhotoMapperProtocol <SLObjectMapperProtocol>

@required
- (SLPhoto *)mapPhoto:(id)dict;

@end