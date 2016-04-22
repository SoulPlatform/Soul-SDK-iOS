//
//  SLTPhotoDataManager.m
//  SoulSDK
//
//  Created by Mikhail on 05.04.16.
//  Copyright © 2016 Mikhail Shershnev. All rights reserved.
//

#import "SLTPhotoDataManager.h"
#import "SLTAdditionalInfoDataManager.h"

NSString *_Nonnull const kTPhotoResponsePhotoKey = @"photo";
NSString *_Nonnull const kTPhotoResponseInfoKey = @"additionalInfo";

@implementation SLTPhotoDataManager

- (nonnull NSDictionary *)photoResponse {
    
    return @{
             kTPhotoResponsePhotoKey: [self photo],
             kTPhotoResponseInfoKey: [self info],
             };
}

- (nonnull NSDictionary *)photo {

    return @{
             @"id": @"rjyudlgbdu7",
             @"main": @(YES),
             @"expiresTime": @(1447196497.291),
             @"original": @{
                     @"url": @"http://example.com/path/to/photo/original.jpg",
                     @"width": @(640),
                     @"height": @(1136),
                     },
             @"300px": @{
                     @"url": @"http://example.com/path/to/photo/300px.jpg",
                     @"width": @(300),
                     @"height": @(580),
                     },
             };
}

- (nonnull NSDictionary *)info {
    SLTAdditionalInfoDataManager *infoData = [SLTAdditionalInfoDataManager new];
    return [infoData additionalInfo];
}


@end
