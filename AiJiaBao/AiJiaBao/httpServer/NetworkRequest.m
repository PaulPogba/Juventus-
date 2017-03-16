//
//  BaseAPIList.h
//  Bylaw
//
//  Created by Marchisio on 17/3/11.
//  Copyright © 2017年 小Marchisio. All rights reserved.
//

#import "NetworkRequest.h"
#import "AFNetworking.h"

@implementation NetworkRequest

/**
    固定请求头
 */
+ (void) setStaticHeaderForRequestSerializer: (AFHTTPRequestSerializer *) request responseSerializer: (AFHTTPResponseSerializer *) response
{
    /*
     Content-Type = 'application/json;charset=UTF-8'
     Content-Type = 'text/json;charset=UTF-8'
     Content-Type = 'text/javascript;charset=UTF-8'
     Content-Type = 'application/javascript;charset=UTF-8'
     */
//    response.acceptableContentTypes = [NSSet setWithObjects:@"text/javascript", @"application/json", @"text/json", @"text/html", @"text/plain", @"charset=utf-8", nil];
//    [request setValue:@"gzip" forHTTPHeaderField:@"Accept-Encoding"];//固定字符串:gzip
//    [request setValue:@"close" forHTTPHeaderField:@"Connection"];//固定字符串:close
     response.acceptableContentTypes =  [NSSet setWithObjects:@"application/json", @"text/html",@"text/json",@"text/javascript", nil];

}

/**
    post
 */
+ (void)postRequest:(NSString *)url params:(id)params success:(requestSuccessBlock)successHandler failure:(requestFailureBlock)failureHandler progressBlock:(progressBlock)progressBlock{
    
    if (![self checkNetworkStatus]) {
        successHandler(nil);
        failureHandler(nil,nil);
        return;
    }
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval = 10.f;
    [NetworkRequest setStaticHeaderForRequestSerializer:manager.requestSerializer responseSerializer:manager.responseSerializer];
    
    NSString *string = [params mj_JSONString];
    
    [manager POST:url parameters:string progress:^(NSProgress * _Nonnull uploadProgress) {
        progressBlock(uploadProgress); //进度
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        successHandler(responseObject); //成功
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureHandler(task,error); //失败
    }];
}

/**
    监控网络状态
 */
+ (BOOL)checkNetworkStatus {
    
    __block BOOL isNetworkUse = YES;
    
    AFNetworkReachabilityManager *reachabilityManager = [AFNetworkReachabilityManager sharedManager];
    [reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        if (status == AFNetworkReachabilityStatusUnknown) {
            isNetworkUse = YES;
        } else if (status == AFNetworkReachabilityStatusReachableViaWiFi){
            isNetworkUse = YES;
        } else if (status == AFNetworkReachabilityStatusReachableViaWWAN){
            isNetworkUse = YES;
        } else if (status == AFNetworkReachabilityStatusNotReachable){
            // 网络异常操作
            isNetworkUse = NO;
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.6 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                });
            });
        }
     }];
    [reachabilityManager startMonitoring];
    return isNetworkUse;
}

/*
 - (void) checkHttps
 {
 AFSecurityPolicy *securityPolicy = [AFSecurityPolicy defaultPolicy];
 //allowInvalidCertificates 是否允许无效证书（也就是自建的证书），默认为NO
 //如果是需要验证自建证书，需要设置为YES
 securityPolicy.allowInvalidCertificates = YES;
 
 //validatesDomainName 是否需要验证域名，默认为YES；
 //假如证书的域名与你请求的域名不一致，需把该项设置为NO
 //主要用于这种情况：客户端请求的是子域名，而证书上的是另外一个域名。因为SSL证书上的域名是独立的，假如证书上注册的域名是www.google.com，那么mail.google.com是无法验证通过的；
 securityPolicy.validatesDomainName = NO;
 //validatesCertificateChain 是否验证整个证书链，默认为YES
 //设置为YES，会将服务器返回的Trust Object上的证书链与本地导入的证书进行对比，这就意味着，假如你的证书链是这样的：
 //GeoTrust Global CA
 // Google Internet Authority G2
 // *.google.com
 //那么，除了导入*.google.com之外，还需要导入证书链上所有的CA证书（GeoTrust Global CA, Google Internet Authority G2）；
 //如是自建证书的时候，可以设置为YES，增强安全性；假如是信任的CA所签发的证书，则建议关闭该验证；
 _manager.securityPolicy = securityPolicy;
 }
 */

@end
