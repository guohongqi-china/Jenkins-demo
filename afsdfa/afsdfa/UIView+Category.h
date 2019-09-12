//
//  UIView+Category.h
//  afsdfa
//
//  Created by guohq on 2019/8/30.
//  Copyright © 2019 guohq. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface VPropertyManager:NSObject

@property (nonatomic, weak)    UIView           *chileView;


// 尺寸
- (VPropertyManager *(^)(CGFloat x, CGFloat y, CGFloat width, CGFloat height))cp_frame;
// 背景色
- (VPropertyManager *(^)(UIColor *col))cp_BKColor;
// 圆角设置
- (VPropertyManager *(^)(CGFloat corner))cp_corner;
// 添加view
- (VPropertyManager *(^)(UIView *parentView))cp_addView;


- (VPropertyManager *(^)(NSString *title))cp_title;


@end;


@interface UIView (Category)

@property (nonatomic, strong)    VPropertyManager               *viewManager;

+ (instancetype)createView:(void(^)(VPropertyManager *manager))block;


@end

NS_ASSUME_NONNULL_END
