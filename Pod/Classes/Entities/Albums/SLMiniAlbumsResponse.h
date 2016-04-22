//
//  SLMiniAlbumsResponse.h
//  Pods
//
//  Created by Mikhail on 30.03.16.
//
//

#import "SLObject.h"
#import "SLMiniAlbum.h"
#import "SLAdditionalInfo.h"
#import "SLPagingOffsetMeta.h"

@interface SLMiniAlbumsResponse :SLObject

@property (nonatomic, strong) NSArray <SLMiniAlbum *> *albums;
@property (nonatomic, strong) SLAdditionalInfo *additionalInfo;
@property (nonatomic, strong) SLPagingOffsetMeta *meta;

@end
