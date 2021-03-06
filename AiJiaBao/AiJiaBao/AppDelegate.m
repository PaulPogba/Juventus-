//
//  AppDelegate.m
//  AiJiaBao
//
//  Created by 医麦思 on 2017/2/20.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "AppDelegate.h"

#import "AJBTabBarViewController.h"
#import "AJBNavigationViewController.h"
#import "AJBLoginViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    [self configThirdParty];
    
    if (IS_STR_EMPTY([AJBUserDefaults getToken]))
    {//如果本地保存没有 token, 则直接进入登录页
        [self enterLogin];
    } else {
        //如果本地保存有 token, 则直接进入首页
        [self enterHome];
    }
    
    [self.window makeKeyAndVisible];
    return YES;
}

-(void) configThirdParty
{
    [[UMSocialManager defaultManager] setUmSocialAppkey:UmSocialAppkey];
    
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_WechatSession appKey:WXAppId appSecret:WXSecret redirectURL:@"http://mobile.umeng.com/social"];
}

- (void) enterHome
{
     AJBTabBarViewController *tabbar = [[AJBTabBarViewController alloc] init];
     self.window.rootViewController = tabbar;
}

- (void) enterLogin
{
    AJBLoginViewController *login = [[AJBLoginViewController alloc] init];
    AJBNavigationViewController *nav = [[AJBNavigationViewController alloc] initWithRootViewController:login];
    self.window.rootViewController = nav;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - url
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    //6.3的新的API调用，是为了兼容国外平台(例如:新版facebookSDK,VK等)的调用[如果用6.2的api调用会没有回调],对国内平台没有影响
    BOOL result = [[UMSocialManager defaultManager] handleOpenURL:url sourceApplication:sourceApplication annotation:annotation];
    if (!result) {
        // 其他如支付等SDK的回调
    }
    return result;
}

@end
