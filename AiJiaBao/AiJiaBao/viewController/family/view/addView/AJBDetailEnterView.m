//
//  AJBDetailEnterView.m
//  AiJiaBao
//
//  Created by nuhgroup on 2017/3/7.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "AJBDetailEnterView.h"

@implementation AJBDetailEnterView

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
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onTextBegin) name:UITextFieldTextDidBeginEditingNotification object:nil];
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

-(void) onTextBegin
{
    if ([self.delegate respondsToSelector:@selector(textFieldBeginEdit)]) {
        [self.delegate textFieldBeginEdit];
    }
}


@end
