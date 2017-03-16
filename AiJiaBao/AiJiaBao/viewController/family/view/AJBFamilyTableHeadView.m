//
//  AJBFamilyTableHeadView.m
//  AiJiaBao
//
//  Created by 医麦思 on 2017/2/24.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "AJBFamilyTableHeadView.h"
#import "AJBFamilyCustomButton.h"
#import "AJBAddPeopleViewController.h"


@interface AJBFamilyTableHeadView ()

@property (nonatomic, strong) UIImageView *backgroundImageView;
@property (nonatomic, strong) UIButton *addButton;
@property (nonatomic, strong) AJBFamilyCustomButton *familyButton;
@property (nonatomic, strong) AJBFamilyCustomButton *numberButton;
@property (nonatomic, strong) AJBFamilyCustomButton *totalButton;
@property (nonatomic, strong) AJBFamilyCustomButton *orderButton;

@property (nonatomic, strong) UILabel *horizontalLine;
@property (nonatomic, strong) UILabel *verticalLine;

@end

@implementation AJBFamilyTableHeadView

- (instancetype)init
{
    if (self = [super init]) {
        self.backgroundColor = COLOR_UI_RANDOM;
        __weak typeof(self) __weakSelf = self;
        self.backgroundColor = [UIColor whiteColor];
        [self.layer addSublayer:[AJBCommon gradientLayerWithHeight:210]];
        [self addSubview:self.backgroundImageView];
        [self.backgroundImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.mas_equalTo(0);
            make.width.equalTo(__weakSelf.mas_width);
            make.height.equalTo(__weakSelf.mas_height).offset( - MARGIN_30);
        }];
        
        [self addSubview:self.familyButton];
        [self.familyButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(MARGIN_15+NAVITETION_HEIGHT);
            make.left.height.width.mas_equalTo(SCREEN_WIDTH/6);
        }];
        
        [self addSubview:self.numberButton];
        [self.numberButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(MARGIN_15+NAVITETION_HEIGHT);
            make.left.mas_equalTo((SCREEN_WIDTH/6) *4);
            make.height.width.mas_equalTo(SCREEN_WIDTH/6);
        }];

        
        [self addSubview:self.horizontalLine];
        [self.horizontalLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(__weakSelf.familyButton.mas_bottom);
            make.left.equalTo(__weakSelf.familyButton.mas_centerX);
            make.right.equalTo(__weakSelf.numberButton.mas_centerX);
            make.height.mas_equalTo(0.5);
        }];
        
        [self addSubview:self.totalButton];
        [self.totalButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(__weakSelf.familyButton.mas_bottom).offset(MARGIN_10);
            make.left.height.width.mas_equalTo(SCREEN_WIDTH/6);
        }];

        
        [self addSubview:self.orderButton];
        [self.orderButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(__weakSelf.totalButton.mas_top);
            make.left.mas_equalTo((SCREEN_WIDTH/6) *4);
            make.height.width.mas_equalTo(SCREEN_WIDTH/6);
        }];
        
        [self addSubview:self.verticalLine];
        [self.verticalLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(__weakSelf.familyButton.mas_centerY);
            make.bottom.equalTo(__weakSelf.orderButton.mas_centerY);
            make.left.equalTo(__weakSelf.mas_centerX);
            make.width.mas_equalTo(0.5);
        }];
        
        UIImage *image = imageNamed(@"icon_family_add");
        NSLog(@"%@",image);
        [self addSubview:self.addButton];
        [self.addButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(__weakSelf.mas_centerX);
            make.size.mas_equalTo(image.size);
            make.bottom.equalTo(__weakSelf.mas_bottom).offset(MARGIN_30 - MARGIN_11);

        }];
        
        [self.familyButton refreshWithTitle:@"家庭成员" desc:@"9人"];
        [self.numberButton refreshWithTitle:@"保障人数" desc:@"9人"];
        [self.totalButton refreshWithTitle:@"保障总额" desc:@"1200万"];
        [self.orderButton refreshWithTitle:@"有效保单" desc:@"100份"];
        
    }
    return self;
}

#pragma getters and setters
- (UIImageView *)backgroundImageView
{
    if (!_backgroundImageView) {
        self.backgroundImageView = [[UIImageView alloc] init];
    }
    return _backgroundImageView;
}

- (UIButton *)addButton
{
    if (!_addButton) {
        self.addButton = [[UIButton alloc] init];
        [_addButton setImage:imageNamed(@"icon_family_add") forState:UIControlStateNormal];
        [_addButton addTarget:self action:@selector(onAddAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _addButton;
}


- (UIButton *)familyButton
{
    if (!_familyButton) {
        self.familyButton = [[AJBFamilyCustomButton alloc] init];
    }
    return _familyButton;
}


- (UIButton *)numberButton
{
    if (!_numberButton) {
        self.numberButton = [[AJBFamilyCustomButton alloc] init];
    }
    return _numberButton;
}

- (UIButton *)totalButton
{
    if (!_totalButton) {
        self.totalButton = [[AJBFamilyCustomButton alloc] init];
    }
    return _totalButton;
}

- (UIButton *)orderButton
{
    if (!_orderButton) {
        self.orderButton = [[AJBFamilyCustomButton alloc] init];
    }
    return _orderButton;
}

- (UILabel *)horizontalLine
{
    if (!_horizontalLine) {
        self.horizontalLine = [[UILabel alloc] init];
        _horizontalLine.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.4];
    }
    return _horizontalLine;
}

- (UILabel *)verticalLine
{
    if (!_verticalLine) {
        self.verticalLine = [[UILabel alloc] init];
        _verticalLine.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.4];
    }
    return _verticalLine;
}

#pragma mark - action
- (void) onAddAction:(UIButton *)sender
{
    AJBAddPeopleViewController *vc = [[AJBAddPeopleViewController alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

@end
