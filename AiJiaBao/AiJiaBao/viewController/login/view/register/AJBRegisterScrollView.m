//
//  AJBRegisterScrollView.m
//  AiJiaBao
//
//  Created by 医麦思 on 2017/2/22.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "AJBRegisterScrollView.h"
#import "AJBRegisterFirstView.h"
#import "AJBRegisterSecondView.h"
#import "AJBRegisterThreeView.h"

@interface AJBRegisterScrollView ()<AJBRegisterFirstViewDelegate,AJBRegisterSecondViewDelegate>

@property (nonatomic, strong) AJBRegisterFirstView *firstView;
@property (nonatomic, strong) AJBRegisterSecondView *secondView;
@property (nonatomic, strong) AJBRegisterThreeView *threeView;

@end

@implementation AJBRegisterScrollView

- (instancetype)init
{
    if (self = [super init]) {
        
        __weak typeof (self) __weakSelf = self;
        
        [self addSubview:self.firstView];
        [self.firstView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.left.mas_equalTo(0);
            make.width.mas_equalTo(SCREEN_WIDTH);
            make.height.mas_equalTo(SCREEN_HEIGHT - NAVITETION_HEIGHT);
        }];
        
        [self addSubview:self.secondView];
        [self.secondView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.left.mas_equalTo(__weakSelf.firstView.mas_right);
            make.width.mas_equalTo(SCREEN_WIDTH);
            make.height.mas_equalTo(SCREEN_HEIGHT - NAVITETION_HEIGHT);
        }];

        [self addSubview:self.threeView];
        [self.threeView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.left.mas_equalTo(__weakSelf.secondView.mas_right);
            make.width.mas_equalTo(SCREEN_WIDTH);
            make.height.mas_equalTo(SCREEN_HEIGHT - NAVITETION_HEIGHT);
        }];
    }
    return self;
}

#pragma mark - getters and setters 
- (AJBRegisterFirstView *)firstView
{
    if (!_firstView) {
        self.firstView = [[AJBRegisterFirstView alloc] init];
        _firstView.delegate = self;
    }
    return _firstView;
}

- (AJBRegisterSecondView *)secondView
{
    if (!_secondView) {
        self.secondView = [[AJBRegisterSecondView alloc] init];
        _secondView.delegate = self;
    }
    return _secondView;
}

- (AJBRegisterThreeView *)threeView
{
    if (!_threeView) {
        self.threeView = [[AJBRegisterThreeView alloc] init];
    }
    return _threeView;
}

#pragma mark - delegate
- (void)firstNextAction:(UIButton *)sender
{
    [_secondView  refreshPhoneLabel:_firstView.phoneString];
    __weak typeof(self) __weakSelf = self;
    [UIView animateWithDuration:0.3 animations:^{
        __weakSelf.contentOffset = CGPointMake(SCREEN_WIDTH, 0);
    }];
}

- (void)secondNextAction:(UIButton *)sender
{
    [_threeView refreshPhoneLabel:_firstView.phoneString code:_secondView.code];
    __weak typeof(self) __weakSelf = self;
    [UIView animateWithDuration:0.3 animations:^{
        __weakSelf.contentOffset = CGPointMake(SCREEN_WIDTH*2, 0);
    }];
}

@end
