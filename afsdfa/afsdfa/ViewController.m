//
//  ViewController.m
//  afsdfa
//
//  Created by guohq on 2019/6/24.
//  Copyright © 2019 guohq. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import "SViewController.h"
#import "guohq.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import <SDWebImage/SDWebImage.h>
#import "MGTestOperation.h"
#import "NSThreadDemo.h"
#import "VNRequestOperation.h"
#import "ViewManager.h"


@interface ViewController ()
{
    SViewController *SControl;
}
//@property (nonatomic, copy)    NSString           *name;

@property (nonatomic, copy)    int(^blk)(int num);


@property (weak, nonatomic) IBOutlet UIImageView *imageView1;

@property (weak, nonatomic) IBOutlet UIImageView *imageView2;

@property (weak, nonatomic) IBOutlet UIImageView *imageview3;

@property (weak, nonatomic) IBOutlet UIImageView *imageView4;


@property (nonatomic, weak)    NSMutableArray           *dataArr;




@end

NSInteger you = 20;

@implementation ViewController


/**
 *  sd_webimage
 */
- (void)sdDemo{
    _imageView1.sd_imageIndicator = SDWebImageActivityIndicator.grayIndicator;;
    [_imageView1 sd_setImageWithURL:[NSURL URLWithString:@"https://weiliicimg1.pstatp.com/weili/l/406339082050338830.webp"]];
    [_imageView2 sd_setImageWithURL:[NSURL URLWithString:@"https://weiliicimg1.pstatp.com/weili/l/406339082050338830.webp"]];
    [_imageview3 sd_setImageWithURL:[NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1564562843251&di=9698638a968d06fded2a75f621997265&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201801%2F11%2F20180111153213_W5Yyd.jpeg"]];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    

    ViewManager  *manager = [[ViewManager alloc] initWithFrame:CGRectMake(0, 200, [UIScreen mainScreen].bounds.size.width, 300)];
    [manager createViewMaxCells:5 sourceData:@[@"+ 9g",@"+ 8g",@"+ 5g",@"+ 3g",@"+ 4g"]];
    [manager createLineView:@[
                              @{@"vertical":@[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11"],
                                @"sourceData":@[@(12), @(2),@(600),@(27.4),@(37),@(29.7),@(27.4),@(212.4),@(127.4),@(27.4),@(227.4)]
                              },
                              @{@"vertical":@[@"1",@"2",@"3",@"4",@"5",@"6",],
                                @"sourceData":@[@(12), @(2),@(200),@(27.4),@(37),@(22),@(29.7),@(27.4)]
                              }
                            ]];
    [manager loadView:SUBVIEW_LINE];
    [self.view addSubview:manager.parentView];
    
    

    
    
    
    return;
    SControl = [[SViewController alloc]init];
    
    
}

- (int(^)(int))muitle:(int)name{
    return ^int(int a){
        return name * a;
    };
}

- (void)voidexecuteBlock{
    int result = _blk(4);
    NSLog(@"%d",result);
}



- (IBAction)asdfasdfa:(id)sender {
    
    [_imageView4 sd_setImageWithURL:[NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1564562913515&di=a62057f48fec12ebc79af444b382347a&imgtype=0&src=http%3A%2F%2F2f.zol-img.com.cn%2Fproduct%2F13_800x600%2F889%2FcenhT9t4pgRg.jpg"]];
    
}




/**
 * 自定义操作队列
 */
- (void)operationAction{
    NSOperationQueue *operationQueue = [[NSOperationQueue alloc]init];
    operationQueue.name              = @"com.guohq";
    MGTestOperation *operation = [[MGTestOperation alloc]initOperationWithTask:^{
        NSLog(@"%@  ====  %@",[NSThread currentThread],[NSThread currentThread].name);
        for (int i = 0; i < 10; i++) {
            if (i == 5) {
                operationQueue.suspended = YES;
                [NSThread sleepForTimeInterval:3.5];
                operationQueue.suspended = NO;
            }
            NSLog(@"%d",i);
        }
        NSLog(@"打印完毕");
        
    }];
    operation.name = @"com.xhy";
    
    operation.completionBlock = ^(){
        NSLog(@"执行完毕");
    };
    
    
    MGTestOperation *operation123 = [[MGTestOperation alloc]initOperationWithTask:^{
        NSLog(@"%@  ====  %@",[NSThread currentThread],[NSThread currentThread].name);
        for (int i = 0; i < 10; i++) {
            if (i == 5) {
                operationQueue.suspended = YES;
                [NSThread sleepForTimeInterval:3.5];
                operationQueue.suspended = NO;
            }
            NSLog(@"%d",i);
        }
        NSLog(@"打印完毕");
        
    }];
    
    
    [operationQueue addOperation:operation];
    [operationQueue addOperation:operation123];
}


#pragma mark --  自定义队列

- (void)demo2{
    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
    queue.name              = @"com.guohq";
    queue.maxConcurrentOperationCount   = 2;
    
    VNRequestOperation<VNOperationProtocol> *requestOperation1 = [[VNRequestOperation alloc]initOperationWithTask:^{
        NSLog(@"任务1开始 %@  ===  %@",[NSThread currentThread],[NSThread currentThread].name);
        for (int i = 0; i < 20000; i++) {
            NSMutableArray *arr = [NSMutableArray array];
            [arr addObject:[NSString stringWithFormat:@"%d",i]];
        }
        NSLog(@"任务1结束");
    }];
    requestOperation1.name = @"1";
    
    VNRequestOperation<VNOperationProtocol> *requestOperation2 = [[VNRequestOperation alloc]initOperationWithTask:^{
        NSLog(@"任务2开始 %@  ===  %@",[NSThread currentThread],[NSThread currentThread].name);
        for (int i = 0; i < 20000; i++) {
            NSMutableArray *arr = [NSMutableArray array];
            [arr addObject:[NSString stringWithFormat:@"%d",i]];
        }
        NSLog(@"任务2结束");
    }];
    requestOperation2.name = @"2";
    
    
    VNRequestOperation<VNOperationProtocol> *requestOperation3 = [[VNRequestOperation alloc]initOperationWithTask:^{
        NSLog(@"任务3开始 %@  ===  %@",[NSThread currentThread],[NSThread currentThread].name);
        for (int i = 0; i < 20000; i++) {
            NSMutableArray *arr = [NSMutableArray array];
            [arr addObject:[NSString stringWithFormat:@"%d",i]];
        }
        NSLog(@"任务3结束");
    }];
    requestOperation3.name = @"3";
    
    
    VNRequestOperation<VNOperationProtocol> *requestOperation4 = [[VNRequestOperation alloc]initOperationWithTask:^{
        NSLog(@"任务4开始 %@  ===  %@",[NSThread currentThread],[NSThread currentThread].name);
        for (int i = 0; i < 20000; i++) {
            NSMutableArray *arr = [NSMutableArray array];
            [arr addObject:[NSString stringWithFormat:@"%d",i]];
        }
        NSLog(@"任务4结束");
    }];
    requestOperation4.name = @"4";
    
    
    VNRequestOperation<VNOperationProtocol> *requestOperation5 = [[VNRequestOperation alloc]initOperationWithTask:^{
        NSLog(@"任务5开始 %@  ===  %@",[NSThread currentThread],[NSThread currentThread].name);
        for (int i = 0; i < 2000; i++) {
            NSMutableArray *arr = [NSMutableArray array];
            [arr addObject:[NSString stringWithFormat:@"%d",i]];
        }
        NSLog(@"任务5结束");
    }];
    requestOperation5.name = @"5";
    
    
    [queue addOperation:requestOperation1];
    [queue addOperation:requestOperation2];
    [queue addOperation:requestOperation3];
    [queue addOperation:requestOperation4];
    [queue addOperation:requestOperation5];
}







@end
