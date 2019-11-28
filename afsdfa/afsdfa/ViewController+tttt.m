
//
//  ViewController+tttt.m
//  afsdfa
//
//  Created by guohq on 2019/9/4.
//  Copyright © 2019 guohq. All rights reserved.
//
//、、、、、、、
#import "ViewController+tttt.h"
#import <objc/runtime.h>

@implementation ViewController (tttt)

+ (void)load{
//    [self exchangeInstanceMethod1:@selector(viewDidLoad) method2:@selector(new_viewLoad)];
}

+ (void)exchangeInstanceMethod1:(SEL)method1 method2:(SEL)method2
{
    method_exchangeImplementations(class_getInstanceMethod(self, method1), class_getInstanceMethod(self, method2));
}

//- (void)new_viewLoad{
//    NSLog(@"====");
//}

@end
