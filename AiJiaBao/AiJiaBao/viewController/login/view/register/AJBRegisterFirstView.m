//
//  AJBRegisterFirstView.m
//  AiJiaBao
//
//  Created by 医麦思 on 2017/2/22.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "AJBRegisterFirstView.h"
#import "AJBCustomTextField.h"
#import "AJBBaseHttpViewController.h"

@interface AJBRegisterFirstView ()

@property (nonatomic, strong) AJBCustomTextField *textFieldView;
@property (nonatomic, strong) NSString *textFieldText;


@property (nonatomic, strong) UIButton *agreeButton;
@property (nonatomic, strong) UIButton *nextButton;

@end

@implementation AJBRegisterFirstView

- (instancetype)init
{
    if (self = [super init]) {
        __weak typeof(self) __weakSelf = self;
        
        [self addSubview:self.textFieldView];
        [self.textFieldView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(MARGIN_20);
            make.left.mas_equalTo(0);
            make.width.mas_equalTo(SCREEN_WIDTH);
            make.height.mas_equalTo(40);
        }];
        
        [self addSubview:self.agreeButton];
        [_agreeButton sizeToFit];
        [self.agreeButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(__weakSelf.textFieldView.mas_bottom).offset(MARGIN_5);
            make.left.mas_equalTo(25);
            make.height.mas_equalTo(20);
        }];
            
        [self addSubview:self.nextButton];
        [self.nextButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(__weakSelf.agreeButton.mas_bottom).offset(MARGIN_20+MARGIN_40);
            make.left.mas_equalTo(MARGIN_20);
            make.right.equalTo(__weakSelf.mas_right).offset(-MARGIN_20);
            make.height.mas_equalTo(45);
        }];
    }
    return self;
}

#pragma mark - getters and setters
- (AJBCustomTextField *)textFieldView
{
    if (!_textFieldView) {
        __weak typeof(self) __weakSelf = self;
        self.textFieldView = [[AJBCustomTextField alloc] initWithtextFieldPlaceholder:@"请输入手机号" image:@"icon_register_phone" notification:^(NSString * text) {
            __weakSelf.textFieldText = text;
            [__weakSelf onNotificationPhoneTextField];

        } type:CustomTextFieldType_PHONE];
    }
    return _textFieldView;
}

- (UIButton *)agreeButton
{
    if (!_agreeButton) {
        self.agreeButton = [[UIButton alloc] init];
        _agreeButton.titleLabel.font = FONT_OF_SIZE_12;
        NSString *string = @"同意《爱家保注册协议》";
        NSMutableAttributedString *attString = [[NSMutableAttributedString alloc] initWithString:string];
        [attString addAttribute:NSForegroundColorAttributeName value:COLOR_UI_54C1F5 range:NSMakeRange(2,string.length-2)];
        [_agreeButton setAttributedTitle:attString forState:UIControlStateNormal];
        [_agreeButton setImage:imageNamed(@"icon_register_hook") forState:UIControlStateNormal];
        [_agreeButton setIconInLeftWithSpacing:MARGIN_10];
        [_agreeButton setTitleColor:COLOR_UI_333333 forState:UIControlStateNormal];
        [_agreeButton addTarget:self action:@selector(onAgreeAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _agreeButton;
}

- (UIButton *)nextButton
{
    if (!_nextButton) {
        self.nextButton = [[UIButton alloc] init];
        _nextButton.layer.cornerRadius = 5;
        _nextButton.titleLabel.font = FONT_OF_SIZE_14;
        [_nextButton setTitle:@"下一步（1/3）" forState:UIControlStateNormal];
        [_nextButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_nextButton addTarget:self action:@selector(onNextAction:) forControlEvents:UIControlEventTouchUpInside];
        _nextButton.backgroundColor = COLOR_UI_dddddd;
        _nextButton.enabled = NO;
    }
    return _nextButton;
}

#pragma mark - action
- (void) onNotificationPhoneTextField
{
    if (_textFieldText.length > 10) {
        _nextButton.enabled = YES;
        _nextButton.backgroundColor = COLOR_UI_54C1F5;
    } else {
        _nextButton.enabled = NO;
        _nextButton.backgroundColor = COLOR_UI_dddddd;
    }
}

- (void) onAgreeAction:(UIButton *) sender
{
    AJBBaseHttpViewController *vc = [[AJBBaseHttpViewController alloc] initWithTitle:@"爱家保协议" url:@""];
    [self.navigationController presentViewController:vc animated:YES completion:nil];
}

- (void) onNextAction:(UIButton *) sender
{
    if ([AJBCommon isMobileNumber:_textFieldText]) {
        self.phoneString = _textFieldText;
        if ([_delegate respondsToSelector:@selector(firstNextAction:)]) {
            [self.delegate firstNextAction:sender];
        }
    } else {
        [MBProgressHUD toastText:@"请输入正确的手机号"];
    }
}


@end
