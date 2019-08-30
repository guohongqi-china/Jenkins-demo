//
//  UIView+Category1.m
//  afsdfa
//
//  Created by guohq on 2019/8/30.
//  Copyright © 2019 guohq. All rights reserved.
//

#import "UIView+Category1.h"

@implementation UIView (Category1)

- (UIView *(^)(UIColor *col))cp_BKColor{
    return ^(UIColor *col){
        self.backgroundColor = col;
        return self;
    };
}

- (UIView *(^)(CGFloat x, CGFloat y, CGFloat width, CGFloat height))cp_frame{
    return ^(CGFloat x, CGFloat y, CGFloat width, CGFloat height){
        self.frame = CGRectMake(x, y, width, height);
        return self;
    };
}

- (UIView *(^)(CGFloat corner))cp_corner{
    return ^(CGFloat corner){
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = corner;
        return self;
    };
}

- (UIView *(^)(UIView *parentView))cp_addView{
    return ^(UIView *parentView){
        [parentView addSubview:self];
        return self;
    };
}

@end
