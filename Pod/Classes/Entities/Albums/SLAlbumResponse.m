//
//  SLAlbumResponse.m
//  Pods
//
//  Created by Mikhail on 01.04.16.
//
//

#import "SLAlbumResponse.h"

@implementation SLAlbumResponse

+ (NSArray <NSString *> *)mandatoryFields {
    
    return @[
             @"album",
             @"additionalInfo",
             ];
}

@end
