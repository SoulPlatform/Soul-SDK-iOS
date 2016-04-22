//
//  SLPhoto.h
//  Pods
//
//  Created by Mikhail on 06.03.16.
//
//

#import "SLObject.h"
#import "SLPhotoURL.h"

@interface SLPhoto :SLObject

@property (nonatomic, strong) NSString *photoId;
@property (nonatomic, strong) NSNumber *expiresTime;
@property (nonatomic, strong) NSNumber *isMain;
@property (nonatomic, strong) SLPhotoURL *original;

@end