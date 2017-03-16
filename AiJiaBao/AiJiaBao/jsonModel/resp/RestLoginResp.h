//
//  RestLoginResp.h
//  AiJiaBao
//
//  Created by nuhgroup on 2017/3/15.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "JSONObj.h"

@interface RestLoginResp : JSONObj

@property (nonatomic, assign) NSInteger errcode;
@property (nonatomic, strong) NSString * message;
@property (nonatomic, assign) NSInteger operFlag;
@property (nonatomic, strong) NSMutableArray * result;

@end
