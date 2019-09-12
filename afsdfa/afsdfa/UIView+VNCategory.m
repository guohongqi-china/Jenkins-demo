//
//  UIView+VNCategory.m
//  afsdfa
//
//  Created by guohq on 2019/8/30.
//  Copyright © 2019 guohq. All rights reserved.
//

#import "UIView+VNCategory.h"
#import <objc/runtime.h>
#import "VNPropertyManager.h"

@implementation UIView (VNCategory)

+ (instancetype)createView:(void(^)(VNPropertyManager *manager))block{
    UIView *view               = [[self alloc]init];
    VNPropertyManager *manager = [VNPropertyManager new];
    manager.chileView          = view;
    view.viewManager           = manager;
    block(manager);
    return view;
}


- (void)setViewManager:(VNPropertyManager *)viewManager{
    if (viewManager != self.viewManager) {
        objc_setAssociatedObject(self,@selector(viewManager), viewManager, OBJC_ASSOCIATION_RETAIN);
    }
}

- (VNPropertyManager *)viewManager{
    return objc_getAssociatedObject(self, @selector(viewManager));
}

- (void)dealloc{
//    NSLog(@"已销毁");
}

@end
