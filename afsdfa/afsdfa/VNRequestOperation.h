//
//  VNRequestOperation.h
//  CER_IKE_01
//
//  Created by guohq on 2019/8/6.
//  Copyright © 2019 saicmotor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VNOperationProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface VNRequestOperation : NSOperation<VNOperationProtocol,NSURLSessionDelegate>


@end

NS_ASSUME_NONNULL_END
