//
//  SLPhoto.m
//  Pods
//
//  Created by Mikhail on 06.03.16.
//
//

#import "SLPhoto.h"

@implementation SLPhoto

+ (NSArray <NSString *> *)mandatoryFields {
    return @[
             @"photoId",
             @"expiresTime",
             @"isMain",
             @"original",
             ];
}

@end
