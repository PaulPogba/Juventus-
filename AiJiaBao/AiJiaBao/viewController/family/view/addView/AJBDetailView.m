//
//  AJBDetailView.m
//  AiJiaBao
//
//  Created by nuhgroup on 2017/3/7.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "AJBDetailView.h"
#import "AJBAddTitleView.h"

#define VIEW_HEIGHT 40

@interface AJBDetailView ()<AJBDetailEnterViewDelegate>

@property (nonatomic, strong) AJBAddTitleView *detailTitleView;
@property (nonatomic, strong) AJBDetailEnterView *addressView;
@property (nonatomic, strong) AJBDetailEnterView *residenceView;

@end

@implementation AJBDetailView

- (instancetype)init
{
    if(self = [super init]) {
        __weak typeof(self) __weakSelf = self;
        
        [self addSubview:self.detailTitleView];
        [self.detailTitleView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(__weakSelf.mas_top);
            make.left.mas_equalTo(0);
            make.height.mas_equalTo(VIEW_HEIGHT);
            make.width.mas_equalTo(SCREEN_WIDTH);
        }];
        
        [self addSubview:self.phoneView];
        [self.phoneView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(__weakSelf.detailTitleView.mas_bottom);
            make.left.mas_equalTo(0);
            make.height.mas_equalTo(VIEW_HEIGHT);
            make.width.mas_equalTo(SCREEN_WIDTH);
        }];
        
        [self addSubview:self.emailView];
        [self.emailView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(__weakSelf.phoneView.mas_bottom);
            make.left.mas_equalTo(0);
            make.height.mas_equalTo(VIEW_HEIGHT);
            make.width.mas_equalTo(SCREEN_WIDTH);
        }];
        
        [self addSubview:self.addressView];
        [self.addressView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(__weakSelf.emailView.mas_bottom);
            make.left.mas_equalTo(0);
            make.height.mas_equalTo(VIEW_HEIGHT);
            make.width.mas_equalTo(SCREEN_WIDTH);
        }];
        
        [self addSubview:self.residenceView];
        [self.residenceView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(__weakSelf.addressView.mas_bottom);
            make.left.mas_equalTo(0);
            make.height.mas_equalTo(VIEW_HEIGHT);
            make.width.mas_equalTo(SCREEN_WIDTH);
        }];
        
    }
    return self;
}



#pragma mark - getters and setters
- (AJBAddTitleView *)detailTitleView
{
    if (!_detailTitleView) {
        self.detailTitleView = [[AJBAddTitleView alloc] init];
        [_detailTitleView refreshWithTitle:@"额外信息"];
    }
    return _detailTitleView;
}

- (AJBDetailEnterView *)phoneView
{
    if (!_phoneView) {
        self.phoneView = [[AJBDetailEnterView alloc] init];
      _phoneView.delegate = self;
        [_phoneView refreshWithTitle:@"手机" placeholder:@"请输入手机号"];
    }
    return _phoneView;
}

- (AJBDetailEnterView *)emailView
{
    if (!_emailView) {
        self.emailView = [[AJBDetailEnterView alloc] init];
        [_emailView refreshWithTitle:@"邮箱" placeholder:@"请输入邮箱"];
    }
    return _emailView;
}

- (AJBDetailEnterView *)addressView
{
    if (!_addressView) {
        self.addressView = [[AJBDetailEnterView alloc] init];
        [_addressView refreshWithTitle:@"户口所在地" placeholder:@"请选择户口所在地"];
    }
    return _addressView;
}

- (AJBDetailEnterView *) residenceView
{
    if (!_residenceView) {
        self.residenceView = [[AJBDetailEnterView alloc] init];
        [_residenceView refreshWithTitle:@"户口性质" placeholder:@"农村。"];
    }
    return _residenceView;
}

#pragma mark - delegate
- (void)textFieldBeginEdit
{
    if ([self.delegate respondsToSelector:@selector(textFieldBeginEdit:)]) {
        [self.delegate textFieldBeginEdit:self];
    }
}


@end
