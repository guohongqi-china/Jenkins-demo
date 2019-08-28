//
//  VehicleControl.m
//  CER_IKE_01
//
//  Created by guohq on 2019/8/23.
//  Copyright © 2019 saicmotor. All rights reserved.
//

#import "VehicleControl.h"
#import "Normal.h"
#import "UNNormal.h"
#import "UNKnow.h"
#import "VehicleCache.h"
@interface VehicleControl()

@property (nonatomic, strong,readwrite)    NSMutableDictionary<NSString *,NSNumber *>           *dataDic;
@property (nonatomic, strong)    VehicleCache           *cacheManager;




@end

@implementation VehicleControl

+ (instancetype)sharedSingleton{
    static VehicleControl *_sharedSingleton = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //不能再使用alloc方法
        //因为已经重写了allocWithZone方法，所以这里要调用父类的分配空间的方法
        _sharedSingleton = [[super allocWithZone:NULL] init];
    });
    return _sharedSingleton;
}

- (instancetype)init{
    if (self = [super init]) {
        _dataDic = [NSMutableDictionary dictionary];
        _cacheManager = [VehicleCache new];
    }
    return self;
}

- (void)setData:(id)data key:(NSString *)key{
    [self.dataDic setValue:data forKey:key];
    [_cacheManager cacheData:data key:key];
}



- (NSString *)getStatus{
    
    NSDictionary *dic = @{@"vin":@"2"};
    
    [self readCrashData:dic[@"vin"]];
    
    if (![_dataDic.allKeys containsObject:dic[@"vin"]]) {
        return [self getStatus:[UNKnow new]];
    }
    
    NSInteger num     = [_dataDic[dic[@"vin"]] integerValue];

    if (num == Vehicle_Normal) {
        return [self getStatus:[Normal new]];
    }else if (num == Vehicle_UNormal){
        return [self getStatus:[UNNormal new]];
    }
    
    return [self getStatus:[UNKnow new]];
}

- (void)clearCrash{
    [_dataDic removeAllObjects];
}

- (NSString *)getStatus:(NSObject<StatusProtocol>*)data{
    return [data getStatus];
}

- (void)readCrashData:(NSString *)key{

    if (_dataDic.allKeys.count == 0) {
        NSNumber *num =  [self readDiskData:key];
        if (num) {
            [_dataDic setObject:num forKey:key];
        }
    }
}

- (NSNumber *__nullable)readDiskData:(NSString *)key{
    NSDictionary *dic = [_cacheManager getCrashData];
    if ([dic.allKeys containsObject:key]) {
        return dic[key];
    }
    return nil;
}

@end
