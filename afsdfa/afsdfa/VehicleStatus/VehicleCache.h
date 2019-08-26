//
//  VehicleCache.h
//  CER_IKE_01
//
//  Created by guohq on 2019/8/26.
//  Copyright © 2019 saicmotor. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface VehicleCache : NSObject

- (void)cacheData:(id)data key:(NSString *)key;
- (NSDictionary *)getCrashData;

@end

NS_ASSUME_NONNULL_END
