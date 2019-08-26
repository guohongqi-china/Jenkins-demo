//
//  UNKnow.m
//  CER_IKE_01
//
//  Created by guohq on 2019/8/23.
//  Copyright © 2019 saicmotor. All rights reserved.
//

#import "UNKnow.h"
@interface UNKnow()
@property (nonatomic, copy)    NSString           *status;

@end
@implementation UNKnow
- (instancetype)init{
    if (self = [super init]) {
        _status = @"UNKNOW";
    }
    return self;
}
- (NSString *)getStatus{
    return _status;
}
@end
