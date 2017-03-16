//
//  JSONTestObj.m
//  AiJiaBao
//
//  Created by Marchisio on 2017/3/13.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "JSONTestObj.h"

@implementation JSONTestObj
+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"users":@"User",// 或者
             //             @"users":[User class],
             };
}
@end
