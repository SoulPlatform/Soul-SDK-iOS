//
//  SLBaseUser.h
//  Pods
//
//  Created by Mikhail on 08.03.16.
//
//

#import "SLObject.h"
#import "SLUserParameters.h"
#import "SLMiniAlbum.h"

@interface SLBaseUser :SLObject

@property (nonatomic, strong) NSString *userId;
@property (nonatomic, strong) SLUserParameters *parameters;
@property (nonatomic, strong) NSArray <SLMiniAlbum *> *albums;

@end