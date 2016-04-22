//
//  SLPagingAfterMeta.h
//  Pods
//
//  Created by Mikhail on 07.03.16.
//
//

#import "SLObject.h"

@interface SLPagingAfterMeta :SLObject

@property (nonatomic, strong) NSNumber *after;
@property (nonatomic, strong) NSNumber *limit;
@property (nonatomic, strong) NSNumber *total;

@end