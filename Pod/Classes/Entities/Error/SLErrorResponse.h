//
//  SLErrorResponse.h
//  Pods
//
//  Created by Mikhail on 28.03.16.
//
//

#import "SLObject.h"
#import "SLError.h"
#import "SLAdditionalInfo.h"

@interface SLErrorResponse :SLObject

@property (nonatomic, strong) SLError *slError;
@property (nonatomic, strong) NSError *nsError;

@end
