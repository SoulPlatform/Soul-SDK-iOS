//
//  SLCompleteAlbum.m
//  Pods
//
//  Created by Mikhail on 08.03.16.
//
//

#import "SLCompleteAlbum.h"

@implementation SLCompleteAlbum

+ (NSArray <NSString *> *)mandatoryFields {

    NSArray *mandatoryFields = [super mandatoryFields];
    NSArray *_mandatoryFields = @[
                                  @"photos",
                                  ];

    return [mandatoryFields arrayByAddingObjectsFromArray:_mandatoryFields];
}

@end
