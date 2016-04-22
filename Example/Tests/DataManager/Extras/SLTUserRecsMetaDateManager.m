//
//  SLTUserRecsMetaDateManager.m
//  SoulSDK
//
//  Created by Mikhail on 05.04.16.
//  Copyright © 2016 Mikhail Shershnev. All rights reserved.
//

#import "SLTUserRecsMetaDateManager.h"

NSString *_Nonnull const kTUserRecsMetaSessionNameKey = @"sessionName";
NSString *_Nonnull const kTUserRecsMetaUniqueTokenKey = @"uniqueToken";

@implementation SLTUserRecsMetaDateManager

- (nonnull NSDictionary *)meta {
    return @{
             kTUserRecsMetaSessionNameKey: [self sessionName],
             kTUserRecsMetaUniqueTokenKey: [self uniqueToken],
             };
}

- (nonnull NSString *)sessionName {
    return @"wpjewoifjwep0j3904";
}
- (nonnull NSString *)uniqueToken {
    return @"32r22fg2g42r";
}

@end