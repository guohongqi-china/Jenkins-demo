//
//  AdapterProtocol.h
//  afsdfa
//
//  Created by guohq on 2019/8/7.
//  Copyright © 2019 guohq. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol AdapterProtocol <NSObject>

/** 事件适配器*/
- (void)clickAction:(UIButton *)indentifier;

@end

NS_ASSUME_NONNULL_END
