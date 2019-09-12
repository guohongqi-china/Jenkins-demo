//
//  VNPropertyManager.h
//  afsdfa
//
//  Created by guohq on 2019/8/30.
//  Copyright © 2019 guohq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface VNPropertyManager : NSObject

@property (nonatomic, weak)    UIView           *chileView;

// 尺寸
- (VNPropertyManager *(^)(CGFloat x, CGFloat y, CGFloat width, CGFloat height))vn_frame;
// 背景色
- (VNPropertyManager *(^)(UIColor *col))vn_BKColor;
// 圆角设置
- (VNPropertyManager *(^)(CGFloat corner))vn_corner;

- (VNPropertyManager *(^)(NSString *title))vn_title;

// 添加view
- (VNPropertyManager *(^)(UIView *parentView))vn_addView;

@end

NS_ASSUME_NONNULL_END
