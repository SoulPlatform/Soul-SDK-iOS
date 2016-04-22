//
//  SLPhotoResponse.m
//  Pods
//
//  Created by Mikhail on 05.04.16.
//
//

#import "SLPhotoResponse.h"

@implementation SLPhotoResponse

+ (NSArray <NSString *> *)mandatoryFields {
    
    return @[
             @"photo",
             @"additionalInfo",
             ];
}

@end
