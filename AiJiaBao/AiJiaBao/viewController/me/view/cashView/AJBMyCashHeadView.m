//
//  AJBMyCashHeadView.m
//  AiJiaBao
//
//  Created by nuhgroup on 2017/3/1.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "AJBMyCashHeadView.h"

@interface AJBMyCashHeadView ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *cashLabel;

@property (nonatomic, strong) UIButton *rechargeButton;
@property (nonatomic, strong) UIButton *tixianButton;

@property (nonatomic, strong) UILabel *line;
@property (nonatomic, strong) UIView *marginView;

@end

@implementation AJBMyCashHeadView

- (instancetype)init
{
    if (self = [super init]) {
        self.backgroundColor = COLOR_UI_54C1F5;
        
        __weak typeof(self) __weakSelf = self;
        
        [self addSubview:self.titleLabel];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(MARGIN_40);
            make.left.mas_equalTo(0);
            make.width.equalTo(__weakSelf.mas_width);
            make.height.mas_equalTo(MARGIN_15);
        }];
        
        [self addSubview:self.cashLabel];
        [self.cashLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(__weakSelf.titleLabel.mas_bottom).offset(MARGIN_10);
            make.left.mas_equalTo(0);
            make.width.equalTo(__weakSelf.mas_width);
            make.height.mas_equalTo(MARGIN_40);
        }];
        
        [self addSubview:self.marginView];
        [self.marginView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.bottom.equalTo(__weakSelf.mas_bottom);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH,MARGIN_10));
        }];
        
        [self addSubview:self.rechargeButton];
        [self.rechargeButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.bottom.equalTo(__weakSelf.marginView.mas_top);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH/2,70));
        }];
        
   
        [self addSubview:self.tixianButton];
        [self.tixianButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(__weakSelf.rechargeButton.mas_right);
            make.bottom.equalTo(__weakSelf.marginView.mas_top);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH/2,70));
        }];
        
        [self addSubview:self.line];
        [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(__weakSelf.rechargeButton.mas_top);
            make.width.mas_equalTo(0.5);
            make.height.equalTo(__weakSelf.rechargeButton.mas_height);
            make.left.equalTo(__weakSelf.rechargeButton.mas_right);
        }];
        
    }
    return self;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        self.titleLabel = [[UILabel alloc] init];
        _titleLabel.font = FONT_OF_SIZE_13;
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.text = @"现金余额";
    }
    return _titleLabel;
}

- (UILabel *)cashLabel
{
    if (!_cashLabel) {
        self.cashLabel = [[UILabel alloc] init];
        _cashLabel.font = FONT_OF_SIZE_15;
        _cashLabel.textColor = [UIColor whiteColor];
        _cashLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _cashLabel;
}

- (UIButton *)rechargeButton
{
    if (!_rechargeButton) {
        self.rechargeButton = [[UIButton alloc] init];
        [_rechargeButton setTitle:@"充值" forState:UIControlStateNormal];
        [_rechargeButton setTitleColor:COLOR_UI_333333 forState:UIControlStateNormal];
        [_rechargeButton setImage:imageNamed(@"homeA") forState:UIControlStateNormal];
        _rechargeButton.titleLabel.font = FONT_OF_SIZE_16;
        [_rechargeButton setIconInLeftWithSpacing:MARGIN_5];
        _rechargeButton.backgroundColor = [UIColor whiteColor];
    }
    return _rechargeButton;
}

- (UIButton *)tixianButton
{
    if (!_tixianButton) {
        self.tixianButton = [[UIButton alloc] init];
        [_tixianButton setTitle:@"提现" forState:UIControlStateNormal];
        [_tixianButton setTitleColor:COLOR_UI_333333 forState:UIControlStateNormal];
        [_tixianButton setImage:imageNamed(@"homeA") forState:UIControlStateNormal];
        _tixianButton.titleLabel.font = FONT_OF_SIZE_16;
        [_tixianButton setIconInLeftWithSpacing:MARGIN_5];
        _tixianButton.backgroundColor = [UIColor whiteColor];
    }
    return _tixianButton;
}

- (UILabel *)line
{
    if (!_line) {
        self.line = [[UILabel alloc] init];
        _line.backgroundColor = COLOR_UI_dddddd;
    }
    return _line;
}



- (UIView *)marginView
{
    if (!_marginView) {
        self.marginView = [[UIView alloc] init];
        _marginView.backgroundColor = COLOR_UI_f1f1f1;
    }
    return _marginView;
}


#pragma mark - refresh
-(void) refreshCash:(NSString *) cash
{
    NSMutableAttributedString *attString = [[NSMutableAttributedString alloc] initWithString:cash];
    [attString addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:30] range:NSMakeRange(0, cash.length - 1)];
    _cashLabel.attributedText = attString;
}


@end
