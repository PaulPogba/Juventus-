//
//  AJBAddPeopleViewController.m
//  AiJiaBao
//
//  Created by nuhgroup on 2017/3/6.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//


#import "AJBAddPeopleViewController.h"
#import "AJBBirthdayPickerView.h"
#import "AJBBaseView.h"
#import "AJBDetailView.h"

#define VIEW_HEIGHT 40

@interface AJBAddPeopleViewController ()<AJBBaseViewDelegate,AJBDetailViewDelegate>

@property (nonatomic, strong) AJBBaseView *baseView;
@property (nonatomic, strong) AJBDetailView *detailView;
@property (nonatomic, strong) AJBBirthdayPickerView *pickerView;

@end

@implementation AJBAddPeopleViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self setTitleText:@"添加家庭成员"];
    self.view.backgroundColor = COLOR_UI_f1f1f1;
    [self.view addSubview:self.baseView];
    [self.view addSubview:self.detailView];
    [self.view addSubview:self.pickerView];
    [self.view bringSubviewToFront:self.navigationView];
    [self loadLayerout];
}

- (void)loadLayerout{
    __weak typeof(self) __weakSelf = self;

    [self.baseView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo (MARGIN_15 + NAVITETION_HEIGHT);
        make.left.mas_equalTo(0);
        make.width.mas_equalTo(SCREEN_WIDTH);
        make.height.mas_equalTo(VIEW_HEIGHT*6);
    }];
    [self.detailView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(__weakSelf.baseView.mas_bottom).offset(MARGIN_15);
        make.left.mas_equalTo(0);
        make.width.mas_equalTo(SCREEN_WIDTH);
        make.height.mas_equalTo(VIEW_HEIGHT*5);
    }];
    [self.pickerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(0);
        make.width.mas_equalTo(SCREEN_WIDTH);
        make.height.mas_equalTo(SCREEN_HEIGHT);
    }];
}


#pragma mark - getters and setters
- (UIView *)baseView
{
    if (!_baseView) {
        self.baseView = [[AJBBaseView alloc] init];
        _baseView.delegate = self;
        _baseView.backgroundColor = [UIColor whiteColor];
    }
    return _baseView;
}

- (UIView *)detailView
{
    if (!_detailView) {
        self.detailView = [[AJBDetailView alloc] init];
        _detailView.delegate = self;
        _detailView.backgroundColor = [UIColor whiteColor];
    }
    return _detailView;
}

- (AJBBirthdayPickerView *)pickerView
{
    if (!_pickerView) {
        __weak typeof(self) __weakSelf = self;
        self.pickerView = [[AJBBirthdayPickerView alloc] init];
        self.pickerView.blcok = ^(NSString* day){
            [__weakSelf.baseView.birthdayView.button setTitle:day forState:UIControlStateNormal];
        };
    }
    return _pickerView;
}

#pragma mark - delegate
- (void)showChooseGenderView
{
    //
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *cannel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *photo = [UIAlertAction actionWithTitle:@"女" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    }];
    
    UIAlertAction *camera = [UIAlertAction actionWithTitle:@"男" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    }];
    [alert addAction:photo];
    [alert addAction:camera];
    [alert addAction:cannel];
    [self presentViewController:alert animated:YES completion:nil];
}


- (void)showPickerView
{
    [_pickerView showPickerView];
}


- (void)textFieldBeginEdit:(id)view
{
    if ([view isKindOfClass:[AJBDetailView class]]) {
        __weak typeof(self) __weakSelf = self;
        [UIView animateWithDuration:0.3 animations:^{
            [__weakSelf.baseView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(-100);
            }];
            [__weakSelf.detailView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(__weakSelf.baseView.mas_bottom).offset(MARGIN_15);
            }];
        }];
    }
}

#pragma mark - touch
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    [self.view endEditing:YES];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [_baseView.nickNameView.textfield resignFirstResponder];
    [_baseView.userIDView.textfield resignFirstResponder];
    [_detailView.phoneView.textfield resignFirstResponder];
    [_detailView.emailView.textfield resignFirstResponder];
    
    __weak typeof(self) __weakSelf = self;
    
    [UIView animateWithDuration:0.3 animations:^{
        [__weakSelf.baseView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(MARGIN_15 + NAVITETION_HEIGHT);
        }];
        [__weakSelf.detailView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(__weakSelf.baseView.mas_bottom).offset(MARGIN_15);
        }];
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
