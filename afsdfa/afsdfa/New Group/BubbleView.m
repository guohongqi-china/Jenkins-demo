//
//  BubbleView.m
//  afsdfa
//
//  Created by guohq on 2019/8/7.
//  Copyright © 2019 guohq. All rights reserved.
//

#import "BubbleView.h"
#import "BubbleCell.h"

@interface BubbleView()



@end

@implementation BubbleView

- (instancetype)initWithFrame:(CGRect)frame MaxLimit:(NSInteger)limit Items:(NSArray *)items{
    if (self = [super initWithFrame:frame]) {
        
        
        NSInteger index = 0;
        for (NSString *name in items) {
            BubbleCell *cell = [[BubbleCell alloc]initWithName:name];
            [self addSubview:cell];
            if (index > limit) {
                break;
            }
            index++;
        }
        
        
    }
    return self;
}

- (void)layoutSubviews{
    NSInteger count        = self.subviews.count;
    NSInteger itemWith     = self.frame.size.width / count;
    NSInteger index        = 0;
    
    for (UIView *view in self.subviews) {
        NSInteger maxW = (index + 1) * itemWith - view.frame.size.width;
        NSInteger minW = index * itemWith;
        
        NSInteger maxH         = self.frame.size.height - view.frame.size.height - 40;
        NSInteger minH         = 20;
        
        int positionX          = [self getRandomNumber:(int)minW to:(int)maxW];
        int positionY          = [self getRandomNumber:(int)minH to:(int)maxH];
        
        CGRect temp            = view.frame;
        temp.origin            = CGPointMake(positionX, positionY);
        view.frame             = temp;
        index ++;
        
    }
    

}

- (void)didMoveToSuperview{
    NSLog(@"%@",self.subviews);
    NSInteger index= 0;
    for (BubbleCell *view in self.subviews) {
        [view createAnimaition:index];
        index ++;
    }
  
}

- (void)clickAction:(UIButton *)indentifier{
    
    UIView *superView  = indentifier.superview;
    NSInteger  index   = [self.subviews indexOfObject:superView];
    NSLog(@"%ld",(long)index);
    
    BubbleCell *cell = (BubbleCell *)superView;
    [cell.cellBtn setTitle:@"+ 1g" forState:0];
    
}


//获取一个随机整数，范围在[from,to），包括from，不包括to
-(int)getRandomNumber:(int)from to:(int)to{
    return (int)((arc4random() % (to - from + 1)) + from);
}

@end
