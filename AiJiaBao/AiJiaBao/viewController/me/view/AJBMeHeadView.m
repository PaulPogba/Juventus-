//
//  AJBMeHeadView.m
//  AiJiaBao
//
//  Created by 医麦思 on 2017/2/24.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "AJBMeHeadView.h"
#import "AJBMeHeadCustomButton.h"
#import "AJBMyCashViewController.h"
#import "AJBCouponViewController.h"
#import "AJBIntegralViewController.h"

@interface AJBMeHeadView ()

@property (nonatomic, strong) UIImageView *backgroundImageView;

@property (nonatomic, strong) AJBSDWebImageView *headImageView;
@property (nonatomic, strong) UILabel *nickLabel;
@property (nonatomic, strong) AJBSDWebImageView *classImageView;
@property (nonatomic, strong) UILabel *signinLabel;


@property (nonatomic, strong) UIImageView *emailImageView;
@property (nonatomic, strong) UIImageView *userIDImageView;
@property (nonatomic, strong) UIImageView *phoneImageView;

@property (nonatomic, strong) AJBMeHeadCustomButton *cashButton;
@property (nonatomic, strong) AJBMeHeadCustomButton *integralButton;
@property (nonatomic, strong) AJBMeHeadCustomButton *couponButton;

@property (nonatomic, strong) UIView *marginView;

@property (nonatomic, strong) UIView *verticalLine1;
@property (nonatomic, strong) UIView *verticalLine2;
@property (nonatomic, strong) UIView *horizontalLine;

@end

@implementation AJBMeHeadView

- (instancetype)init
{
    if (self = [super init]) {
        
        __weak typeof(self) __weakSelf = self;
        
        self.backgroundColor = [UIColor whiteColor];
        
        [self addSubview:self.backgroundImageView];
        [self.backgroundImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.top.mas_equalTo(0);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH, 100));
        }];
        
        [self addSubview:self.headImageView];
        [self.headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(MARGIN_15);
            make.top.equalTo(__weakSelf.backgroundImageView.mas_bottom).offset(-MARGIN_15);
            make.size.mas_equalTo(CGSizeMake(70,70));
        }];
        self.headImageView.layer.cornerRadius = 35;
        self.headImageView.layer.borderColor = [UIColor whiteColor].CGColor;
        self.headImageView.layer.borderWidth = 2;
        
        [self addSubview:self.nickLabel];
        [self.nickLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(__weakSelf.headImageView.mas_bottom).offset(MARGIN_10);
        }];
        
        [self addSubview:self.classImageView];
        [self.classImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(__weakSelf.nickLabel.mas_centerY);
            make.size.mas_equalTo(__weakSelf.classImageView.image.size);
        }];
        
        [self addSubview:self.signinLabel];
        [self.signinLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(__weakSelf.nickLabel.mas_centerY);
            make.size.mas_equalTo(CGSizeMake(40,MARGIN_15));
        }];
        self.signinLabel.layer.cornerRadius = MARGIN_15/2;
        self.signinLabel.layer.borderColor = COLOR_UI_54C1F5.CGColor;
        self.signinLabel.layer.borderWidth = 0.5;
        
        [self addSubview:self.emailImageView];
        [self.emailImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(__weakSelf.mas_right).offset(-MARGIN_15);
            make.centerY.equalTo(__weakSelf.nickLabel.mas_centerY);
            make.size.mas_equalTo(__weakSelf.emailImageView.image.size);
        }];
        
        [self addSubview:self.userIDImageView];
        [self.userIDImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(__weakSelf.emailImageView.mas_left).offset(-MARGIN_5);
            make.centerY.equalTo(__weakSelf.nickLabel.mas_centerY);
            make.size.mas_equalTo(__weakSelf.userIDImageView.image.size);
        }];
        
        [self addSubview:self.phoneImageView];
        [self.phoneImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(__weakSelf.userIDImageView.mas_left).offset(-MARGIN_5);
            make.centerY.equalTo(__weakSelf.nickLabel.mas_centerY);
            make.size.mas_equalTo(__weakSelf.phoneImageView.image.size);
        }];
        
        [self addSubview:self.marginView];
        [self.marginView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.width.equalTo(__weakSelf.mas_width);
            make.height.mas_equalTo(MARGIN_20);
            make.bottom.equalTo(__weakSelf.mas_bottom);
        }];
        
        [self addSubview:self.cashButton];
        [self.cashButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.bottom.equalTo(__weakSelf.marginView.mas_top);
            make.width.mas_equalTo(SCREEN_WIDTH/3);
            make.top.equalTo(__weakSelf.nickLabel.mas_bottom).offset(MARGIN_15);
        }];
        
        [self addSubview:self.integralButton];
        [self.integralButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(__weakSelf.cashButton.mas_right);
            make.bottom.equalTo(__weakSelf.cashButton.mas_bottom);
            make.width.mas_equalTo(SCREEN_WIDTH/3);
            make.top.equalTo(__weakSelf.cashButton.mas_top);
        }];
        
        [self addSubview:self.couponButton];
        [self.couponButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(__weakSelf.integralButton.mas_right);
            make.bottom.equalTo(__weakSelf.cashButton.mas_bottom);
            make.width.mas_equalTo(SCREEN_WIDTH/3);
            make.top.equalTo(__weakSelf.cashButton.mas_top);
        }];
        
        [self addSubview:self.horizontalLine];
        [self.horizontalLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.right.equalTo(__weakSelf.mas_right);
            make.top.equalTo(__weakSelf.cashButton.mas_top);
            make.height.mas_equalTo(0.5);
        }];
        
        [self addSubview:self.verticalLine1];
        [self.verticalLine1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(__weakSelf.cashButton.mas_right);
            make.top.equalTo(__weakSelf.cashButton.mas_top);
            make.height.mas_equalTo(__weakSelf.cashButton.mas_height);
            make.width.mas_equalTo(0.5);
        }];
        
        [self addSubview:self.verticalLine2];
        [self.verticalLine2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(__weakSelf.integralButton.mas_right);
            make.top.equalTo(__weakSelf.cashButton.mas_top);
            make.height.mas_equalTo(__weakSelf.cashButton.mas_height);
            make.width.mas_equalTo(0.5);
        }];
    }
    return self;
}


