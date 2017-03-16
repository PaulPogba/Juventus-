//
//  JSONCouponObj.h
//  AiJiaBao
//
//  Created by nuhgroup on 2017/3/2.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "JSONObj.h"

@interface JSONCouponObj : JSONObj

@property (nonatomic, assign) BOOL isShowMore;

@property (nonatomic, strong) NSString *price;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSArray *array;
@property (nonatomic, assign) NSInteger state;

@end
