//
//  UNNormal.m
//  CER_IKE_01
//
//  Created by guohq on 2019/8/23.
//  Copyright © 2019 saicmotor. All rights reserved.
//

#import "UNNormal.h"
@interface UNNormal()
@property (nonatomic, copy)    NSString           *status;

@end
@implementation UNNormal

- (instancetype)init{
    if (self = [super init]) {
        _status = @"UNNORAML";
    }
    return self;
}
- (NSString *)getStatus{
    return _status;
}
@end
