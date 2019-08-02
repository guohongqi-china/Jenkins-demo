//
//  NSThreadDemo.h
//  afsdfa
//
//  Created by guohq on 2019/8/2.
//  Copyright © 2019 guohq. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSThreadDemo : NSObject

#pragma mark --  信号量-控制异步任务
-(void)concurrentBySemaphore;
#pragma mark --  线程组-控制异步任务
-(void)serialByGroupWait;
#pragma mark --  信号量加锁 数据安全
- (void)producerFunc;
#pragma mark --  任务依赖
- (void)queueDependenc;

@end

NS_ASSUME_NONNULL_END
