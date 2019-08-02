//
//  SViewController.m
//  afsdfa
//
//  Created by guohq on 2019/6/28.
//  Copyright © 2019 guohq. All rights reserved.
//

#import "SViewController.h"
@interface SViewController ()
{
    NSTimer *time;
    NSInteger count;
}
@end

@implementation SViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    time = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(runActionaa123) userInfo:nil repeats:YES];
    [time fire];
    [[NSRunLoop currentRunLoop]addTimer:time forMode:NSDefaultRunLoopMode];
    url_session_manager_create_task_safely(^{
        NSLog(@"=======");
    });
    NSLog(@"++++++++");
}

static void url_session_manager_create_task_safely(dispatch_block_t block) {
    block();
//    if (1) {
//        // Fix of bug
//        // Open Radar:http://openradar.appspot.com/radar?id=5871104061079552 (status: Fixed in iOS8)
//        // Issue about:https://github.com/AFNetworking/AFNetworking/issues/2093
//        block();
//    } else {
//        block();
//    }
}

- (void)runActionaa123 {
    NSLog(@"22222222 === %@",[NSThread currentThread]);
    count ++;
    if (count > 10) {
        [time invalidate];
        time = nil;
    }
}

- (void)dealloc{
    NSLog(@"释放");
}

@end
