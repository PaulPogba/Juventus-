//
//  AJBAddView.h
//  AiJiaBao
//
//  Created by nuhgroup on 2017/3/6.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//
/*
    整个用户资料的父类
 */
#import <UIKit/UIKit.h>

@interface AJBAddView : UIView

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIView *line;
@property (nonatomic, strong) UIView *bottomLine;

- (void) refreshWithTitle:(NSString *)title;

@end
