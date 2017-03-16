//
//  AJBRegisterSecondView.m
//  AiJiaBao
//
//  Created by 医麦思 on 2017/2/22.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "AJBRegisterSecondView.h"
#import "AJBCustomTextField.h"

@interface AJBRegisterSecondView ()<UITextFieldDelegate>

@property (nonatomic, strong) UILabel *descLabel;
@property (nonatomic, strong) UILabel *phoneLabel;

@property (nonatomic, strong) AJBCustomTextField *textFieldView;
@property (nonatomic, strong) NSString *textFieldText;

@property (nonatomic, strong) UILabel *codeLine;
@property (nonatomic, strong) UIButton *sendCodeButton;
@property (nonatomic, strong) NSTimer *smsSendDelayTimer;
@property (nonatomic, assign) int smsSendDelayTimerCounter;

@property (nonatomic, strong) UIButton *nextButton;

@end

@implementation AJBRegisterSecondView

- (instancetype) init
{
    if (self = [super init]) {
        __weak typeof(self) __weakSelf = self;
        
        [self addSubview:self.descLabel];
        [self.descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(MARGIN_20);
            make.left.mas_equalTo(0);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH,MARGIN_10));
        }];
        
        [self addSubview:self.phoneLabel];
        [self.phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(__weakSelf.descLabel.mas_bottom).offset(MARGIN_10);
            make.left.mas_equalTo(0);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH,MARGIN_20));
        }];
        
        [self addSubview:self.textFieldView];
        [self.textFieldView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(__weakSelf.phoneLabel.mas_bottom).offset(MARGIN_15);
            make.left.mas_equalTo(0);
            make.width.mas_equalTo(SCREEN_WIDTH);
            make.height.mas_equalTo(40);
        }];
        
        //定时器
        [self addSubview:self.sendCodeButton];
        [self.sendCodeButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(__weakSelf.mas_right);
            make.centerY.equalTo(__weakSelf.textFieldView.mas_centerY);
            make.height.mas_equalTo(MARGIN_30);
            make.width.mas_equalTo(120);
        }];
        
        [self addSubview:self.codeLine];
        [self.codeLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(__weakSelf.sendCodeButton.mas_left);
            make.centerY.equalTo(__weakSelf.textFieldView.mas_centerY);
            make.height.mas_equalTo(MARGIN_30);
            make.width.mas_equalTo(0.5);
        }];
        
        
        [self addSubview:self.nextButton];
        [self.nextButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(__weakSelf.textFieldView.mas_bottom).offset(MARGIN_20+MARGIN_40);
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
        self.textFieldView = [[AJBCustomTextField alloc] initWithtextFieldPlaceholder:@"请输入校验码" image:@"icon_register_write_code" notification:^(NSString * text) {
            __weakSelf.textFieldText = text;
            [__weakSelf onNotificationCodeTextField];
            
        } type:CustomTextFieldType_CODE];

    }
    return _textFieldView;
}


- (UILabel *)descLabel
{
    if (!_descLabel) {
        self.descLabel = [[UILabel alloc] init];
        _descLabel.font = FONT_OF_SIZE_14;
        _descLabel.textColor = COLOR_UI_dddddd;
        _descLabel.textAlignment = NSTextAlignmentCenter;
        _descLabel.text = @"校验码已发至您的手机号";
    }
    return _descLabel;
}

