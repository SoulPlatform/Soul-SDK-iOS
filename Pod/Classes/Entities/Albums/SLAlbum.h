//
//  SLAlbum.h
//  Pods
//
//  Created by Mikhail on 06.03.16.
//
//

#import "SLObject.h"
#import "SLPhoto.h"

typedef NS_ENUM(NSInteger, SLAlbumPrivacy) {
    SLAlbumPrivacyUnknown = 0,
    SLAlbumPrivacyPrivate,
    SLAlbumPrivacyPublic,
};

@interface SLAlbum :SLObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) SLAlbumPrivacy privacy; // SLAlbumPrivacy
@property (nonatomic, strong) NSNumber *photoCount;
@property (nonatomic, strong) NSDictionary *parameters;
@property (nonatomic, strong) SLPhoto *mainPhoto;

@end