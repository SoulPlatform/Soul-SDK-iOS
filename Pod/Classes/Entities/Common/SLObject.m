//
//  SLObject.m
//
//  Created by Mikhail on 02.02.16.
//
//

#import "SLObject.h"

@implementation SLObject

+ (NSArray <NSString *> *)mandatoryFields {
    return @[];
}

/*
 + (NSArray <NSString *> *)mandatoryFields {
 
 NSArray <NSString *> *mandatoryFields = [super mandatoryFields];
 NSArray <NSString *> *_mandatoryFields = [self _mandatoryFields];
 
 return [mandatoryFields arrayByAddingObjectsFromArray:_mandatoryFields];
 }
 */

@end
