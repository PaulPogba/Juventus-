//
//  AJBUserDefaults.h
//  AiJiaBao
//
//  Created by nuhgroup on 2017/3/13.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AJBUserDefaults : NSObject
//用户 token
+ (void) saveToken:(NSString *)token;
+ (NSString *) getToken;

// 设备 token
+ (void) saveDeviceToken:(NSString*) deviceToken;
+ (NSString *) getDeviceToken;

// 用户手机号
+ (void) saveUserPhone:(NSString *) phone;
+ (NSString *) getUserPhone;


//用户密码
+ (void) saveUserPassword:(NSString *) password;
+ (NSString *) getUserPassword;


//用户信息
+ (void) saveUserInfo:(JSONUserInfoObj *)info;
+ (JSONUserInfoObj *) getUserInfo;

@end
