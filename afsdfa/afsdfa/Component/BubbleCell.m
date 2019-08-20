//
//  BubbleCell.m
//  afsdfa
//
//  Created by guohq on 2019/8/7.
//  Copyright © 2019 guohq. All rights reserved.
//

#import "BubbleCell.h"
#import <objc/runtime.h>
#import "AdapterProtocol.h"

@implementation BubbleCell


- (instancetype)initWithName:(NSString *)name{
    if (self = [super init]) {
        
        UIButton *btn            = [[UIButton alloc]init];
        [btn setBackgroundImage:[UIImage imageNamed:@"气泡"] forState:0];
        [btn setTitle:name forState:0];
        btn.titleLabel.font      = [UIFont systemFontOfSize: 18.0];
        btn.titleLabel.textColor = [UIColor redColor];
        [btn addTarget:self action:@selector(action:) forControlEvents:(UIControlEventTouchUpInside)];
        [btn sizeToFit];
        
        UILabel *coLab           = [UILabel new];
        coLab.text               = @"CO2";
        coLab.font               = [UIFont systemFontOfSize:14];
        coLab.textColor          = [UIColor whiteColor];
        [coLab sizeToFit];
        
        CGRect temp            = coLab.frame;
        temp.origin            = CGPointMake(btn.frame.size.width / 2 - temp.size.width/2, btn.frame.size.height + 3);
        coLab.frame             = temp;
        
        
        [self addSubview:btn];
        [self addSubview:coLab];
        self.frame = CGRectMake(0, 0, btn.frame.size.width, btn.frame.size.height + coLab.frame.size.height);
        self.cellBtn = btn;
        
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
}


- (void)action:(UIButton *)btn{
    [(id<AdapterProtocol>)self.superview clickAction:btn];

}



- (void)createAnimaition:(NSInteger)index{

    CGFloat currentY = self.transform.ty;
    CGFloat height = 7.f;
    CGFloat height1 = 9.f;


    NSArray *array1 = @[@(currentY),@(currentY - height/4),@(currentY - height/4*2),@(currentY - height/4*3),@(currentY - height),@(currentY - height/ 4*3),@(currentY - height/4*2),@(currentY - height/4),@(currentY)];
    NSArray *array2 = @[@(currentY),@(currentY + height/4),@(currentY + height/4*2),@(currentY + height/4*3),@(currentY + height),@(currentY + height/ 4*3),@(currentY + height/4*2),@(currentY + height/4),@(currentY)];
    NSArray *array3 = @[@(currentY),@(currentY + height1/4),@(currentY + height1/4*2),@(currentY + height1/4*3),@(currentY + height1),@(currentY + height1/ 4*3),@(currentY + height1/4*2),@(currentY + height1/4),@(currentY)];
    NSArray *array4 = @[@(currentY),@(currentY - height1/4),@(currentY - height1/4*2),@(currentY - height1/4*3),@(currentY - height1),@(currentY - height1/ 4*3),@(currentY - height1/4*2),@(currentY - height1/4),@(currentY)];

    NSArray *timeArr1 = @[ @(0), @(0.025), @(0.085), @(0.2), @(0.5), @(0.8), @(0.915), @(0.975), @(1) ];
    NSArray *timeArr4 = @[ @(0), @(0.015), @(0.065), @(0.28), @(0.5), @(0.68), @(0.8), @(0.925), @(1) ];

    NSArray *animationArr = @[
                              @{@"time":timeArr1,@"values":array1,@"duration":@(1)},
                              @{@"time":timeArr1,@"values":array2,@"duration":@(1.2)},
                              @{@"time":timeArr1,@"values":array4,@"duration":@(1.2)},
                              @{@"time":timeArr1,@"values":array3,@"duration":@(1.1)},
                              @{@"time":timeArr4,@"values":array3,@"duration":@(1.2)}
                              ];

    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.y"];
    animation.duration = [animationArr[index][@"duration"] doubleValue];
    animation.values = animationArr[index][@"values"];
    animation.keyTimes = animationArr[index][@"time"];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.repeatCount = MAXFLOAT;
    [self.layer addAnimation:animation forKey:@"kViewShakerAnimationKey"];
}

//获取一个随机整数，范围在[from,to），包括from，不包括to
-(int)getRandomNumber:(int)from to:(int)to{
    return (int)((arc4random() % (to - from + 1)) + from);
}


- (UIButton *)cellBtn{
    return objc_getAssociatedObject(self, @selector(cellBtn));
}

- (void)setCellBtn:(UIButton *)cellBtn{
    objc_setAssociatedObject(self, @selector(cellBtn), cellBtn, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end



//- (void)createAnimaition:(NSInteger)index{
//
//    CGFloat currentY = self.transform.ty;
//
//    CGFloat height = 7.f;
//    CGFloat height1 = 9.f;
//    CGFloat height2 = 50.f;
//
//    NSArray *array1 = @[@(currentY),@(currentY - height/4),@(currentY - height/4*2),@(currentY - height/4*3),@(currentY - height),@(currentY - height/ 4*3),@(currentY - height/4*2),@(currentY - height/4),@(currentY)];
//    NSArray *array2 = @[@(currentY),@(currentY + height/4),@(currentY + height/4*2),@(currentY + height/4*3),@(currentY + height),@(currentY + height/ 4*3),@(currentY + height/4*2),@(currentY + height/4),@(currentY)];
//    NSArray *array3 = @[@(currentY),@(currentY + height1/4),@(currentY + height1/4*2),@(currentY + height1/4*3),@(currentY + height1),@(currentY + height1/ 4*3),@(currentY + height1/4*2),@(currentY + height1/4),@(currentY)];
//    NSArray *array4 = @[@(currentY),@(currentY - height1/4),@(currentY - height1/4*2),@(currentY - height1/4*3),@(currentY - height1),@(currentY - height1/ 4*3),@(currentY - height1/4*2),@(currentY - height1/4),@(currentY)];
//    NSArray *array5 = @[@(currentY),@(currentY - height2/4),@(currentY - height2/4*2),@(currentY - height2/4*3),@(currentY - height2),@(currentY - height2 / 4*3),@(currentY - height2/4*2),@(currentY - height2/4),@(currentY)];
//
//    NSArray *animationArr = @[@{@"values":array1,@"duration":@(1)},@{@"values":array3,@"duration":@(1.4)},@{@"values":array2,@"duration":@(1.2)},@{@"values":array4,@"duration":@(1.3)},@{@"values":array3,@"duration":@(1.5)}];
//
//
//    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.y"];
//    animation.duration = [animationArr[index][@"duration"] doubleValue];
//    animation.values = animationArr[index][@"values"];
//    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//    animation.repeatCount = MAXFLOAT;
//    [self.layer addAnimation:animation forKey:@"kViewShakerAnimationKey"];
//}
