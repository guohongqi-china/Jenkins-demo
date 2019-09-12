//
//  UIView+VNCategory.h
//  afsdfa
//
//  Created by guohq on 2019/8/30.
//  Copyright © 2019 guohq. All rights reserved.
//

#import <UIKit/UIKit.h>
@class VNPropertyManager;
NS_ASSUME_NONNULL_BEGIN

@interface UIView (VNCategory)

@property (nonatomic, strong)    VNPropertyManager               *viewManager;

+ (instancetype)createView:(void(^)(VNPropertyManager *manager))block;

@end

NS_ASSUME_NONNULL_END