#pragma mark - getters and setters
- (UIImageView *) backgroundImageView
{
    if (!_backgroundImageView) {
        self.backgroundImageView = [[UIImageView alloc] init];
        _backgroundImageView.image = imageNamed(@"icon_me_background");
    }
    return _backgroundImageView;
}

- (AJBSDWebImageView *)headImageView
{
    if (!_headImageView) {
        self.headImageView = [[AJBSDWebImageView alloc] init];
        
    }
    return _headImageView;
}

- (UILabel *)nickLabel
{
    if (!_nickLabel) {
        self.nickLabel = [[UILabel alloc] init];
        _nickLabel.font = FONT_OF_SIZE_15;
        _nickLabel.textColor = COLOR_UI_333333;
    }
    return _nickLabel;
}

- (AJBSDWebImageView *)classImageView
{
    if (!_classImageView) {
        self.classImageView = [[AJBSDWebImageView alloc] init];
        _classImageView.image = imageNamed(@"icon_me_growth_0");
    }
    return _classImageView;
}

- (UILabel *)signinLabel
{
    if (!_signinLabel) {
        self.signinLabel = [[UILabel alloc] init];
        _signinLabel.font = FONT_OF_SIZE_10;
        _signinLabel.textColor = COLOR_UI_54C1F5;
        _signinLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _signinLabel;
}

- (UIImageView *)emailImageView
{
    if (!_emailImageView) {
        self.emailImageView = [[UIImageView alloc] init];
        _emailImageView.image = imageNamed(@"homeA");
    }
    return _emailImageView;
}

- (UIImageView *)userIDImageView
{
    if (!_userIDImageView) {
        self.userIDImageView = [[UIImageView alloc] init];
        _userIDImageView.image = imageNamed(@"homeA");
    }
    return _userIDImageView;
}

- (UIImageView *) phoneImageView
{
    if (!_phoneImageView) {
        self.phoneImageView = [[UIImageView alloc] init];
        _phoneImageView.image = imageNamed(@"homeA");
    }
    return _phoneImageView;
}

- (UIView *) marginView
{
    if (!_marginView) {
        self.marginView = [[UIView alloc] init];
        _marginView.backgroundColor = COLOR_UI_f1f1f1;
    }
    return _marginView;
}

- (AJBMeHeadCustomButton *) cashButton
{
    if (!_cashButton) {
        self.cashButton = [[AJBMeHeadCustomButton alloc] init];
        [_cashButton refreshdesc:@"我的现金" icon:@"icon_cash"];
        [_cashButton addTarget:self action:@selector(onCashAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cashButton;
}

- (AJBMeHeadCustomButton *) integralButton
{
    if (!_integralButton) {
        self.integralButton = [[AJBMeHeadCustomButton alloc] init];
        [_integralButton refreshdesc:@"我的积分" icon:@"icon_coupon"];
        [_integralButton addTarget:self action:@selector(onIntegralAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _integralButton;
}

- (AJBMeHeadCustomButton *) couponButton
{
    if (!_couponButton) {
        self.couponButton = [[AJBMeHeadCustomButton alloc] init];
        [_couponButton refreshdesc:@"我的优惠券" icon:@"icon_integral"];
        [_couponButton addTarget:self action:@selector(onCouponAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _couponButton;
}


- (UIView *)horizontalLine
{
    if (!_horizontalLine) {
        self.horizontalLine = [[UIView alloc] init];
        _horizontalLine.backgroundColor = COLOR_UI_dddddd;
    }
    return _horizontalLine;
}

- (UIView *) verticalLine1
{
    if (!_verticalLine1) {
        self.verticalLine1 = [[UIView alloc] init];
        _verticalLine1.backgroundColor = COLOR_UI_dddddd;
    }
    return _verticalLine1;
}

- (UIView *) verticalLine2
{
    if (!_verticalLine2) {
        self.verticalLine2 = [[UIView alloc] init];
        _verticalLine2.backgroundColor = COLOR_UI_dddddd;
    }
    return _verticalLine2;
}

#pragma mark - refresh
- (void) refreshWithUserAccount:(JSONUserAccountObj *)obj
{
    JSONUserInfoObj *user = [AJBUserDefaults getUserInfo];
    
    [_headImageView setImageURL:user.servIconUrl];
    
    _nickLabel.text = [user userServName];
    [_classImageView setImageURL:obj.growthIconUrl];
    _signinLabel.text = [user userSign];
    
    [_cashButton refresh:[NSString stringWithFormat:@"%@元",obj.balance]];
    [_couponButton refresh:[NSString stringWithFormat:@"%@张",obj.couponCount]];
    [_integralButton refresh:[NSString stringWithFormat:@"%@分",obj.score]];
    
    __weak typeof(self) __weakSelf = self;
    [self.nickLabel sizeToFit];
    [self.nickLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(__weakSelf.nickLabel.mas_width);
        make.height.mas_equalTo(20);
        make.centerX.equalTo(__weakSelf.headImageView.mas_centerX);
    }];
    
    [self.classImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(__weakSelf.nickLabel.mas_right).offset(MARGIN_5);
    }];
    
    [self.signinLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(__weakSelf.classImageView.mas_right).offset(MARGIN_5);
    }];
}


#pragma mark - action
- (void) onCashAction:(UIButton *) sender
{
    AJBMyCashViewController *vc = [[AJBMyCashViewController alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void) onCouponAction:(UIButton *)sender
{
    AJBCouponViewController *vc = [[AJBCouponViewController alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];

}

- (void) onIntegralAction:(UIButton *)sender
{
    AJBIntegralViewController *vc = [[AJBIntegralViewController alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
