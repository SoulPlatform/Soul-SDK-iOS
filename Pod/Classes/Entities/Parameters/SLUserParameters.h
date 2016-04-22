//
//  SLUserParameters.h
//  Pods
//
//  Created by Mikhail on 07.03.16.
//
//

#import "SLObject.h"
#import "SLFilterableParameters.h"

@interface SLUserParameters :SLObject

//@property (nonatomic, strong) SLFilterableParameters *filterable;
@property (nonatomic, strong) NSDictionary *filterable;
@property (nonatomic, strong) NSDictionary *individual;

@property (nonatomic, strong) NSDictionary *publicVisible;
@property (nonatomic, strong) NSDictionary *publicWritable;

@end