- (UILabel *)phoneLabel
{
    if (!_phoneLabel) {
        self.phoneLabel = [[UILabel alloc] init];
        _phoneLabel.font = [UIFont boldSystemFontOfSize:18];
        _phoneLabel.textColor = COLOR_UI_333333;
        _phoneLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _phoneLabel;
}


- (UILabel *)codeLine
{
    if (!_codeLine) {
        self.codeLine = [[UILabel alloc] init];
        _codeLine.backgroundColor = COLOR_UI_dddddd;
    }
    return _codeLine;
}

- (UIButton *) sendCodeButton
{
    if (!_sendCodeButton) {
        self.sendCodeButton = [[UIButton alloc] init];
        _sendCodeButton.titleLabel.font = FONT_OF_SIZE_13;
        [_sendCodeButton setTitle:@"发送验证码" forState:UIControlStateNormal];
        [_sendCodeButton setTitleColor:COLOR_UI_333333 forState:UIControlStateNormal];
        [_sendCodeButton addTarget:self action:@selector(onSendCodeAction:) forControlEvents:UIControlEventTouchUpInside];

    }
    return _sendCodeButton;
}

- (UIButton *)nextButton
{
    if (!_nextButton) {
        self.nextButton = [[UIButton alloc] init];
        _nextButton.layer.cornerRadius = 5;
        _nextButton.titleLabel.font = FONT_OF_SIZE_14;
        [_nextButton setTitle:@"下一步（2/3）" forState:UIControlStateNormal];
        [_nextButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_nextButton addTarget:self action:@selector(onNextAction:) forControlEvents:UIControlEventTouchUpInside];
        _nextButton.backgroundColor = COLOR_UI_dddddd;
        _nextButton.enabled = NO;
    }
    return _nextButton;
}

- (void) refreshPhoneLabel:(NSString *)string
{
    _phoneLabel.text = string;
}

#pragma mark - action
- (void) onNotificationCodeTextField
{
    if (_textFieldText.length > 0) {
        _nextButton.enabled = YES;
        _nextButton.backgroundColor = COLOR_UI_54C1F5;
    } else {
        _nextButton.enabled = NO;
        _nextButton.backgroundColor = COLOR_UI_dddddd;
    }
}

- (void) onNextAction:(UIButton *)sender
{
    self.code = _textFieldText;
    if ([_delegate respondsToSelector:@selector(secondNextAction:)]) {
        [self.delegate secondNextAction:sender];
    }
}

- (void) onSendCodeAction:(UIButton *)sender
{
    //发送成功后,定时器启动
    self.smsSendDelayTimerCounter = 59;
    self.smsSendDelayTimer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(onSmsSendDelayTimerInterval:) userInfo:nil repeats:YES];
    self.sendCodeButton.enabled = NO;
    [self.sendCodeButton setTitleColor:COLOR_UI_dddddd  forState:UIControlStateNormal];
    [self.sendCodeButton setTitle:[NSString stringWithFormat:@"%d秒后重新获取",_smsSendDelayTimerCounter] forState:UIControlStateDisabled];
    [self loadPhoneCode];
}

- (void)loadPhoneCode{
    __weak typeof(self) __weakSelf = self;
    NSDictionary *postDic = @{@"mobile":SAFE_STR(_phoneLabel.text),@"operationType":@"REGISTER"};
    [DataService postWithinterfaceType:SEND_SMS_CAPTCHA_CODE param:postDic responseBlock:^(RestNetworkRequestResp *resp) {
    } loadTokenRespnseBlock:^(BOOL success) {
        if (success) {
            [__weakSelf loadPhoneCode];
        }
    } hud:nil];
}

-(void) onSmsSendDelayTimerInterval:(NSTimer *)timer
{
    if (_smsSendDelayTimerCounter > 1)
    {
        _smsSendDelayTimerCounter = _smsSendDelayTimerCounter -1;
        [self.sendCodeButton setTitle:[NSString stringWithFormat:@"%d秒后重新获取",_smsSendDelayTimerCounter] forState:UIControlStateDisabled];
    }
    else
    {
        [self resetSmsSendButton];
    }
}

- (void) resetSmsSendButton
{
    _sendCodeButton.enabled = YES;
    
    if (_smsSendDelayTimer && [self.smsSendDelayTimer isValid])
    {
        [_smsSendDelayTimer invalidate];
    }
    
    if ([self.smsSendDelayTimer isValid]) {
        [_smsSendDelayTimer invalidate];
    }
    
    [_sendCodeButton setTitleColor:COLOR_UI_333333 forState:UIControlStateNormal];
    [_sendCodeButton setTitle:@"发送验证码" forState:UIControlStateNormal];
}


@end
