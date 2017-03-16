//
//  AJBLoginViewController.m
//  AiJiaBao
//
//  Created by 医麦思 on 2017/2/22.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "AJBLoginViewController.h"
#import "AJBRegisterViewController.h"
#import "AJBFindSecretViewController.h"
#import "AppDelegate.h"

#define TEXTTAG 10
@interface AJBLoginViewController ()<UITextFieldDelegate>

@property (nonatomic, strong) UIImageView *logoImageView;

@property (nonatomic, strong) UIImageView *phoneImageView;
@property (nonatomic, strong) UITextField *phoneTextField;
@property (nonatomic, strong) UILabel *phoneLine;

@property (nonatomic, strong) UIImageView *secretImageView;
@property (nonatomic, strong) UITextField *secretTextField;
@property (nonatomic, strong) UIButton *showSecretButton;
@property (nonatomic, strong) UILabel *secretLine;

@property (nonatomic, strong) UIButton *loginButton;
@property (nonatomic, strong) UIButton *registerButton;
@property (nonatomic, strong) UIButton *findSecretButton;

@end

@implementation AJBLoginViewController


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationView.hidden = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    
    __weak typeof(self) __weakSelf = self;

    [self.view addSubview:self.logoImageView];
    [self.logoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(70);
        make.size.mas_equalTo(__weakSelf.logoImageView.image.size);
        make.centerX.mas_equalTo(__weakSelf.view.mas_centerX);
    }];
    
    //手机号
    [self.view addSubview:self.phoneImageView];
    [self.phoneImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(MARGIN_40);
        make.top.equalTo(__weakSelf.logoImageView.mas_bottom).offset(60);
        make.size.mas_equalTo(__weakSelf.phoneImageView.image.size);
    }];
    
    [self.view addSubview:self.phoneTextField];
    [self.phoneTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(__weakSelf.phoneImageView.mas_centerY);
        make.left.equalTo(__weakSelf.phoneImageView.mas_right).offset(MARGIN_20);
        make.right.mas_equalTo(__weakSelf.view.mas_right).offset(-MARGIN_40);
        make.height.mas_equalTo(MARGIN_30);
    }];
    
    [self.view addSubview:self.phoneLine];
    [self.phoneLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(__weakSelf.phoneTextField.mas_bottom).offset(MARGIN_5);
        make.left.equalTo(__weakSelf.phoneImageView.mas_left);
        make.right.equalTo(__weakSelf.phoneTextField.mas_right);
        make.height.mas_equalTo(0.5);
    }];
    
    
    //密码
    [self.view addSubview:self.secretImageView];
    [self.secretImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(MARGIN_40);
        make.top.equalTo(__weakSelf.phoneLine.mas_bottom).offset(MARGIN_20);
        make.size.mas_equalTo(__weakSelf.secretImageView.image.size);
    }];
    
    [self.view addSubview:self.secretTextField];
    [self.secretTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(__weakSelf.secretImageView.mas_centerY);
        make.left.equalTo(__weakSelf.phoneImageView.mas_right).offset(MARGIN_20);
        make.right.equalTo(__weakSelf.view.mas_right).offset(-MARGIN_40-MARGIN_40);
        make.height.mas_equalTo(MARGIN_30);
    }];
    
    [self.view addSubview:self.showSecretButton];
    [self.showSecretButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(__weakSelf.secretTextField.mas_centerY);
        make.left.equalTo(__weakSelf.secretTextField.mas_right);
        make.size.mas_equalTo(CGSizeMake(MARGIN_40, MARGIN_40));
    }];
    
    
    [self.view addSubview:self.secretLine];
    [self.secretLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(__weakSelf.secretTextField.mas_bottom).offset(MARGIN_5);
        make.left.equalTo(__weakSelf.phoneImageView.mas_left);
        make.right.equalTo(__weakSelf.phoneTextField.mas_right);
        make.height.mas_equalTo(0.5);
    }];
    
    
    //按钮
    [self.view addSubview:self.loginButton];
    [_loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(__weakSelf.secretLine.mas_bottom).offset(MARGIN_20);
        make.left.equalTo(__weakSelf.secretLine.mas_left);
        make.right.equalTo(__weakSelf.secretLine.mas_right);
        make.height.mas_equalTo(44);
    }];
    
    
    [self.view addSubview:self.registerButton];
    [self.registerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(__weakSelf.loginButton.mas_bottom).offset(MARGIN_15);
        make.left.equalTo(__weakSelf.loginButton.mas_left);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(MARGIN_30);
    }];
    
    [self.view addSubview:self.findSecretButton];
    [self.findSecretButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(__weakSelf.loginButton.mas_bottom).offset(MARGIN_15);
        make.right.equalTo(__weakSelf.loginButton.mas_right);
        make.width.mas_equalTo(60);
        make.height.mas_equalTo(MARGIN_30);
    }];
}

