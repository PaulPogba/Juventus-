//
//  BaseAPIList.h
//  Bylaw
//
//  Created by Marchisio on 17/3/11.
//  Copyright © 2017年 小Marchisio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RestNetworkRequestResp.h"

@class FileConfig;

/**
 请求成功block
 */
typedef void (^requestSuccessBlock)(id responseObject);

/**
 请求失败block
 */
typedef void (^requestFailureBlock) (NSURLSessionDataTask *task,NSError *error);

/**
 监听进度响应block
 */
typedef void (^progressBlock)(NSProgress *uploadProgress);


#ifdef DEBUG
#define XLLog(...) NSLog(__VA_ARGS__)
#else
#define XLLog(...)
#endif

@interface NetworkRequest : NSObject
/**
 POST请求
 */
+ (void)postRequest:(NSString *)url params:(id)params success:(requestSuccessBlock)successHandler failure:(requestFailureBlock)failureHandler progressBlock:(progressBlock)progressBlock;

+ (BOOL)checkNetworkStatus;

@end
