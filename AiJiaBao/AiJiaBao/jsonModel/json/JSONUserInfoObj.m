//
//  JSONUserInfoObj.m
//  AiJiaBao
//
//  Created by nuhgroup on 2017/3/15.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "JSONUserInfoObj.h"

@implementation JSONUserInfoObj

- (NSString *)userSign
{
    if ([self.signFlag isEqualToString:@"Y"]) {
        return @"已签到";
    } else {
        return @"未签到";
    }
}

- (NSString *)userServName
{
    if (IS_STR_EMPTY(self.servName)) {
        return @"未实名";
    } else {
        return self.servName;
    }
}



@end
