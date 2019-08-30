//
//  UIView+Category1.h
//  afsdfa
//
//  Created by guohq on 2019/8/30.
//  Copyright © 2019 guohq. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Category1)

// 尺寸
- (UIView *(^)(CGFloat x, CGFloat y, CGFloat width, CGFloat height))cp_frame;
// 背景色
- (UIView *(^)(UIColor *col))cp_BKColor;
// 圆角设置
- (UIView *(^)(CGFloat corner))cp_corner;
// 添加view
- (UIView *(^)(UIView *parentView))cp_addView;

@end

NS_ASSUME_NONNULL_END
