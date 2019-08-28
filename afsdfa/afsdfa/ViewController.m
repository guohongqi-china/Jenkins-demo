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
#import "VehicleControl.h"


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

@property (nonatomic, assign)    NSInteger           ticketNumber;
@property (nonatomic, strong)    NSMutableDictionary      *dataArr;



//@property (nonatomic, weak)    NSMutableArray           *dataArr;




@end

NSInteger you = 20;

@implementation ViewController


/**
 *  sd_webimage
 */
- (void)sdDemo{
    _imageView1.sd_imageIndicator = SDWebImageActivityIndicator.grayIndicator;;
    [_imageView1 sd_setImageWithURL:[NSURL URLWithString:@"https://weiliicimg1.pstatp.com/weili/l/406339082050338830.webp"]];
    [_imageView2 sd_setImageWithURL:[NSURL URLWithString:@"http://pic25.nipic.com/20121112/9252150_150552938000_2.jpg"]];
    [_imageview3 sd_setImageWithURL:[NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1564562843251&di=9698638a968d06fded2a75f621997265&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201801%2F11%2F20180111153213_W5Yyd.jpeg"]];
      [_imageView4 sd_setImageWithURL:[NSURL URLWithString:@"http://pic16.nipic.com/20111006/6239936_092702973000_2.jpg"]];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    _ticketNumber = 100;
    
//    //获取路径对象
//    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    NSString *path = [pathArray objectAtIndex:0];
//    //获取文件的完整路径
//    NSString *filePatch = [path stringByAppendingPathComponent:@"xiaoxi.plist"];
//    //上面3句可以写成这一句//
////    NSString *filePatch = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)objectAtIndex:0]stringByAppendingPathComponent:@"xiaoxi.plist"];
//    //    NSLog(@"------filepath---%@",filePatch);
//    /**
//     下面是我的plist路径,在桌面空白处点击一下，前往－按住option-资源库-Developer-CoreSimulator-Devices......就按照下面路径找到plist所在的位置
//     /Users/baiteng01/Library/Developer/CoreSimulator/Devices/92444384-5241-4934-B078-1A7241F1B687/data/Containers/Data/Application/73005382-D1FB-4BC2-BB4E-1FBC64284141/Documents/xiaoxi.plist
//     */
//    //写入数据到plist文件
//    NSMutableDictionary *dic1 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"100",@"name",nil];
//   //写入plist里面
//
//    [dic1 writeToFile:filePatch atomically:YES];        //读取plist文件的内容
//    NSMutableDictionary *dataDictionary = [[NSMutableDictionary alloc] initWithContentsOfFile:filePatch];
//    NSLog(@"---plist一开始保存时候的内容---%@",dataDictionary);
    
//    [self readLocalData];
    
//    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
//    queue.name              = @"com.guohq";
//    queue.maxConcurrentOperationCount   = 2;
    
//    _dataArr = [NSMutableDictionary dictionary];
//    [self demo7];
    
    
//    [self sdDemo];
//
    VehicleControl *control = [VehicleControl sharedSingleton];

    for (int i = 0; i < 100; i++) {
        Vehicle_STATUS status;
        if (i%2 == 0) {
            status = Vehicle_Normal;
        }else{
            status = Vehicle_UNormal;
        }
        [control setData:[NSNumber numberWithInteger:status] key:[NSString stringWithFormat:@"SK81234567890%d",i]];
    }
    
//
//    [self demo8];
//
//    ViewManager  *manager = [[ViewManager alloc] initWithFrame:CGRectMake(0, 200, [UIScreen mainScreen].bounds.size.width, 300)];
//    [manager createViewMaxCells:5 sourceData:@[@"+ 9g",@"+ 8g",@"+ 5g",@"+ 3g",@"+ 4g"]];
//    [manager createLineView:@[
//                              @{@"vertical":@[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11"],
//                                @"sourceData":@[@(12), @(2),@(600),@(27.4),@(37),@(29.7),@(27.4),@(212.4),@(127.4),@(27.4),@(227.4)]
//                              },
//                              @{@"vertical":@[@"1",@"2",@"3",@"4",@"5",@"6",],
//                                @"sourceData":@[@(12), @(2),@(200),@(27.4),@(37),@(22),@(29.7),@(27.4)]
//                              }
//                            ]];
//    [manager loadView:SUBVIEW_LINE];
//    [self.view addSubview:manager.parentView];
//
//
//
//    NSLog(@"%lu",sizeof(manager));
//
    
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

- (void)demo4{
    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
    queue.name              = @"com.guohq";
//    queue.maxConcurrentOperationCount   = 2;
    
    VNRequestOperation<VNOperationProtocol> *requestOperation1 = [[VNRequestOperation alloc]initOperationWithTask:^{
        [self saleTicketNoSafe];
    }];
    requestOperation1.name = @"1";
    
    VNRequestOperation<VNOperationProtocol> *requestOperation2 = [[VNRequestOperation alloc]initOperationWithTask:^{
        [self saleTicketNoSafe];
    }];
    requestOperation2.name = @"2";
    
    
    VNRequestOperation<VNOperationProtocol> *requestOperation3 = [[VNRequestOperation alloc]initOperationWithTask:^{
        [self saleTicketNoSafe];
    }];
    requestOperation3.name = @"3";
    
    
    VNRequestOperation<VNOperationProtocol> *requestOperation4 = [[VNRequestOperation alloc]initOperationWithTask:^{
        [self saleTicketNoSafe];
    }];
    requestOperation4.name = @"4";
    
    
    VNRequestOperation<VNOperationProtocol> *requestOperation5 = [[VNRequestOperation alloc]initOperationWithTask:^{
        [self saleTicketNoSafe];
    }];
    requestOperation5.name = @"5";
    
    
    [queue addOperation:requestOperation1];
    [queue addOperation:requestOperation2];
    [queue addOperation:requestOperation3];
    [queue addOperation:requestOperation4];
    [queue addOperation:requestOperation5];
}


- (void)saleTicketNoSafe{
    
//    @synchronized(self){
        while (1) {
//            NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//            NSString *path1 = [pathArray objectAtIndex:0];
//            NSString *myPath = [path1 stringByAppendingPathComponent:@"xiaoxi.plist"];
//
//            //根据之前保存的容器类型读取数据
//            //是数组就用数组来获取数据，是字典就用字典来获取数据
//            //xiaoxi.plist文件
//            //NSMutableArray *dataArr = [[NSMutableArray alloc] initWithContentsOfFile:filePath];
//            //xiaoxi.plist文件
//            NSMutableDictionary *dataDictionary = [[NSMutableDictionary alloc] initWithContentsOfFile:myPath];
//            NSInteger num = [dataDictionary[@"name"] integerValue];
//            if (num > 0) {
//                num --;
//                NSLog(@"剩余票数:%ld 窗口：%@", num, [NSThread currentThread]);
//                dataDictionary[@"name"] = [NSString stringWithFormat:@"%ld",num];
//                [dataDictionary writeToFile:myPath atomically:YES];
//            }
//
//            if (num <= 0) {
//                NSLog(@"本次出票失败");
//                break;
//            }
            @synchronized(self) {

            if (self.ticketNumber > 0) {
                NSString *num = [NSString stringWithFormat:@"%ld",(long)self.ticketNumber];
                [self.dataArr setObject:num forKey:num];
                self.ticketNumber--;
//                if ([self.dataArr.allKeys containsObject:num]) {
//                    NSLog(@"==========%@",[NSThread currentThread]);
//                }
                NSLog(@"剩余票数:%ld 窗口：%@", (long)self.ticketNumber, [NSThread currentThread]);
            }

            if (self.ticketNumber <= 0) {

                NSLog(@"本次出票失败");
                break;
            }
            }
        }
//    }
   
}

- (NSInteger)readLocalData{
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path1 = [pathArray objectAtIndex:0];
    NSString *myPath = [path1 stringByAppendingPathComponent:@"xiaoxi.plist"];
    
    //根据之前保存的容器类型读取数据
    //是数组就用数组来获取数据，是字典就用字典来获取数据
    //xiaoxi.plist文件
    //NSMutableArray *dataArr = [[NSMutableArray alloc] initWithContentsOfFile:filePath];
    //xiaoxi.plist文件
    NSMutableDictionary *dataDictionary = [[NSMutableDictionary alloc] initWithContentsOfFile:myPath];
    NSLog(@"%@",dataDictionary);
    NSInteger num = [dataDictionary[@"name"] integerValue];
    if (num > 0) {
        num --;
        NSLog(@"剩余票数:%ld 窗口：%@", num, [NSThread currentThread]);
        dataDictionary[@"name"] = [NSString stringWithFormat:@"%ld",num];
        [dataDictionary writeToFile:myPath atomically:YES];
    }

    
    return num;
}


- (void)demo5{
    dispatch_queue_t synchronizationQueue = dispatch_queue_create("com.guohq", DISPATCH_QUEUE_CONCURRENT);

    dispatch_async(synchronizationQueue, ^{
        for (int i = 0; i<10; i++) {
            NSLog(@"ooo %d == %@",i,[NSThread currentThread]);
        }
    });
    
    dispatch_async(synchronizationQueue, ^{
        for (int i = 0; i<10; i++) {
            NSLog(@"uuu %d == %@",i,[NSThread currentThread]);
        }
    });
    
    dispatch_barrier_async(synchronizationQueue, ^{
        for (int i = 0; i<10; i++) {
            NSLog(@"ppp %d == %@",i,[NSThread currentThread]);
        }
    });
    dispatch_barrier_async(synchronizationQueue, ^{
        for (int i = 0; i<10; i++) {
            NSLog(@"%d == %@",i,[NSThread currentThread]);
        }
    });
}

- (void)demo6{
    dispatch_queue_t queue = dispatch_queue_create("serialQueue", DISPATCH_QUEUE_SERIAL);
    dispatch_sync(queue, ^{
        for (int i = 0; i<10; i++) {
            NSLog(@"ppp %d == %@",i,[NSThread currentThread]);
        }
    });
    NSLog(@"===");
    dispatch_sync(queue, ^{
        for (int i = 0; i<10; i++) {
            NSLog(@"uuu %d == %@",i,[NSThread currentThread]);
        }
    });
    NSLog(@"===111");
    dispatch_sync(queue, ^{
        for (int i = 0; i<10; i++) {
            NSLog(@"yyy %d == %@",i,[NSThread currentThread]);
        }
    });
}

- (void)demo7{

    dispatch_queue_t queue = dispatch_queue_create("com.guohq", DISPATCH_QUEUE_CONCURRENT);
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(3);
    for (int i = 0; i < 100; i++) {
        dispatch_async(queue, ^{
            dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
            for (int i = 0; i<10; i++) {
            }
            NSLog(@"444 == %@",[NSThread currentThread]);
            sleep(5);
            dispatch_semaphore_signal(semaphore);
        });
    }
//    dispatch_async(queue, ^{
//        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
//        for (int i = 0; i<10; i++) {
//            NSLog(@"yyy %d == %@",i,[NSThread currentThread]);
//        }
//        sleep(5);
//        dispatch_semaphore_signal(semaphore);
//    });
//
//    dispatch_async(queue, ^{
//        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
//        for (int i = 0; i<10; i++) {
//            NSLog(@"uuu %d == %@",i,[NSThread currentThread]);
//        }
//        sleep(5);
//        dispatch_semaphore_signal(semaphore);
//    });
//
//    dispatch_async(queue, ^{
//        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
//        for (int i = 0; i<10; i++) {
//            NSLog(@"ttt %d == %@",i,[NSThread currentThread]);
//        }
//        dispatch_semaphore_signal(semaphore);
//    });
    
    
    
    


}

- (void)demo8{
    
    dispatch_queue_t queue = dispatch_queue_create("com.guohq", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        for (int i = 0; i<4; i++) {
            NSLog(@"yyy %d == %@",i,[NSThread currentThread]);
        }
        sleep(5);
        dispatch_semaphore_signal(semaphore);
    });
    
    dispatch_async(queue, ^{
        dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
        for (int i = 0; i<4; i++) {
            NSLog(@"uuu %d == %@",i,[NSThread currentThread]);
        }
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);

        sleep(5);
        
        dispatch_semaphore_signal(semaphore);
    });
    
    dispatch_async(queue, ^{
        dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
        for (int i = 0; i<4; i++) {
            NSLog(@"ttt %d == %@",i,[NSThread currentThread]);
        }
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        
        sleep(5);
        
        dispatch_semaphore_signal(semaphore);    });
    
    dispatch_async(queue, ^{
        dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
        for (int i = 0; i<4; i++) {
            NSLog(@"444 %d == %@",i,[NSThread currentThread]);
        }
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        sleep(5);
        dispatch_semaphore_signal(semaphore);    });
    
    
}

@end
