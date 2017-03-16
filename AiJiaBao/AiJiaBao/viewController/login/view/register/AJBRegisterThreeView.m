//
//  AJBRegisterThreeView.m
//  AiJiaBao
//
//  Created by 医麦思 on 2017/2/22.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "AJBRegisterThreeView.h"
#import "AJBCustomTextField.h"
#import "AppDelegate.h"


@interface AJBRegisterThreeView ()<UITextFieldDelegate>

@property (nonatomic, strong) AJBCustomTextField *textFieldView;
@property (nonatomic, strong) NSString *textFieldText;

@property (nonatomic, strong) UIButton *showSecretButton;
@property (nonatomic, strong) UIButton *doneButton;

@property (nonatomic, strong) NSString *phone;
@property (nonatomic, strong) NSString *code;

@end

@implementation AJBRegisterThreeView

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
        
        [self addSubview:self.showSecretButton];
        [self.showSecretButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(__weakSelf.textFieldView.mas_centerY);
            make.right.equalTo(__weakSelf.mas_right).offset(-MARGIN_10);
            make.size.mas_equalTo(CGSizeMake(MARGIN_40, MARGIN_40));
        }];
        
        [self addSubview:self.doneButton];
        [self.doneButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(__weakSelf.textFieldView.mas_bottom).offset(MARGIN_20+MARGIN_40);
            make.left.mas_equalTo(MARGIN_20);
            make.right.equalTo(__weakSelf.mas_right).offset(-MARGIN_20);
            make.height.mas_equalTo(45);
        }];
    }
    return self;
}


#pragma mark - getteres and setters
- (AJBCustomTextField *)textFieldView
{
    if (!_textFieldView) {
        __weak typeof(self) __weakSelf = self;
        self.textFieldView = [[AJBCustomTextField alloc] initWithtextFieldPlaceholder:@"请输入密码" image:@"icon_register_write_password" notification:^(NSString * text) {
            __weakSelf.textFieldText = text;
            [__weakSelf onNotificationRegisterSecretTextField];
            
        } type:CustomTextFieldType_SECRET];
    }
    return _textFieldView;
}

- (UIButton *)showSecretButton
{
    if (!_showSecretButton) {
        self.showSecretButton = [[UIButton alloc] init];
        [_showSecretButton setImage:imageNamed(@"icon_login_eye") forState:UIControlStateNormal];
        [_showSecretButton addTarget:self action:@selector(onShowRegisterSecretAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _showSecretButton;
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
        _doneButton.enabled = NO;
    }
    return _doneButton;
}


#pragma mark - refres
- (void) refreshPhoneLabel:(NSString *)phone code:(NSString *)code
{
    self.phone = phone;
    self.code = code;
}


#pragma mark - action
- (void) onDoneAction:(UIButton *)sender
{
    [self postREGISTER];
}

- (void) onShowRegisterSecretAction:(UIButton *) sender
{
    if (!sender.selected && _textFieldText.length > 0) {
        _textFieldView.textField.secureTextEntry = NO;
    } else {
        _textFieldView.textField.secureTextEntry = YES;
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
        _showSecretButton.selected = NO;
        _textFieldView.textField.secureTextEntry = YES;
        _doneButton.enabled = YES;
        _doneButton.backgroundColor = COLOR_UI_54C1F5;
    } else {
        _doneButton.enabled = NO;
        _doneButton.backgroundColor = COLOR_UI_dddddd;
    }
}



#pragma mark - POST Request

- (void) postREGISTER
{// POST 注册
    __weak typeof(self) __weakSelf = self;
    NSDictionary *postDic = @{@"mobile":SAFE_STR(_phone),@"logonPwd":SAFE_STR(_textFieldText),@"smsCaptchaCode":SAFE_STR(_code)};
    
    [DataService postWithinterfaceType:REGISTER param:postDic responseBlock:^(id responseObject) {
        
        [AJBUserDefaults saveUserPhone:_phone];
        [AJBUserDefaults saveUserPassword:_textFieldText];
        
        //申请令牌
        [__weakSelf postTOKENAPPLY];
        
    } loadTokenRespnseBlock:^(BOOL success) {
        [__weakSelf postREGISTER];
    } hud:[self showHUD:@""]];
}


- (void) postTOKENAPPLY
{//POST 申请令牌
    __weak typeof(self) __weakSelf = self;
    //申请用户令牌
    NSDictionary *param = [NSDictionary dictionaryWithObjectsAndKeys:[AJBUserDefaults getUserPhone],@"mobile",[AJBUserDefaults getUserPassword],@"logonPwd",nil];
    
    [DataService postWithinterfaceType:TOKEN_APPLY param:param responseBlock:^(id responseObject) {
        RestRegisterResp *resp = [RestRegisterResp mj_objectWithKeyValues:responseObject];
        JSONRegisterObj *obj = [JSONRegisterObj mj_objectWithKeyValues:[resp.result objectAtIndex:0]];
        [AJBUserDefaults saveToken:SAFE_STR(obj.token)];
        AppDelegate *dlg =(AppDelegate *) [UIApplication sharedApplication].delegate;
        [dlg enterHome];
        
        //获取用户信息
        [__weakSelf postSERVINFO];
        
    } loadTokenRespnseBlock:^(BOOL success) {
        
    } hud:nil];
}


- (void) postSERVINFO
{// POST 获取用户信息
    //获取用户信息
    __weak typeof(self) __weakSelf = self;
    [DataService postWithinterfaceType:SERV_INFO param:nil responseBlock:^(id responseObject) {
        RestUserInfoResp *resp = [RestUserInfoResp mj_objectWithKeyValues:responseObject];
        JSONUserInfoObj *obj = [JSONUserInfoObj mj_objectWithKeyValues:[resp.result objectAtIndex:0]];
        [AJBUserDefaults saveUserInfo:obj];
    } loadTokenRespnseBlock:^(BOOL success) {
        [__weakSelf postSERVINFO];
    } hud:nil];
    
}


@end
