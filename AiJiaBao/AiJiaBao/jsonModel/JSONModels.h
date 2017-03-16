//
//  JSONModels.h
//  AiJiaBao
//
//  Created by nuhgroup on 2017/3/1.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import <Foundation/Foundation.h>

//resp
#import "RestNetworkRequestResp.h"
#import "RestRegisterResp.h"
#import "RestUserInfoResp.h"
#import "RestLoginResp.h"
#import "RestUserAccountResp.h"

//json
#import "JSONCouponObj.h"
#import "JSONTestObj.h"
#import "JSONRegisterObj.h"
#import "JSONUserInfoObj.h"
#import "JSONLoginObj.h"
#import "JSONUserAccountObj.h"

@interface JSONModels : NSObject

+ (void) setup;

@end
