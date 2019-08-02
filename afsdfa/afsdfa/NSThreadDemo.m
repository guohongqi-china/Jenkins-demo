//
//  NSThreadDemo.m
//  afsdfa
//
//  Created by guohq on 2019/8/2.
//  Copyright © 2019 guohq. All rights reserved.
//

#import "NSThreadDemo.h"

@interface NSThreadDemo()
@property (nonatomic, retain)    dispatch_semaphore_t           semaphore;
@property (nonatomic, weak)    NSMutableArray           *array;

@end

@implementation NSThreadDemo

#pragma mark  ---------------------  interface   ----------------------------------------------

#pragma mark --  信号量控制异步任务
-(void)concurrentBySemaphore {
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        dispatch_semaphore_t sema = dispatch_semaphore_create(0);
        [self requestOneWithSuccessBlock:^{
            dispatch_semaphore_signal(sema);
        }];
        dispatch_semaphore_wait(sema, DISPATCH_TIME_FOREVER);
        NSLog(@"====");
    });
    
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        dispatch_semaphore_t sema = dispatch_semaphore_create(0);
        [self requestTwoWithSuccessBlock:^{
            dispatch_semaphore_signal(sema);
        }];
        dispatch_semaphore_wait(sema, DISPATCH_TIME_FOREVER);
        NSLog(@"-----");
        
    });
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"全部搞完了");
    });
}

#pragma mark --  线程组控制异步任务
-(void)serialByGroupWait {
    
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_group_enter(group);
    [self requestOneWithSuccessBlock:^{
        dispatch_group_leave(group);
    }];
    
    dispatch_group_enter(group);
    [self requestTwoWithSuccessBlock:^{
        dispatch_group_leave(group);
    }];
    // 1  2同时执行
    
    dispatch_group_wait(group, DISPATCH_TIME_FOREVER);// 1 2 执行完 下面才会执行
    
    dispatch_group_enter(group);
    [self requestThreeWithSuccessBlock:^{
        dispatch_group_leave(group);
    }];
    
    // 1 2 3 都完成 才会执行
    dispatch_group_notify(group, dispatch_get_global_queue(0, 0), ^{
        NSLog(@"all request  done!");
    });
}


#pragma mark --  信号量加锁 数据安全
//生产者
- (void)producerFunc{
    
    __block int count = 0;
    
    //生产者生成数据
    dispatch_queue_t t = dispatch_queue_create("222222", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(t, ^{
        while (YES) {
            count++;
            int t = random()%10;
            dispatch_semaphore_wait(self.semaphore, DISPATCH_TIME_FOREVER);
            [NSThread sleepForTimeInterval:3];
            [self.array addObject:[NSString stringWithFormat:@"%d",t]];
            dispatch_semaphore_signal(self.semaphore);
            NSLog(@"生产了%d",count);
            
        }
    });
}
#pragma mark --  任务依赖
- (void)queueDependenc{
    NSBlockOperation *operation1 = [NSBlockOperation blockOperationWithBlock:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_global_queue(0, 0), ^{
            for (int i = 0; i < 50; i++) {
                NSLog(@"11111=====%d",i);
            }
            NSLog(@"current3:%@",[NSThread currentThread]);
        });
        
        
    }];
    
    
    NSBlockOperation *operation2 = [NSBlockOperation blockOperationWithBlock:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_global_queue(0, 0), ^{
            NSLog(@"444444");
            for (int i = 0; i < 50; i++) {
                NSLog(@"22222=====%d",i);
            }
            NSLog(@"current3:%@",[NSThread currentThread]);
        });
    }];
    
    
    NSBlockOperation *operation3 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"333333333333");
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_global_queue(0, 0), ^{
            NSLog(@"333333333333");
        });
    }];
    
    NSBlockOperation *operation4 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"4444444444");
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_global_queue(0, 0), ^{
            NSLog(@"4444444444");
        });
    }];
    
    NSBlockOperation *operation5 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"任务完成");
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_global_queue(0, 0), ^{
            NSLog(@"55555555");
        });
    }];
    //4.设置依赖
    [operation2 addDependency:operation1];      //任务二依赖任务一
    [operation3 addDependency:operation2];      //任务三依赖任务二
    
    [operation4 addDependency:operation3];      //任务四依赖任务三
    
    [operation5 addDependency:operation4];
    //5.创建队列并加入任务
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [queue addOperations:@[operation3, operation2, operation1,operation4,operation5] waitUntilFinished:NO];
    
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            NSLog(@"任务完成");
            NSLog(@"current:%@",[NSThread currentThread]);
        }];
}

#pragma mark  ---------------------  private   ----------------------------------------------


- (void)requestOneWithSuccessBlock:(void(^)(void))block{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_global_queue(0, 0), ^{
        NSLog(@"44444");
        block();
    });
}

- (void)requestTwoWithSuccessBlock:(void(^)(void))block{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_global_queue(0,0), ^{
        NSLog(@"111111");
        block();
    });
}

- (void)requestThreeWithSuccessBlock:(void(^)(void))block{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_global_queue(0, 0), ^{
        NSLog(@"3333333");
        block();
    });
}

#pragma mark  ---------------------  getter setter   ----------------------------------------------


- (dispatch_semaphore_t)semaphore{
    if (!_semaphore) {
        _semaphore = dispatch_semaphore_create(1);
    }
    return _semaphore;
}
@end
