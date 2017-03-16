//
//  JSONLoginObj.h
//  AiJiaBao
//
//  Created by nuhgroup on 2017/3/15.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "JSONObj.h"

@interface JSONLoginObj : JSONObj

@property (nonatomic, assign) NSInteger loginFlag;  //true登录成功 false登录失败
@property (nonatomic, strong) NSString *token;  //令牌(登录失败为空)
@property (nonatomic, strong) NSString *sysCaptchaCode;     //系统验证码（可空）
@property (nonatomic, strong) NSString *errMessage;     //登录失败原因(可空)


@end
