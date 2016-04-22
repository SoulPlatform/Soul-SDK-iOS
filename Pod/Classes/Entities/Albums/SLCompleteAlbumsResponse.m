//
//  SLCompleteAlbumsResponse.m
//  Pods
//
//  Created by Mikhail on 07.04.16.
//
//

#import "SLCompleteAlbumsResponse.h"

@implementation SLCompleteAlbumsResponse

+ (NSArray <NSString *> *)mandatoryFields {
    
    return @[
             @"meta",
             @"albums",
             @"additionalInfo",
             ];
}

@end