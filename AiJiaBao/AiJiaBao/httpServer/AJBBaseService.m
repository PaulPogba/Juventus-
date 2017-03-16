//
//  AJBBaseService.m
//  AiJiaBao
//
//  Created by Marchisio on 2017/3/12.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "AJBBaseService.h"

@implementation AJBBaseService
+ (id)modelTransformationWithResponseObj:(id)responseObj modelClass:(Class)modelClass{
//    NSArray *arr=responseObj;
////    modelClass = responseObj.result;
//    JSONTestObj *object = [JSONTestObj mj_objectWithKeyValues:responseObj];
    return responseObj;
}


@end
