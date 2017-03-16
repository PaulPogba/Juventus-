//
//  AJBFindSecretThreeView.m
//  AiJiaBao
//
//  Created by 医麦思 on 2017/2/23.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "AJBFindSecretThreeView.h"
#import "AJBCustomTextField.h"

@interface AJBFindSecretThreeView ()

@property (nonatomic, strong) AJBCustomTextField *textFieldView1;
@property (nonatomic, strong) AJBCustomTextField *textFieldView2;

@property (nonatomic, strong) UIButton *doneButton;
@property (nonatomic, strong) NSString *textFieldText;


@end

@implementation AJBFindSecretThreeView

- (instancetype)init
{
    if (self = [super init]) {
        
        __weak typeof(self) __weakSelf = self;
        
        [self addSubview:self.textFieldView1];
        [self.textFieldView1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(MARGIN_20);
            make.left.mas_equalTo(0);
            make.width.mas_equalTo(SCREEN_WIDTH);
            make.height.mas_equalTo(40);
        }];

        [self addSubview:self.textFieldView2];
        [self.textFieldView2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(__weakSelf.textFieldView1.mas_bottom).offset(MARGIN_15);
            make.left.mas_equalTo(0);
            make.width.mas_equalTo(SCREEN_WIDTH);
            make.height.mas_equalTo(40);
        }];

        [self addSubview:self.doneButton];
        [self.doneButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(__weakSelf.textFieldView2.mas_bottom).offset(MARGIN_20+MARGIN_40);
            make.left.mas_equalTo(MARGIN_20);
            make.right.equalTo(__weakSelf.mas_right).offset(-MARGIN_20);
            make.height.mas_equalTo(45);
        }];
    }
    return self;
}


#pragma mark - getteres and setters
- (AJBCustomTextField *)textFieldView1
{
    if (!_textFieldView1) {
        __weak typeof(self) __weakSelf = self;
        self.textFieldView1 = [[AJBCustomTextField alloc] initWithtextFieldPlaceholder:@"请输入登录密码" image:@"homeA" notification:^(NSString * text) {
            __weakSelf.textFieldText = text;
            [__weakSelf onNotificationRegisterSecretTextField];
            
        } type:CustomTextFieldType_SECRET];
    }
    return _textFieldView1;
}
- (AJBCustomTextField *)textFieldView2
{
    if (!_textFieldView2) {
        __weak typeof(self) __weakSelf = self;
        self.textFieldView2 = [[AJBCustomTextField alloc] initWithtextFieldPlaceholder:@"请再次输入登录密码" image:@"homeA" notification:^(NSString * text) {
            __weakSelf.textFieldText = text;
            [__weakSelf onNotificationRegisterSecretTextField];
            
        } type:CustomTextFieldType_SECRET];
    }
    return _textFieldView2;
}

- (UIButton *) doneButton
{
    if (!_doneButton) {
        self.doneButton = [[UIButton alloc] init];
        _doneButton.layer.cornerRadius = 5;
        _doneButton.titleLabel.font = FONT_OF_SIZE_14;
        [_doneButton setTitle:@"完成（3/3）" forState:UIControlStateNormal];
        [_doneButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_doneButton addTarget:self action:@selector(onDoneAction:) forControlEvents:UIControlEventTouchUpInside];
        _doneButton.backgroundColor = COLOR_UI_dddddd;
    }
    return _doneButton;
}


#pragma mark - action
- (void) onDoneAction:(UIButton *)sender
{
    
}

- (void) onShowRegisterSecretAction:(UIButton *) sender
{
    if (!sender.selected && _textFieldText.length > 0) {
        _textFieldView1.textField.secureTextEntry = NO;
    } else {
        _textFieldView1.textField.secureTextEntry = YES;
    }
    
    if (_textFieldText.length > 0) {
        sender.selected = !sender.selected;
    } else {
        sender.selected = NO;
    }
}

- (void) onNotificationRegisterSecretTextField
{
    if (_textFieldText.length > 0) {
        _textFieldView1.textField.secureTextEntry = YES;
        _doneButton.enabled = YES;
        _doneButton.backgroundColor = COLOR_UI_54C1F5;
    } else {
        _doneButton.enabled = NO;
        _doneButton.backgroundColor = COLOR_UI_dddddd;
    }
}


@end
