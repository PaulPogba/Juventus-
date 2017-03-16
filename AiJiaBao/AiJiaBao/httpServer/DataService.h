//
//  BaseAPIList.h
//  Bylaw
//
//  Created by Marchisio on 17/3/11.
//  Copyright © 2017年 小Marchisio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetworkRequest.h"
//#import "MJExtension.h"
@interface DataService : NSObject

typedef void (^loadTokenRespnseBlock)(BOOL success);

/**
 POST请求转模型
 */
+ (void)postWithinterfaceType:(NSString *)interfaceType param:(id)param responseBlock:(requestSuccessBlock)responseDataBlock loadTokenRespnseBlock:(void (^)(BOOL success))loadTokenRespnseBlock  hud:(MBProgressHUD *)hud ;

@end
