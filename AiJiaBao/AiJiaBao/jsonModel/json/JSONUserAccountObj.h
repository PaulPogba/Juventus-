//
//  JSONUserAccountObj.h
//  AiJiaBao
//
//  Created by nuhgroup on 2017/3/15.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "JSONObj.h"

@interface JSONUserAccountObj : JSONObj

@property (nonatomic, strong) NSString *balance;    //现金余额（元）
@property (nonatomic, strong) NSString *score;   //积分
@property (nonatomic, strong) NSString *couponCount;    //优惠券张数(P:待使用)
@property (nonatomic, strong) NSString *servGrowthAcctLevelName;    //用户成长账户级别名称
@property (nonatomic, strong) NSString *growthValue;    //当前成长值
@property (nonatomic, strong) NSString *maxGrowthValue;     //当前等级最大成长值
@property (nonatomic, strong) NSString *growthIconUrl;      //当前等级图标地址

@end
