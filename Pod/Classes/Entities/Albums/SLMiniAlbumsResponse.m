//
//  SLMiniAlbumsResponse.m
//  Pods
//
//  Created by Mikhail on 30.03.16.
//
//

#import "SLMiniAlbumsResponse.h"

@implementation SLMiniAlbumsResponse

+ (NSArray <NSString *> *)mandatoryFields {

    return @[
             @"meta",
             @"albums",
             @"additionalInfo",
             ];
}

@end
