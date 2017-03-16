//
//  AJBInsuranceHeadView.m
//  AiJiaBao
//
//  Created by nuhgroup on 2017/3/12.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "AJBInsuranceHeadView.h"
#import "AJBBannerScrollView.h"


@interface AJBInsuranceHeadView ()

@property (nonatomic, strong) AJBBannerScrollView *bannerScrollView;

@property (nonatomic, strong) UIButton *healthyButton;
@property (nonatomic, strong) UIButton *safeButton;
@property (nonatomic, strong) UIButton *insuranceButton;
@property (nonatomic, strong) UIButton *protectButton;

@property (nonatomic, strong) UIView *line;
@property (nonatomic, strong) UIView *marginView;

@property (nonatomic, strong) UIView *titleView;
@property (nonatomic, strong) UIImageView *iconIamgeView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIView *titleLine;

@end

@implementation AJBInsuranceHeadView

- (instancetype)init
{
    if (self = [super init]) {
        
        __weak typeof(self)__weakSelf = self;
        
        self.backgroundColor = [UIColor whiteColor];
        
        [self addSubview:self.bannerScrollView];
        [self.bannerScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(0);
            make.height.mas_equalTo(210);
            make.width.mas_equalTo(SCREEN_WIDTH);
        }];
        
        CGFloat buttonHeight = 80;
        CGFloat buttonWidth = SCREEN_WIDTH/4;
        [self addSubview:self.healthyButton];
        [self.healthyButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.top.equalTo(__weakSelf.bannerScrollView.mas_bottom);
            make.width.mas_equalTo(buttonWidth);
            make.height.mas_equalTo(buttonHeight);
        }];
        [_healthyButton setIconInTopWithSpacing:MARGIN_10];

        [self addSubview:self.safeButton];
        [self.safeButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(__weakSelf.healthyButton.mas_right);
            make.top.equalTo(__weakSelf.bannerScrollView.mas_bottom);
            make.width.mas_equalTo(buttonWidth);
            make.height.mas_equalTo(buttonHeight);
        }];
        [_safeButton setIconInTopWithSpacing:MARGIN_10];

        [self addSubview:self.insuranceButton];
        [self.insuranceButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(__weakSelf.safeButton.mas_right);
            make.top.equalTo(__weakSelf.bannerScrollView.mas_bottom);
            make.width.mas_equalTo(buttonWidth);
            make.height.mas_equalTo(buttonHeight);
        }];
        [_insuranceButton setIconInTopWithSpacing:MARGIN_10];

        [self addSubview:self.protectButton];
        [self.protectButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(__weakSelf.insuranceButton.mas_right);
            make.top.equalTo(__weakSelf.bannerScrollView.mas_bottom);
            make.width.mas_equalTo(buttonWidth);
            make.height.mas_equalTo(buttonHeight);
        }];
        [_protectButton setIconInTopWithSpacing:MARGIN_10];
        
        [self addSubview:self.line];
        [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(__weakSelf.bannerScrollView.mas_bottom);
            make.left.mas_equalTo(0);
            make.width.mas_equalTo(SCREEN_WIDTH);
            make.height.mas_equalTo(1);
        }];

        [self addSubview:self.marginView];
        [self.marginView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(__weakSelf.healthyButton.mas_bottom);
            make.left.mas_equalTo(0);
            make.width.mas_equalTo(SCREEN_WIDTH);
            make.height.mas_equalTo(MARGIN_10);
        }];
        
        [self addSubview:self.titleView];
        [self.titleView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.top.equalTo(__weakSelf.marginView.mas_bottom);
            make.width.mas_equalTo(SCREEN_WIDTH);
            make.height.mas_equalTo(50);
        }];
        
        [self.titleView addSubview:self.iconIamgeView];
        [self.iconIamgeView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(MARGIN_15);
            make.centerY.equalTo(__weakSelf.titleView.mas_centerY);
            make.size.mas_equalTo(__weakSelf.iconIamgeView.image.size);
        }];

        [self.titleView addSubview:self.titleLabel];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(__weakSelf.iconIamgeView.mas_right).offset(MARGIN_15);
            make.centerY.equalTo(__weakSelf.titleView.mas_centerY);
            make.width.mas_equalTo(200);
            make.height.mas_equalTo(50);
        }];
        
        [self.titleView addSubview:self.titleLine];
        [self.titleLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.bottom.equalTo(__weakSelf.titleView.mas_bottom);
            make.width.mas_equalTo(SCREEN_WIDTH);
            make.height.mas_equalTo(0.5);
        }];
    }
    return self;
}

