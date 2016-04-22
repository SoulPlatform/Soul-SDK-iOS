//
//  SLPhoneAuthRequestMapper.m
//  Pods
//
//  Created by Mikhail on 01.03.16.
//
//

#import "SLPhoneAuthRequestMapper.h"

static NSString *const kStatusKey = @"status";
static NSString *const kStatusProperty = @"status";

static NSString *const kProviderKey = @"providerId";
static NSString *const kProviderProperty = @"provider";

@implementation SLPhoneAuthRequestMapper

+ (EKObjectMapping *)objectMapping {

    EKObjectMapping *mapper = [[EKObjectMapping alloc] initWithObjectClass:[SLPhoneAuthRequest class]];

    EKMappingValueBlock statusBlock  = [self phoneAuthRequestStatusValueBlock];
    EKMappingValueBlock integerBlock = [self integerValueBlock];

    [mapper mapKeyPath:kStatusKey   toProperty:kStatusProperty   withValueBlock:statusBlock];
    [mapper mapKeyPath:kProviderKey toProperty:kProviderProperty withValueBlock:integerBlock];

    return mapper;
}

- (SLPhoneAuthRequest *)mapPhoneAuthRequest:(id)dict {
    SLPhoneAuthRequest *phoneAuthRequest = [self map:dict];
    return phoneAuthRequest;
}

+ (EKMappingValueBlock)phoneAuthRequestStatusValueBlock {

    return ^id(NSString * key, id value) {

        SLPhoneAuthRequestStatus status;

        if ([value isKindOfClass:[NSString class]]) {

            NSString *stringValue = (NSString *)value;
            stringValue = stringValue.lowercaseString;

            if ([stringValue isEqualToString:@"wait"]) {
                status = SLPhoneAuthRequestWaitStatus;
            }
            else if ([stringValue isEqualToString:@"accepted"]) {
                status = SLPhoneAuthRequestAcceptedStatus;
            }
            else {
                status = SLPhoneAuthRequestUnknownStatus;
            }

        }
        else {
            status = SLPhoneAuthRequestUnknownStatus;
        }

        return @(status);
    };
}

@end
