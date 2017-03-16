//
//  AJBEnterView.h
//  AiJiaBao
//
//  Created by nuhgroup on 2017/3/6.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//
/*姓名  身份证*/
#import <UIKit/UIKit.h>
#import "AJBAddView.h"


@interface AJBEnterView : AJBAddView

@property (nonatomic, strong) UITextField *textfield;

- (void) refreshWithTitle:(NSString *)title placeholder:(NSString *)placeholder;

@end
