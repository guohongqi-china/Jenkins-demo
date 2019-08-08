//
//  BubbleView.h
//  afsdfa
//
//  Created by guohq on 2019/8/7.
//  Copyright © 2019 guohq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AdapterProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface BubbleView : UIView<AdapterProtocol>

- (instancetype)initWithFrame:(CGRect)frame MaxLimit:(NSInteger)limit Items:(NSArray *)items;


@end

NS_ASSUME_NONNULL_END
