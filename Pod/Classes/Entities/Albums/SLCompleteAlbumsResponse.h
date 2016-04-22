//
//  SLCompleteAlbumsResponse.h
//  Pods
//
//  Created by Mikhail on 07.04.16.
//
//

#import "SLObject.h"
#import "SLCompleteAlbum.h"
#import "SLAdditionalInfo.h"
#import "SLPagingOffsetMeta.h"

@interface SLCompleteAlbumsResponse :SLObject

@property (nonatomic, strong) NSArray <SLCompleteAlbum *> *albums;
@property (nonatomic, strong) SLAdditionalInfo *additionalInfo;
@property (nonatomic, strong) SLPagingOffsetMeta *meta;

@end