//
//  UIViewController+yyy.m
//  afsdfa
//
//  Created by guohq on 2019/9/4.
//  Copyright © 2019 guohq. All rights reserved.
//

#import "UIViewController+yyy.h"
#import <objc/runtime.h>
#import "ViewController.h"

@implementation UIViewController (yyy)

+ (void)load{
    [self exchangeInstanceMethod1:@selector(viewDidLoad ) method2:@selector(new_viewLoad)];
}

+ (void)exchangeInstanceMethod1:(SEL)method1 method2:(SEL)method2
{
    method_exchangeImplementations(class_getInstanceMethod([ViewController class], method1), class_getInstanceMethod([self class], method2));
}


- (void)new_viewLoad{
    NSLog(@"====");
}

@end
