
//
//  AJBAddView.m
//  AiJiaBao
//
//  Created by nuhgroup on 2017/3/6.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "AJBAddView.h"

@interface AJBAddView ()


@end

@implementation AJBAddView

- (instancetype)init
{
    if (self = [super init]) {
        
        __weak typeof(self) __weakSelf = self;
        
        [self addSubview:self.titleLabel];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(MARGIN_15);
            make.top.mas_equalTo(MARGIN_10);
            make.width.mas_equalTo(80);
            make.height.mas_equalTo(20);
        }];
        
        [self addSubview:self.line];
        [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(__weakSelf.titleLabel.mas_right);
            make.top.mas_equalTo(12);
            make.height.mas_equalTo(MARGIN_15);
            make.width.mas_equalTo(1);
        }];
    
        [self addSubview:self.bottomLine];
        [self.bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.bottom.equalTo(__weakSelf.mas_bottom);
            make.width.equalTo(__weakSelf.mas_width);
            make.height.mas_equalTo(1);
        }];
    }
    return self;
}

#pragma mark - getters and setters
- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        self.titleLabel = [[UILabel alloc] init];
        _titleLabel.font = FONT_OF_SIZE_14;
        _titleLabel.textColor = COLOR_UI_888888;
        _titleLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _titleLabel;
}


- (UIView *)line
{
    if (!_line) {
        self.line = [[UILabel alloc] init];
        _line.backgroundColor = COLOR_UI_f1f1f1;
    }
    return _line;
}


- (UIView *)bottomLine
{
    if (!_bottomLine) {
        self.bottomLine = [[UILabel alloc] init];
        _bottomLine.backgroundColor = COLOR_UI_f1f1f1;
    }
    return _bottomLine;
}



- (void) refreshWithTitle:(NSString *)title
{
    _titleLabel.text = title;
}

@end
