//
//  SLAlbumResponse.h
//  Pods
//
//  Created by Mikhail on 01.04.16.
//
//

#import "SLObject.h"
#import "SLCompleteAlbum.h"
#import "SLAdditionalInfo.h"

@interface SLAlbumResponse :SLObject

@property (nonatomic, strong) SLCompleteAlbum *album;
@property (nonatomic, strong) SLAdditionalInfo *additionalInfo;

@end
