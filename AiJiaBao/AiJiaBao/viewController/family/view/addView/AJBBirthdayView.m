//
//  AJBBirthdayView.m
//  AiJiaBao
//
//  Created by nuhgroup on 2017/3/6.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "AJBBirthdayView.h"
#import "AJBBirthdayPickerView.h"

@interface AJBBirthdayView ()


@property (nonatomic, strong) AJBBirthdayPickerView *pickerView;

@end

@implementation AJBBirthdayView

- (instancetype)init
{
    if (self = [super init]) {
        
        __weak typeof(self) __weakSelf = self;
        
        [self addSubview:self.button];
        [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(__weakSelf.line).offset(MARGIN_15);
            make.top.mas_equalTo(MARGIN_10);
            make.width.mas_equalTo(150);
            make.height.mas_equalTo(20);
        }];
    }
    return self;
}

#pragma mark - getters and setters

- (UIButton *) button
{
    if (!_button) {
        self.button = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.button setTitleColor:COLOR_UI_888888 forState:UIControlStateNormal];
        self.button.titleLabel.font = FONT_OF_SIZE_14;
        [_button addTarget:self action:@selector(onShowPickerView:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _button;
}


#pragma mark - action
- (void) onShowPickerView:(UIButton *) sender
{
    if ([self.delegate respondsToSelector:@selector(showPickerView)]) {
        [self.delegate showPickerView];
    }
}

@end
