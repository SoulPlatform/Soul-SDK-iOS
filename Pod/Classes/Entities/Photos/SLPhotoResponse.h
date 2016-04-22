//
//  SLPhotoResponse.h
//  Pods
//
//  Created by Mikhail on 05.04.16.
//
//

#import "SLPhoto.h"
#import "SLAdditionalInfo.h"

@interface SLPhotoResponse :SLObject

@property (nonatomic, strong) SLPhoto *photo;
@property (nonatomic, strong) SLAdditionalInfo *additionalInfo;

@end
