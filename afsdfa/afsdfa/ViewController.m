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
    
    NSThreadDemo *demo = [NSThreadDemo new];
//    [demo concurrentBySemaphore];
//    [demo serialByGroupWait];
//    [demo producerFunc];
//    [demo queueDependenc];

   
    
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









@end
