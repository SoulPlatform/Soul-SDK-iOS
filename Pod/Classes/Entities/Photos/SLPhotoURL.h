//
//  SLPhotoURL.h
//  Pods
//
//  Created by Mikhail on 06.03.16.
//
//

#import "SLObject.h"

@interface SLPhotoURL :SLObject

@property (nonatomic, strong) NSURL *url;
@property (nonatomic, strong) NSNumber *width;
@property (nonatomic, strong) NSNumber *height;

@end