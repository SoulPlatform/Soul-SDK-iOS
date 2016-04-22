//
//  SLAlbum.m
//  Pods
//
//  Created by Mikhail on 06.03.16.
//
//

#import "SLAlbum.h"

@implementation SLAlbum

+ (NSArray <NSString *> *)mandatoryFields {

    return @[
             @"name",
             @"privacy",
             @"photoCount",
             @"parameters",
             @"mainPhoto",
             ];
}

@end