#pragma mark - getters and setters 
- (AJBBannerScrollView *)bannerScrollView
{
    if (!_bannerScrollView) {
        self.bannerScrollView = [[AJBBannerScrollView alloc] init];
        
    }
    return _bannerScrollView;
}


- (UIButton *)healthyButton
{
    if (!_healthyButton) {
        self.healthyButton = [[UIButton alloc] init];
        [_healthyButton setImage:imageNamed(@"homeA") forState:UIControlStateNormal];
        [_healthyButton setTitle:@"健康无忧" forState: UIControlStateNormal];
        _healthyButton.titleLabel.font = FONT_OF_SIZE_13;
        [_healthyButton setTitleColor:COLOR_UI_666666 forState:UIControlStateNormal];
        
    }
    return _healthyButton;
}

- (UIButton *) safeButton
{
    if (!_safeButton) {
        self.safeButton = [[UIButton alloc] init];
        [_safeButton setImage:imageNamed(@"homeA") forState:UIControlStateNormal];
        [_safeButton setTitle:@"安全出行" forState: UIControlStateNormal];
        _safeButton.titleLabel.font = FONT_OF_SIZE_13;
        [_safeButton setTitleColor:COLOR_UI_666666 forState:UIControlStateNormal];

    }
    return _safeButton;
}

- (UIButton *) insuranceButton
{
    if (!_insuranceButton) {
        self.insuranceButton = [[UIButton alloc] init];
        [_insuranceButton setImage:imageNamed(@"homeA") forState:UIControlStateNormal];
        [_insuranceButton setTitle:@"定期人寿" forState: UIControlStateNormal];
        _insuranceButton.titleLabel.font = FONT_OF_SIZE_13;
        [_insuranceButton setTitleColor:COLOR_UI_666666 forState:UIControlStateNormal];

    }
    return _insuranceButton;
}

- (UIButton *) protectButton
{
    if (!_protectButton) {
        self.protectButton = [[UIButton alloc] init];
        [_protectButton setImage:imageNamed(@"homeA") forState:UIControlStateNormal];
        [_protectButton setTitle:@"守护家财" forState: UIControlStateNormal];
        _protectButton.titleLabel.font = FONT_OF_SIZE_13;
        [_protectButton setTitleColor:COLOR_UI_666666 forState:UIControlStateNormal];
    }
    return _protectButton;
}

- (UIView *)marginView
{
    if (!_marginView) {
        self.marginView = [[UIView alloc] init];
        _marginView.backgroundColor = COLOR_UI_f1f1f1;
    }
    return _marginView;
}

- (UIView *)line
{
    if (!_line) {
        self.line = [[UIView alloc] init];
        _line.backgroundColor = COLOR_UI_dddddd;
    }
    return _line;
}


- (UIView *)titleView {
    
    if (!_titleView) {
        self.titleView = [[UIView alloc] init];
        _titleView.backgroundColor = [UIColor whiteColor];
    }
    return _titleView;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        self.titleLabel = [[UILabel alloc] init];
        _titleLabel.font = FONT_OF_SIZE_15;
        _titleLabel.textColor = COLOR_UI_333333;
    }
    return _titleLabel;
}

- (UIImageView *)iconIamgeView
{
    if (!_iconIamgeView) {
        self.iconIamgeView = [[UIImageView alloc] init];
        _iconIamgeView.image = imageNamed(@"homeA");
    }
    return _iconIamgeView;
}


- (UIView *) titleLine
{
    if (!_titleLine) {
        self.titleLine = [[UIView alloc] init];
        _titleLine.backgroundColor = COLOR_UI_dddddd;
    }
    return _titleLine;
}


#pragma mark - refresh
-(void)setImagesWithArray:(NSArray *)array
{
    [_bannerScrollView setImagesWithArray:array];
}

- (void) refreshTitle:(NSString *) title
{
    self.titleLabel.text = title;
}


@end
