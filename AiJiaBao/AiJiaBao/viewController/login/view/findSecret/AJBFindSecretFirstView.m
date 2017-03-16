//
//  AJBFindSecretFirstView.m
//  AiJiaBao
//
//  Created by 医麦思 on 2017/2/23.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "AJBFindSecretFirstView.h"
#import "AJBCustomTextField.h"

@interface AJBFindSecretFirstView ()

@property (nonatomic, strong) AJBCustomTextField *textFieldView;
@property (nonatomic, strong) NSString *textFieldText;

@property (nonatomic, strong) UIButton *nextButton;


@end

@implementation AJBFindSecretFirstView

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
        self.textFieldView = [[AJBCustomTextField alloc] initWithtextFieldPlaceholder:@"请输入注册手机号" image:@"homeA" notification:^(NSString * text) {
            __weakSelf.textFieldText = text;
            [__weakSelf onNotificationPhoneTextField];
            
        } type:CustomTextFieldType_PHONE];
    }
    return _textFieldView;
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

- (void) onNextAction:(UIButton *) sender
{
    self.phoneString = _textFieldText;
    if ([_delegate respondsToSelector:@selector(findSecretFirstNextAction:)]) {
        [self.delegate findSecretFirstNextAction:sender];
    }
}


@end
