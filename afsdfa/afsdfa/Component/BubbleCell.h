//
//  BubbleCell.h
//  afsdfa
//
//  Created by guohq on 2019/8/7.
//  Copyright © 2019 guohq. All rights reserved.
//

#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface BubbleCell : UIView

@property (nonatomic, strong)    UIButton           *cellBtn;

- (instancetype)initWithName:(NSString *)name;

- (void)createAnimaition:(NSInteger)index;



@end

NS_ASSUME_NONNULL_END
