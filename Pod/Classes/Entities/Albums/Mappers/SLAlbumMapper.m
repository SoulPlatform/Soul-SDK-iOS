//
//  SLAlbumMapper.m
//  Pods
//
//  Created by Mikhail on 06.03.16.
//
//

#import "SLAlbumMapper.h"
#import "SLPhotoMapper.h"

#import "SLMiniAlbumMapper.h"
#import "SLCompleteAlbumMapper.h"

static NSString *const kNameKey = @"name";
static NSString *const kNameProp = @"name";

static NSString *const kPrivacyKey = @"privacy";
static NSString *const kPrivacyProp = @"privacy";

static NSString *const kPhotoCountKey = @"photoCount";
static NSString *const kPhotoCountProp = @"photoCount";

static NSString *const kParametersKey = @"parameters";
static NSString *const kParametersProp = @"parameters";

static NSString *const kMainPhotoKey = @"mainPhoto";
static NSString *const kMainPhotoProp = @"mainPhoto";

@implementation SLAlbumMapper

+ (EKObjectMapping *)albumMapperAtClass:(Class)klass {

    EKObjectMapping *mapper = [[EKObjectMapping alloc] initWithObjectClass:klass];

    EKMappingValueBlock stringBlock = [self stringValueBlock];
    EKMappingValueBlock integerBlock = [self integerValueBlock];
    EKMappingValueBlock privacyBlock = [self privacyValueBlock];

    [mapper mapKeyPath:kNameKey toProperty:kNameProp withValueBlock:stringBlock];
    [mapper mapKeyPath:kPrivacyKey toProperty:kPrivacyProp withValueBlock:privacyBlock];
    [mapper mapKeyPath:kPhotoCountKey toProperty:kPhotoCountProp withValueBlock:integerBlock];

    [mapper mapKeyPath:kParametersKey toProperty:kParametersProp];

    Class photoClass = [SLPhotoMapper class];
    [mapper hasOne:photoClass forKeyPath:kMainPhotoKey forProperty:kMainPhotoProp];

    return mapper;
}

+ (EKMappingValueBlock)privacyValueBlock {

    return ^id(NSString * key, id value) {

        SLAlbumPrivacy privacy;

        if ([value isKindOfClass:[NSString class]]) {

            NSString *stringValue = (NSString *)value;
            stringValue = stringValue.lowercaseString;

            if ([stringValue isEqualToString:@"link"]) {
                privacy = SLAlbumPrivacyPrivate;
            }
            else if ([stringValue isEqualToString:@"public"]) {
                privacy = SLAlbumPrivacyPublic;
            }
            else {
                privacy = SLAlbumPrivacyUnknown;
            }

        }
        else {
            privacy = SLAlbumPrivacyUnknown;
        }

        return @(privacy);
    };
}

#pragma mark SLAlbumMapperProtocol

- (SLMiniAlbum *)mapMiniAlbum:(id)dict {

    EKObjectMapping *mapper = [SLMiniAlbumMapper objectMapping];
    SLMiniAlbum *miniAlbum = [self map:dict mapperObject:mapper];

    return miniAlbum;
}

- (SLCompleteAlbum *)mapCompleteAlbum:(id)dict {

    EKObjectMapping *mapper = [SLCompleteAlbumMapper objectMapping];
    SLCompleteAlbum *completeAlbum = [self map:dict mapperObject:mapper];

    return completeAlbum;
}

@end
