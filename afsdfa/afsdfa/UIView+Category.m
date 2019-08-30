//
//  UIView+Category.m
//  afsdfa
//
//  Created by guohq on 2019/8/30.
//  Copyright © 2019 guohq. All rights reserved.
//

#import "UIView+Category.h"
#import <objc/runtime.h>

@implementation VPropertyManager

- (VPropertyManager *(^)(UIColor *col))cp_BKColor{
    return ^(UIColor *col){
        self.chileView.backgroundColor = col;
        return self;
    };
}

- (VPropertyManager *(^)(CGFloat x, CGFloat y, CGFloat width, CGFloat height))cp_frame{
    return ^(CGFloat x, CGFloat y, CGFloat width, CGFloat height){
        self.chileView.frame = CGRectMake(x, y, width, height);
        return self;
    };
}

- (VPropertyManager *(^)(CGFloat corner))cp_corner{
    return ^(CGFloat corner){
        self.chileView.layer.masksToBounds = YES;
        self.chileView.layer.cornerRadius = corner;
        return self;
    };
}

- (VPropertyManager *(^)(UIView *parentView))cp_addView{
    return ^(UIView *parentView){
        [parentView addSubview:self.chileView];
        return self;
    };
}

@end



@implementation UIView (Category)

+ (instancetype)createView:(void(^)(VPropertyManager *manager))block{
    UIView *view              = [[self alloc]init];
    VPropertyManager *manager = [VPropertyManager new];
    manager.chileView         = view;
    view.viewManager          = manager;
    block(manager);
    return view;
}


- (void)setViewManager:(VPropertyManager *)viewManager{
    if (viewManager != self.viewManager) {
        objc_setAssociatedObject(self,@selector(viewManager), viewManager, OBJC_ASSOCIATION_RETAIN);
    }
}

- (VPropertyManager *)viewManager{
    return objc_getAssociatedObject(self, @selector(viewManager));
}


@end