#pragma mark - getters and setters
- (UIImageView *)logoImageView
{
    if (!_logoImageView) {
        self.logoImageView = [[UIImageView alloc] init];
        _logoImageView.clipsToBounds = YES;
        _logoImageView.image = imageNamed(@"icon_login_logo");
    }
    return _logoImageView;
}

//手机号
- (UIImageView *)phoneImageView {
    if (!_phoneImageView) {
        self.phoneImageView = [[UIImageView alloc] init];
        _phoneImageView.image = imageNamed(@"icon_login_phone");
    }
    return _phoneImageView;
}

- (UITextField *)phoneTextField
{
    if (!_phoneTextField) {
        self.phoneTextField = [[UITextField alloc] init];
        _phoneTextField.font = FONT_OF_SIZE_14;
        _phoneTextField.textColor = COLOR_UI_333333;
        _phoneTextField.tintColor = COLOR_UI_54C1F5;
        _phoneTextField.placeholder = @"请输入手机号";
        _phoneTextField.delegate = self;
        _phoneTextField.tag = TEXTTAG;
        _phoneTextField.keyboardType = UIKeyboardTypeNumberPad;
        _phoneTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    }
    return _phoneTextField;
}

- (UILabel *)phoneLine
{
    if (!_phoneLine) {
        self.phoneLine = [[UILabel alloc] init];
        _phoneLine.backgroundColor = COLOR_UI_dddddd;
    }
    return _phoneLine;
}

// 密码
- (UIImageView *)secretImageView {
    if (!_secretImageView) {
        self.secretImageView = [[UIImageView alloc] init];
        _secretImageView.image = imageNamed(@"icon_login_password");
    }
    return _secretImageView;
}

- (UITextField *)secretTextField
{
    if (!_secretTextField) {
        self.secretTextField = [[UITextField alloc] init];
        _secretTextField.font = FONT_OF_SIZE_14;
        _secretTextField.textColor = COLOR_UI_333333;
        _secretTextField.tintColor = COLOR_UI_54C1F5;
        _secretTextField.placeholder = @"请输入密码";
        _secretTextField.secureTextEntry = YES;
        _secretTextField.tag = TEXTTAG+1;
        _secretTextField.delegate = self;
        _secretTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onNotificationSecretTextField) name:UITextFieldTextDidChangeNotification object:nil];
    }
    return _secretTextField;
}

