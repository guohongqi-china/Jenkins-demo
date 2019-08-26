//
//  Normal.m
//  CER_IKE_01
//
//  Created by guohq on 2019/8/23.
//  Copyright © 2019 saicmotor. All rights reserved.
//

#import "Normal.h"

@interface Normal()
@property (nonatomic, copy)    NSString           *status;

@end

@implementation Normal

- (instancetype)init{
    if (self = [super init]) {
        _status = @"NORMAL";
    }
    return self;
}

- (NSString *)getStatus{
    return _status;
}
@end
