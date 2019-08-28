//
//  VehicleCache.m
//  CER_IKE_01
//
//  Created by guohq on 2019/8/26.
//  Copyright © 2019 saicmotor. All rights reserved.
//

#define cachefilePath  [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject]
#define filePaht       [cachefilePath stringByAppendingPathComponent:@"vehicleStatus/data.json"]

#import "VehicleCache.h"
#import "VNRequestOperation.h"

@interface VehicleCache()

@property (strong, nonatomic, nonnull) NSOperationQueue *requestQueue;
@property (nonatomic, strong)    dispatch_queue_t synchronizationQueue;
@property (nonatomic, strong)    dispatch_semaphore_t semaphore;



@end

@implementation VehicleCache

- (instancetype)init{
    if (self = [super init]) {
        _requestQueue       = [[NSOperationQueue alloc]init];
        _requestQueue.name  = @"com.vn.requetQueue";
        _requestQueue.maxConcurrentOperationCount = 3;
        _semaphore = dispatch_semaphore_create(3);
        _synchronizationQueue = dispatch_queue_create("com.guohq", DISPATCH_QUEUE_CONCURRENT);
        
    }
    return self;
}


- (void)cacheData:(id)data key:(NSString *)key{
    [self wirteData:data key:key];
}

- (NSDictionary *)getCrashData{
    return [self readCacheData];
}

- (NSString *)cachePath{
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *dirPath = [filePaht stringByDeletingLastPathComponent];
    if (![fileManager fileExistsAtPath:dirPath]) {
      
        if (![fileManager createDirectoryAtPath:dirPath withIntermediateDirectories:YES attributes:nil error:nil]) {
            NSLog(@"创建文件夹失败");
        }
        if (![fileManager createFileAtPath:filePaht contents:nil attributes:nil]) {
            NSLog(@"车态缓存创建failed");
        }
    }
    return filePaht;
}

- (NSDictionary *)readCacheData{
    NSString *path = [self cachePath];
    NSFileHandle *handle = [NSFileHandle fileHandleForReadingAtPath:path];
//    NSLog(@"路径%@",path);
    NSData *fileData = [handle readDataToEndOfFile];
    NSError *error;
    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:fileData options:NSJSONReadingAllowFragments error:&error];
    [handle closeFile];
    return jsonDict;
}


- (void)wirteData:(id)data key:(NSString *)key{
//    NSMutableDictionary *cacheData = [[self readCacheData] mutableCopy];
//    if (cacheData.count == 0) {
//        cacheData = [NSMutableDictionary dictionary];
//    }
//    __weak typeof(self) weakself = self;
//    dispatch_semaphore_wait(_semaphore, DISPATCH_TIME_FOREVER);
//    dispatch_async(_synchronizationQueue, ^{
//        NSLog(@"当前线程%@",[NSThread currentThread]);
//        [self clearCrashData];
//        [cacheData setObject:data forKey:key];
//        [self writeDataToFile:cacheData];
//        sleep(5);
//        dispatch_semaphore_signal(weakself.semaphore);
//    });
    
    VNRequestOperation *operation = [[VNRequestOperation alloc]initOperationWithTask:^{
        NSMutableDictionary *cacheData = [[self readCacheData] mutableCopy];
        NSLog(@"当前线程%@",[NSThread currentThread]);
        @synchronized (self) {
            if (cacheData.count == 0) {
                cacheData = [NSMutableDictionary dictionary];
            }
            [self clearCrashData];
            [cacheData setObject:data forKey:key];
            [self writeDataToFile:cacheData];

        }
    }];
    operation.name = key;
    [_requestQueue addOperation:operation];

}

- (void)clearCrashData{
//    NSLog(@"当前线程%@",[NSThread currentThread]);
    NSFileManager  *fileMananger = [NSFileManager defaultManager];
    if ([fileMananger fileExistsAtPath:filePaht]) {
        NSDictionary *dic = [fileMananger attributesOfItemAtPath:filePaht error:nil];
        long long size = [dic fileSize];
//        NSLog(@"%lld",[dic fileSize]);
        
        // 大于 10kb
        if (size > 2 * 1024) {
//            NSLog(@"执行删除文件中");
//            @synchronized (self) {
                NSMutableDictionary *dic = [[self readCacheData] mutableCopy];
                [dic removeObjectForKey:dic.allKeys.firstObject];
                [self writeDataToFile:dic];
                [self clearCrashData];
//            }
            
        }
    }
}

- (void)writeDataToFile:(NSMutableDictionary *)cacheData{
    NSData*jsonData = [NSJSONSerialization dataWithJSONObject:cacheData options:NSJSONWritingPrettyPrinted error:nil];
    [jsonData writeToFile:filePaht atomically:YES];
}

@end
