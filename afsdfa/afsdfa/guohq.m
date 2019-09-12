//
//  guohq.m
//  afsdfa
//
//  Created by guohq on 2019/7/30.
//  Copyright © 2019 guohq. All rights reserved.
//

#import "guohq.h"

@interface guohq()
{
    NSTimer *time;
    void(^myBblock)(void);
}


@end

@implementation guohq

- (void)printUI{
    NSLog(@"打印了代理");
}

- (instancetype)init{
    if (self = [super init]) {
        
        time = [NSTimer scheduledTimerWithTimeInterval:5.0 target:self selector:@selector(timeAction) userInfo:nil repeats:NO];
      
    }
    return self;
}

- (void)uuuuuuuu:(void(^)(void))block{
    myBblock = block;
    [[NSRunLoop currentRunLoop] addTimer:time forMode:NSRunLoopCommonModes];
    [[NSRunLoop currentRunLoop] run];
}

- (void)timeAction{
    if (myBblock) {
        myBblock();
    }
}

@end
