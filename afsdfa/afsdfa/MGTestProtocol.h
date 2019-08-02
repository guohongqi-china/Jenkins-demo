//
//  MGTestProtocol.h
//  afsdfa
//
//  Created by guohq on 2019/8/1.
//  Copyright © 2019 guohq. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol MGTestProtocol <NSObject>

@required

- (nullable instancetype)initOperationWithTask:(void (^)(void))taskBlock;

@end

NS_ASSUME_NONNULL_END
