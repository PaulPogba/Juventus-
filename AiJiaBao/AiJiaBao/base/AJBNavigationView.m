//
//  AJBNavigationView.m
//  AiJiaBao
//
//  Created by 医麦思 on 2017/2/20.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#define ITEM_WIDHT 60
#define ITEM_HEIHT 64

#import "AJBNavigationView.h"

@implementation AJBNavigationView

- (id)initWithLeftAction: (void (^)()) leftAction rightAction:(void(^)()) rightAction right1Action:(void(^)()) right1Action;
{
    if (self = [super init]) {
        __weak typeof(self) __weakSelf = self;
        
        self.onLeftAction = leftAction;
        self.onRightAction = rightAction;
        self.onRight1Action = right1Action;
        
      self.backgroundColor = COLOR_UI_54C1F5;

        [self addSubview:self.leftItem];
        [self.leftItem mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(ITEM_WIDHT, ITEM_HEIHT));
            make.left.mas_equalTo(0);
            make.top.mas_equalTo(0);
        }];
        
        [self addSubview:self.rightItem];
        [self.rightItem mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.size.mas_equalTo(CGSizeMake(ITEM_WIDHT, ITEM_HEIHT));
            make.right.mas_equalTo(__weakSelf.mas_right);
        }];
        
        
        [self addSubview:self.rightItem1];
        [self.rightItem1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.right.equalTo(__weakSelf.rightItem.mas_left);
            make.size.mas_equalTo(CGSizeMake(ITEM_WIDHT, ITEM_HEIHT));
        }];
        
        [self addSubview:self.titleLabel];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(__weakSelf.leftItem.mas_right).offset(ITEM_WIDHT);
            make.top.mas_equalTo(STATEBAR_HEIGHT);
            make.right.equalTo(__weakSelf.rightItem1.mas_left);
            make.height.mas_equalTo(NAVITETION_HEIGHT - STATEBAR_HEIGHT);
        }];
    }
    return self;
}

#pragma mark - getters and setters
- (UIButton *)leftItem
{
    if (!_leftItem) {
        self.leftItem = [[UIButton alloc] init];
        [_leftItem setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _leftItem.titleLabel.font = FONT_OF_SIZE_14;
        [_leftItem setImage:imageNamed(@"icon_arrow2") forState:UIControlStateNormal];
        [_leftItem addTarget:self action:@selector(onLeftItemAction:) forControlEvents:UIControlEventTouchUpInside];
        _leftItem.imageEdgeInsets = UIEdgeInsetsMake(10,-10,-10,10);
//        _leftItem.backgroundColor = COLOR_UI_RANDOM;
    }
    return _leftItem;
}

- (UIButton *)rightItem
{
    if (!_rightItem) {
        self.rightItem = [[UIButton alloc] init];
        [_rightItem setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _rightItem.titleLabel.font = FONT_OF_SIZE_14;
//        _rightItem.backgroundColor = COLOR_UI_RANDOM;
        _rightItem.imageEdgeInsets = UIEdgeInsetsMake(10,0,-10,-10);
        [_rightItem addTarget:self action:@selector(onRightItemAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _rightItem;
}

- (UIButton *)rightItem1
{
    if (!_rightItem1) {
        self.rightItem1 = [[UIButton alloc] init];
        [_rightItem1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _rightItem1.titleLabel.font = FONT_OF_SIZE_14;
//        _rightItem1.backgroundColor = COLOR_UI_RANDOM;
        _rightItem1.imageEdgeInsets = UIEdgeInsetsMake(10,0,-10,-30);
        [_rightItem1 addTarget:self action:@selector(onRight1ItemAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _rightItem1;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        self.titleLabel = [[UILabel alloc] init];
        _titleLabel.font = FONT_OF_SIZE_15;
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
//        _titleLabel.backgroundColor = COLOR_UI_RANDOM;
    }
    return _titleLabel;
}

#pragma mark - action
- (void)onLeftItemAction:(UIButton *)sender
{
    if (_onLeftAction) {
        _onLeftAction();
    }
}

- (void)onRightItemAction:(UIButton *)sender
{
    if (_onRightAction) {
        _onRightAction();
    }
}

- (void)onRight1ItemAction:(UIButton *)sender
{
    if (_onRight1Action) {
        _onRight1Action();
    }
}

@end
