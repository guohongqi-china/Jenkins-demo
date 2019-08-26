//
//  VehicleControl.h
//  CER_IKE_01
//
//  Created by guohq on 2019/8/23.
//  Copyright © 2019 saicmotor. All rights reserved.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSUInteger,Vehicle_STATUS){
    Vehicle_Unknow = 1000,
    Vehicle_Normal,
    Vehicle_UNormal
};

@interface VehicleControl : NSObject
@property (nonatomic, assign)    Vehicle_STATUS           type;
@property (nonatomic, strong,readonly)    NSMutableDictionary<NSString *,NSNumber *>           *dataDic;


+ (instancetype)sharedSingleton;
- (NSString *)getStatus;
- (void)clearCrash;
- (void)setData:(id)data key:(NSString *)key;

@end

NS_ASSUME_NONNULL_END
