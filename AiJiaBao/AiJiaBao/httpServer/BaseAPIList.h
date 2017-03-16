//
//  BaseAPIList.h
//  Bylaw
//
//  Created by Marchisio on 17/3/11.
//  Copyright © 2017年 小Marchisio. All rights reserved.
//

#ifndef BaseAPIList_h
#define BaseAPIList_h

//外网
//#define SeviceURL @"http://app.baojiabei.com:8765"

// 内网
#define SeviceURL @"http://192.168.1.26:8080"

//测试
//#define  SeviceURL @"http://114.247.227.250:8080"

//然哥
//#define SeviceURL @"http://192.168.1.65:8090"

#define BaseURL    [NSString stringWithFormat:@"%@/appcontroller/app/interface.ajax",SeviceURL]

/*********************************首页*******************************/

#pragma mark                             发送手机验证码

#define SEND_SMS_CAPTCHA_CODE   @"SEND_SMS_CAPTCHA_CODE"    //发送验证码

#define REGISTER    @"REGISTER"     //注册
#define LOGIN       @"LOGIN"        //登录

#define TOKEN_APPLY     @"TOKEN_APPLY"      //申请用户令牌
#define SERV_INFO       @"SERV_INFO"        //获取用户信息

#define SERV_ACCOUNT_INFO   @"SERV_ACCOUNT_INFO"


#endif /* BaseAPIList_h */
