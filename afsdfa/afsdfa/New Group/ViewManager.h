//
//  ViewManager.h
//  afsdfa
//
//  Created by guohq on 2019/8/7.
//  Copyright © 2019 guohq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, SUBVIEW_TYPE){
    SUBVIEW_AIR,
    SUBVIEW_LINE
};

@interface ViewManager : NSObject

@property (nonatomic, strong)    UIView           *parentView;

- (instancetype)initWithFrame:(CGRect)frame;

/**
 创建气泡图层
 @param count 最大显示数量
 @param sources 数据源
 */
- (void)createViewMaxCells:(NSInteger)count sourceData:(NSArray *)sources;

/**
 创建折线视图
 @param dataSource 数据源
 */
- (void)createLineView:(NSArray *)dataSource;

/**
 select view by type
 @param viewType type
 */
- (void)loadView:(SUBVIEW_TYPE)viewType;


/**
 reload line Chart source
 @param index 下标
 */
- (void)reloadLineDataAtIndex:(NSInteger)index;


@end

NS_ASSUME_NONNULL_END
