//
//  AJBBaseView.m
//  AiJiaBao
//
//  Created by nuhgroup on 2017/3/7.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "AJBBaseView.h"

#import "AJBBirthdayPickerView.h"
#import "AJBAddTitleView.h"
#import "AJBBirthdayView.h"
#import "AJBGenderView.h"
#import "AJBRelationView.h"

#define VIEW_HEIGHT 40

@interface AJBBaseView ()<AJBBirthdayViewDelegate>

@property (nonatomic, strong) AJBAddTitleView *baseTitleView;
@property (nonatomic, strong) AJBGenderView *genderView;
@property (nonatomic, strong) AJBRelationView *relationView;

@end

@implementation AJBBaseView

- (instancetype)init
{
    if (self = [super init]) {
        
        __weak typeof(self) __weakSelf = self;
        
        [self addSubview:self.baseTitleView];
        [self.baseTitleView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.top.mas_equalTo(0);
            make.height.mas_equalTo(VIEW_HEIGHT);
            make.width.mas_equalTo(SCREEN_WIDTH);
        }];
        
        [self addSubview:self.nickNameView];
        [self.nickNameView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(__weakSelf.baseTitleView.mas_bottom);
            make.left.mas_equalTo(0);
            make.height.mas_equalTo(VIEW_HEIGHT);
            make.width.mas_equalTo(SCREEN_WIDTH);
        }];
        
        [self addSubview:self.userIDView];
        [self.userIDView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(__weakSelf.nickNameView.mas_bottom);
            make.left.mas_equalTo(0);
            make.height.mas_equalTo(VIEW_HEIGHT);
            make.width.mas_equalTo(SCREEN_WIDTH);
        }];
        
        [self addSubview:self.genderView];
        [self.genderView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(__weakSelf.userIDView.mas_bottom);
            make.left.mas_equalTo(0);
            make.height.mas_equalTo(VIEW_HEIGHT);
            make.width.mas_equalTo(SCREEN_WIDTH);
        }];
        
        [self addSubview:self.birthdayView];
        [self.birthdayView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(__weakSelf.genderView.mas_bottom);
            make.left.mas_equalTo(0);
            make.height.mas_equalTo(VIEW_HEIGHT);
            make.width.mas_equalTo(SCREEN_WIDTH);
        }];
        
        [self addSubview:self.relationView];
        [self.relationView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(__weakSelf.birthdayView.mas_bottom);
            make.left.mas_equalTo(0);
            make.height.mas_equalTo(VIEW_HEIGHT);
            make.width.mas_equalTo(SCREEN_WIDTH);
        }];

        
    }
    return self;
}

#pragma mark - getters and setters 

- (AJBAddTitleView *)baseTitleView
{
    if (!_baseTitleView) {
        self.baseTitleView = [[AJBAddTitleView alloc] init];
        [_baseTitleView refreshWithTitle:@"基本资料"];
    }
    return _baseTitleView;
}

- (AJBEnterView *)nickNameView
{
    if (!_nickNameView) {
        self.nickNameView = [[AJBEnterView alloc] init];
        [_nickNameView refreshWithTitle:@"姓名" placeholder:@"请输入姓名"];
    }
    return _nickNameView;
}

- (AJBEnterView *)userIDView
{
    if (!_userIDView) {
        self.userIDView = [[AJBEnterView alloc] init];
        [_userIDView refreshWithTitle:@"身份证" placeholder:@"请输入身份证号码"];
    }
    return _userIDView;
}

-(AJBGenderView *)genderView
{
    if (!_genderView) {
        self.genderView = [[AJBGenderView alloc] init];
        _genderView.delegate = self;
        [_genderView refreshWithTitle:@"性别"];
    }
    return _genderView;
}

- (AJBBirthdayView *)birthdayView
{
    if (!_birthdayView) {
        self.birthdayView = [[AJBBirthdayView alloc] init];
        _birthdayView.delegate = self;
        [_birthdayView refreshWithTitle:@"生日"];
    }
    return _birthdayView;
}

- (AJBRelationView *)relationView
{
    if (!_relationView) {
        self.relationView = [[AJBRelationView alloc] init];
        _relationView.delegate = self;
        [_relationView refreshWithTitle:@"关系"];
    }
    return _relationView;
}

#pragma mark - delegate
- (void)showPickerView
{
    if ([self.delegate respondsToSelector:@selector(showPickerView)]) {
        [self.delegate showPickerView];
    }
}


@end
