//
//  AJBEnterView.m
//  AiJiaBao
//
//  Created by nuhgroup on 2017/3/6.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "AJBEnterView.h"

@interface AJBEnterView ()

@end

@implementation AJBEnterView

- (instancetype)init
{
    if (self = [super init]) {
        
        __weak typeof(self) __weakSelf = self;
        
        [self addSubview:self.textfield];
        [self.textfield mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(__weakSelf.line).offset(MARGIN_15);
            make.top.mas_equalTo(MARGIN_10);
            make.width.mas_equalTo(150);
            make.height.mas_equalTo(20);
        }];
    }
    return self;
}

#pragma mark - getters and setters
- (UITextField *) textfield
{
    if (!_textfield) {
        self.textfield = [[UITextField alloc] init];
        _textfield.font = FONT_OF_SIZE_14;
        _textfield.textColor = COLOR_UI_888888;
    }
    return _textfield;
}

- (void) refreshWithTitle:(NSString *)title placeholder:(NSString *)placeholder
{
    self.titleLabel.text = title;
    self.textfield.placeholder = placeholder;
}

@end
