//
//  AJBCommon.m
//  AiJiaBao
//
//  Created by 医麦思 on 2017/2/22.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "AJBCommon.h"

@implementation AJBCommon

+ (BOOL)isMobileNumber:(NSString *)mobileNum
{
//    if ([mobileNum hasPrefix:@"999"]) {
//        return YES;
//    }
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|7[0678]|8[0-9])\\d{8}$";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    if ([regextestmobile evaluateWithObject:mobileNum] == YES)
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

+ (CAGradientLayer *) gradientLayerWithHeight:(CGFloat)height
{
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = @[(__bridge id)COLOR_UI_63e9fc.CGColor, (__bridge id)COLOR_UI_54C1F5.CGColor];
    gradientLayer.locations = @[@0.0, @1.0];
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(0,1.0);
    gradientLayer.frame = CGRectMake(0, 0, SCREEN_WIDTH,height);
    return gradientLayer;
}

- (void) pushViewController:(UIViewController *)ViewController animated:(BOOL)animated
{
    
}

@end
