//
//  SLPhotoURL.m
//  Pods
//
//  Created by Mikhail on 06.03.16.
//
//

#import "SLPhotoURL.h"

@implementation SLPhotoURL

+ (NSArray <NSString *> *)mandatoryFields {
    return @[
             @"url",
             @"width",
             @"height",
             ];
}

@end
