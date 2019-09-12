//
//  VNPropertyManager.m
//  afsdfa
//
//  Created by guohq on 2019/8/30.
//  Copyright © 2019 guohq. All rights reserved.
//

#import "VNPropertyManager.h"

@implementation VNPropertyManager

- (VNPropertyManager *(^)(UIColor *col))vn_BKColor{
    return ^(UIColor *col){
        self.chileView.backgroundColor = col;
        return self;
    };
}

- (VNPropertyManager *(^)(CGFloat x, CGFloat y, CGFloat width, CGFloat height))vn_frame{
    return ^(CGFloat x, CGFloat y, CGFloat width, CGFloat height){
        self.chileView.frame = CGRectMake(x, y, width, height);
        return self;
    };
}

- (VNPropertyManager *(^)(CGFloat corner))vn_corner{
    return ^(CGFloat corner){
        self.chileView.layer.masksToBounds = YES;
        self.chileView.layer.cornerRadius = corner;
        return self;
    };
}

- (VNPropertyManager *(^)(UIView *parentView))vn_addView{
    return ^(UIView *parentView){
        [parentView addSubview:self.chileView];
        return self;
    };
}


- (VNPropertyManager *(^)(NSString *title))vn_title{
    return ^(NSString *title){
        
        return self;
    };
}

@end
