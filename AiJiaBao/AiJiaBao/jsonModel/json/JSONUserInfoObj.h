//
//  JSONUserInfoObj.h
//  AiJiaBao
//
//  Created by nuhgroup on 2017/3/15.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "JSONObj.h"

@interface JSONUserInfoObj : JSONObj

@property (nonatomic, strong) NSString *servName;    //用户名称
@property (nonatomic, strong) NSString *servIconUrl;     //头像地址
@property (nonatomic, strong) NSString *certAuthFlag;    //实名认证标志（Y/N/P/Z）
@property (nonatomic, strong) NSString *mobileAuthFlag; //手机认证标志（Y/N）
@property (nonatomic, strong) NSString *emailAuthFlag;  //邮箱认证标志（Y/N/P）
@property (nonatomic, strong) NSString *policyCount;    //保单总数(待续保、保障中、已失效)
@property (nonatomic, strong) NSString *policyEffCount; //有效保单总数(待续保、保障中)
@property (nonatomic, strong) NSString *policyTotalAmount;  //保单总保额(待续保、保障中)
@property (nonatomic, strong) NSString *policyRelationCount;    //总保障人数（只含家庭成员）
@property (nonatomic, strong) NSString *policyYearPremium;  //年缴保费(待续保、保障中、已失效)
@property (nonatomic, strong) NSString *servFamilyMemberCount;  //客户家庭成员总数
@property (nonatomic, strong) NSString *point;  //保障评分
@property (nonatomic, strong) NSString *pointDate;  //保障评测时间
@property (nonatomic, strong) NSString *pointRanking;   //保障排名
@property (nonatomic, strong) NSString *servFamilyMemberId;     //家庭成员标识
@property (nonatomic, strong) NSString *servId;     //用户标识
@property (nonatomic, strong) NSString *mobileMask;     //手机号码（加码）
@property (nonatomic, strong) NSString *servNameMask;   //用户名称（加码）
@property (nonatomic, strong) NSString *emailMask;       //邮箱地址（加码）
@property (nonatomic, strong) NSString *certNum;     //身份证号
@property (nonatomic, strong) NSString *certNumMask;        //身份证号（加码）
@property (nonatomic, strong) NSString *signFlag;        //当日是否签到（Y/N）
@property (nonatomic, strong) NSString *fundPwdFlag;    //资金密码标志（Y/N）
@property (nonatomic, strong) NSString *timestamp;      //时间戳（yyyy-mm-dd hh:mm:ss）
@property (nonatomic, strong) NSString *coverUrl;       //封面图片地址
@property (nonatomic, strong) NSString *coverLocalUrl;  //封面图片本机地址
@property (nonatomic, strong) NSObject * certNumFlag;   
@property (nonatomic, strong) NSObject * mobileFlag;

- (NSString *) userSign;
- (NSString *) userServName;

@end
