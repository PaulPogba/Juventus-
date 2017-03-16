//
//  UIView+AiJiaBao.m
//  AiJiaBao
//
//  Created by nuhgroup on 2017/3/14.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "UIView+AiJiaBao.h"

@implementation UIView (AiJiaBao)

- (MBProgressHUD *) showHUD: (NSString *) text
{
    return [MBProgressHUD showInView:self text:text];
}

@end
