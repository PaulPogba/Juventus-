//
//  familyListModel.h
//  AiJiaBao
//
//  Created by Marchisio on 2017/3/15.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface familyListModel : NSObject
@property (nonatomic, strong) NSString *servFamilyMemberId;//家庭成员ID
@property (nonatomic, strong) NSString *servIconUrl;//头像地址
@property (nonatomic, strong) NSString *memberName;//成员姓名
@property (nonatomic, strong) NSString *relationTypeDesc;//关系描述（翻译）
@property (nonatomic, strong) NSString *price;//评分
@property (nonatomic, strong) NSString *liabilityValue;//责任总额（万元）
@property (nonatomic, strong) NSString *guaranteeValue;//保障总额（万元）
@property (nonatomic, strong) NSString *servPolicyCount;//保单总数

@end
