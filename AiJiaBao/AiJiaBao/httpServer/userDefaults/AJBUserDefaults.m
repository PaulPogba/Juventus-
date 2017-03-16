//
//  AJBUserDefaults.m
//  AiJiaBao
//
//  Created by nuhgroup on 2017/3/13.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "AJBUserDefaults.h"

#define KEY_TOKEN @"KEY_TOKEN"

#define KEY_DEVICE_TOKEN @"KEY_DEVICE_TOKEN"

#define KEY_USER_PHONE @"KEY_USER_PHONE"

#define KEY_USER_PASSWORD @"KEY_USER_PASSWORD"

#define KEY_USER_INFO @"KEY_USER_INFO"


@implementation AJBUserDefaults

// 用户 token
+ (void) saveToken:(NSString *)token
{
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    [def setObject:token forKey:KEY_TOKEN];
    [def synchronize];
}

+ (NSString *) getToken
{
    NSString *userToken = [[NSUserDefaults standardUserDefaults] stringForKey:KEY_TOKEN];
    if(userToken == nil || userToken.length == 0)
    {
        return @"";
    } else
    {
        return userToken;
    }
}

// 设备 token
+ (void) saveDeviceToken:(NSString*) deviceToken
{
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    [def setObject:deviceToken forKey:KEY_DEVICE_TOKEN];
    [def synchronize];
}

+ (NSString *) getDeviceToken
{
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    return [def stringForKey:KEY_DEVICE_TOKEN];
}

// 用户手机号
+ (void) saveUserPhone:(NSString *) phone
{
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    [def setObject:phone forKey:KEY_USER_PHONE];
    [def synchronize];

}
+ (NSString *) getUserPhone
{
    NSString *phone = [[NSUserDefaults standardUserDefaults] stringForKey:KEY_USER_PHONE];
    if(phone == nil || phone.length == 0)
    {
        return @"";
    } else
    {
        return phone;
    }
}


//用户密码
+ (void) saveUserPassword:(NSString *) password
{
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    [def setObject:password forKey:KEY_USER_PASSWORD];
    [def synchronize];
}

+ (NSString *) getUserPassword
{
    NSString *password = [[NSUserDefaults standardUserDefaults] stringForKey:KEY_USER_PASSWORD];
    if(password == nil || password.length == 0)
    {
        return @"";
    } else
    {
        return password;
    }
}


+ (void) saveUserInfo:(JSONUserInfoObj *)info
{
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    [def setObject:[info mj_keyValues] forKey:KEY_USER_INFO];
    [def synchronize];

}


+ (JSONUserInfoObj *) getUserInfo
{
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    NSDictionary *dic = [def dictionaryForKey:KEY_USER_INFO];
    if (dic != nil)
    {
        JSONUserInfoObj *sever = [JSONUserInfoObj mj_objectWithKeyValues:dic];
        return sever;
    }else
    {
        return nil;
    }
}

@end