- (UIButton *)showSecretButton
{
    if (!_showSecretButton) {
        self.showSecretButton = [[UIButton alloc] init];
        [_showSecretButton setImage:imageNamed(@"icon_login_eye") forState:UIControlStateNormal];
        [_showSecretButton addTarget:self action:@selector(onShowSecretAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _showSecretButton;
}

- (UILabel *)secretLine
{
    if (!_secretLine) {
        self.secretLine = [[UILabel alloc] init];
        _secretLine.backgroundColor = COLOR_UI_dddddd;
    }
    return _secretLine;
}

//登录
- (UIButton *)loginButton
{
    if (!_loginButton) {
        
        self.loginButton = [[UIButton alloc] init];
        _loginButton.layer.cornerRadius = 5;
        _loginButton.titleLabel.font = FONT_OF_SIZE_14;
        [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
        [_loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_loginButton addTarget:self action:@selector(onLoginAction:) forControlEvents:UIControlEventTouchUpInside];
        _loginButton.backgroundColor = COLOR_UI_54C1F5;
        
        UIBezierPath *shadowPath = [UIBezierPath bezierPathWithRect:CGRectMake(MARGIN_5, 0,SCREEN_WIDTH - 90,45)];
        _loginButton.layer.masksToBounds = NO;
        _loginButton.layer.shadowColor = COLOR_UI_54C1F5.CGColor;
        _loginButton.layer.shadowOffset = CGSizeMake(0.0f, 3.0f);//偏移距离
        _loginButton.layer.shadowOpacity = 0.5f;//不透明度
        _loginButton.layer.shadowRadius = 4;//半径
        _loginButton.layer.shadowPath = shadowPath.CGPath;
        
    }
    return _loginButton;
}

- (UIButton *)registerButton
{
    if (!_registerButton) {
        self.registerButton = [[UIButton alloc] init];
        _registerButton.titleLabel.font = FONT_OF_SIZE_13;
        [_registerButton setTitle:@"秒注册" forState:UIControlStateNormal];
        [_registerButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [_registerButton addTarget:self action:@selector(onRegisterAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _registerButton;
}

- (UIButton *)findSecretButton
{
    if (!_findSecretButton) {
        self.findSecretButton = [[UIButton alloc] init];
        _findSecretButton.titleLabel.font = FONT_OF_SIZE_13;
        [_findSecretButton setTitle:@"找回密码" forState:UIControlStateNormal];
        [_findSecretButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [_findSecretButton addTarget:self action:@selector(onFindSecretAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _findSecretButton;
}


#pragma mark - textFieldDelegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField.tag == TEXTTAG) {
        NSUInteger proposedNewLength = textField.text.length - range.length + string.length;
        if (proposedNewLength>11)
        {
            return NO;//限制长度
        }
        return YES;
    }
    return YES;
}



#pragma mark - action
- (void) onShowSecretAction:(UIButton *) sender
{
    if (!sender.selected && _secretTextField.text.length > 0) {
        _secretTextField.secureTextEntry = NO;
    } else {
        _secretTextField.secureTextEntry = YES;
    }
    
    if (_secretTextField.text.length > 0) {
        sender.selected = !sender.selected;
    } else {
        sender.selected = NO;
    }
}

- (void) onLoginAction:(UIButton *)sender
{
    
    if (IS_STR_EMPTY(_phoneTextField.text)) {
        [MBProgressHUD toastText:@"请输入手机号"];
    }  else if (![AJBCommon isMobileNumber:_phoneTextField.text]){
        [MBProgressHUD toastText:@"请输入正确的手机号"];
    } else if (IS_STR_EMPTY(_secretTextField.text))
    {
        [MBProgressHUD toastText:@"请输入密码"];
    } else {
        [self postLOGIN];
    }
}

#pragma mark - POST 登录
- (void) postLOGIN
{
    __weak typeof(self) __weakSelf = self;
    NSDictionary *param =  @{@"mobile":_phoneTextField.text,@"logonPwd":_secretTextField.text};
    [DataService postWithinterfaceType:LOGIN param:param responseBlock:^(id responseObject) {
        
        RestLoginResp *login = [RestLoginResp mj_objectWithKeyValues:responseObject];
        JSONLoginObj *loginObj = [JSONLoginObj mj_objectWithKeyValues:[login.result objectAtIndex:0]];
        [AJBUserDefaults saveToken:loginObj.token];
        
        //进入首页
        AppDelegate *dlg =(AppDelegate *) [UIApplication sharedApplication].delegate;
        [dlg enterHome];
        
        [__weakSelf postSERVINFO];
        
    } loadTokenRespnseBlock:^(BOOL success) {
        if (success) {
            [__weakSelf postLOGIN];
        }
    } hud:[self.view showHUD:@""]];

}

#pragma mark - POST 获取用户信息
- (void) postSERVINFO {
    __weak typeof(self) __weakSelf = self;
    
    [DataService postWithinterfaceType:SERV_INFO param:nil responseBlock:^(id responseObject) {
        
        RestUserInfoResp *resp = [RestUserInfoResp mj_objectWithKeyValues:responseObject];
        JSONUserInfoObj *obj = [JSONUserInfoObj mj_objectWithKeyValues:[resp.result objectAtIndex:0]];
        [AJBUserDefaults saveUserInfo:obj];
        
    } loadTokenRespnseBlock:^(BOOL success) {
        if (success) {
            [__weakSelf postSERVINFO];
        }
    } hud:nil];
    

}

- (void) onRegisterAction:(UIButton *)sender
{
    AJBRegisterViewController *vc = [[AJBRegisterViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}


- (void) onFindSecretAction:(UIButton *)sender
{
    AJBFindSecretViewController *vc = [[AJBFindSecretViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}


- (void) onNotificationSecretTextField
{
    if (_secretTextField.text.length == 0) {
        _showSecretButton.selected = NO;
        _secretTextField.secureTextEntry = YES;
    }
}




- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [_phoneTextField resignFirstResponder];
    [_secretTextField resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
