//
//  AJBHomeTableHeadView.m
//  AiJiaBao
//
//  Created by 医麦思 on 2017/2/23.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "AJBHomeTableHeadView.h"
#import "AJBUserProtectViewController.h"

#define ITEM_WIDHT 60
#define ITEM_HEIHT 60

@interface AJBHomeTableHeadView ()

@property (nonatomic, strong) UIImageView *backgroundImageView;

@property (nonatomic, strong) UIButton *orderUploadButton;
@property (nonatomic, strong) UIButton *planButton;
@property (nonatomic, strong) UIButton *orderManagerButton;
@property (nonatomic, strong) UIButton *compensationButton;

@end

@implementation AJBHomeTableHeadView

- (instancetype)init
{
    if (self = [super init]) {
        __weak typeof(self) __weakSelf = self;
        
        [self.layer addSublayer:[AJBCommon gradientLayerWithHeight:SCREEN_HEIGHT/2]];
        
        [self addSubview:self.backgroundImageView];
        [self.backgroundImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.top.mas_equalTo(0);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH, 200));
        }];
        
        CGFloat button_width = SCREEN_WIDTH/4;
        CGFloat button_height = 60;
        [self addSubview:self.orderUploadButton];
        [self.orderUploadButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(__weakSelf.mas_top).offset(MARGIN_40+MARGIN_40);
            make.left.mas_equalTo(0);
            make.size.mas_equalTo(CGSizeMake(button_width, button_height));
        }];
        [self.orderUploadButton setIconInTopWithSpacing:MARGIN_15];

       
        [self addSubview:self.planButton];
        [self.planButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(__weakSelf.orderUploadButton.mas_top);
            make.left.equalTo(__weakSelf.orderUploadButton.mas_right);
            make.size.mas_equalTo(CGSizeMake(button_width, button_height));
        }];
        [self.planButton setIconInTopWithSpacing:MARGIN_15];
     
        [self addSubview:self.orderManagerButton];
        [self.orderManagerButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(__weakSelf.orderUploadButton.mas_top);
            make.left.equalTo(__weakSelf.planButton.mas_right);
            make.size.mas_equalTo(CGSizeMake(button_width, button_height));
        }];
        [self.orderManagerButton setIconInTopWithSpacing:MARGIN_15];

        
        [self addSubview:self.compensationButton];
        [self.compensationButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(__weakSelf.orderUploadButton.mas_top);
            make.left.equalTo(__weakSelf.orderManagerButton.mas_right);
            make.size.mas_equalTo(CGSizeMake(button_width, button_height));
        }];
        [self.compensationButton setIconInTopWithSpacing:MARGIN_15];
        
    }
    return self;
}

#pragma mark - getters and setters
- (UIImageView *) backgroundImageView
{
    if (!_backgroundImageView) {
        self.backgroundImageView = [[UIImageView alloc] init];
//        _backgroundImageView.backgroundColor = [COLOR_UI_RANDOM colorWithAlphaComponent:0.5];
    }
    return _backgroundImageView;
}

- (UIButton *)orderUploadButton
{
    if (!_orderUploadButton) {
        self.orderUploadButton = [[UIButton alloc] init];
        _orderUploadButton.titleLabel.font = FONT_OF_SIZE_13;
        [_orderUploadButton setImage:imageNamed(@"homeA") forState:UIControlStateNormal];
        [_orderUploadButton setTitle:@"保单上传" forState:UIControlStateNormal];
        [_orderUploadButton setTitleColor:COLOR_UI_333333 forState:UIControlStateNormal];
        [_orderUploadButton addTarget:self action:@selector(onOrderUploadAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _orderUploadButton;
}

- (UIButton *)orderManagerButton
{
    if (!_orderManagerButton) {
        self.orderManagerButton = [[UIButton alloc] init];
        _orderManagerButton.titleLabel.font = FONT_OF_SIZE_14;
        [_orderManagerButton setTitle:@"保单管理" forState:UIControlStateNormal];
        [_orderManagerButton setImage:imageNamed(@"homeA") forState:UIControlStateNormal];
        [_orderManagerButton setTitleColor:COLOR_UI_333333 forState:UIControlStateNormal];
    }
    return _orderManagerButton;

}

- (UIButton *)planButton
{
    if (!_planButton) {
        self.planButton = [[UIButton alloc] init];
        _planButton.titleLabel.font = FONT_OF_SIZE_14;
        [_planButton setTitle:@"员福计划" forState:UIControlStateNormal];
        [_planButton setImage:imageNamed(@"homeA") forState:UIControlStateNormal];
        [_planButton setTitleColor:COLOR_UI_333333 forState:UIControlStateNormal];
    }
    return _planButton;
}

- (UIButton *)compensationButton
{
    if (!_compensationButton) {
        self.compensationButton = [[UIButton alloc] init];
        _compensationButton.titleLabel.font = FONT_OF_SIZE_14;
        [_compensationButton setTitle:@"快速理赔" forState:UIControlStateNormal];
        [_compensationButton setImage:imageNamed(@"homeA") forState:UIControlStateNormal];
        [_compensationButton setTitleColor:COLOR_UI_333333 forState:UIControlStateNormal];
    }
    return _compensationButton;
}

#pragma mark - action
- (void)onOrderUploadAction:(UIButton *)sender
{
    AJBUserProtectViewController *vc = [[AJBUserProtectViewController alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

@end
