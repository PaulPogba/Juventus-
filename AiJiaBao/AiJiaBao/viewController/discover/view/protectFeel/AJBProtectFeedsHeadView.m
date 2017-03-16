//
//  AJBProtectFeedsHeadView.m
//  AiJiaBao
//
//  Created by 医麦思 on 2017/2/27.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "AJBProtectFeedsHeadView.h"

@interface AJBProtectFeedsHeadView ()

@property (nonatomic, strong) UIImageView *bgImageView;
@property (nonatomic, strong) AJBSDWebImageView *headImageView;
@property (nonatomic, strong) UILabel *nickName;

@end


@implementation AJBProtectFeedsHeadView

- (instancetype)init
{
    if (self = [super init]) {
        
        __weak typeof(self) __weakSelf = self;
        
        [self addSubview:self.bgImageView];
        [self.bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(0);
            make.width.equalTo(__weakSelf.mas_width);
            make.height.equalTo(__weakSelf.mas_height).offset(-MARGIN_20);
        }];
        
        [self addSubview:self.headImageView];
        [self.headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(__weakSelf.mas_right).offset(-MARGIN_20);
            make.bottom.equalTo(__weakSelf.mas_bottom);
            make.size.mas_equalTo(CGSizeMake(60, 60));
        }];
        
        [self addSubview:self.nickName];
        [self.nickName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(__weakSelf.headImageView.mas_left).offset(-MARGIN_10);
            make.top.equalTo(__weakSelf.headImageView.mas_top).offset(MARGIN_10);
            make.height.mas_equalTo(20);
            make.width.mas_equalTo(SCREEN_WIDTH - 80);
        }];
        
    }
    return self;
}

- (UIImageView *)bgImageView
{
    if (!_bgImageView) {
        self.bgImageView = [[UIImageView alloc] init];
        _bgImageView.image = imageNamed(@"icon_protect_bg");
    }
    return _bgImageView;
}

- (AJBSDWebImageView *)headImageView
{
    if (!_headImageView) {
        self.headImageView = [[AJBSDWebImageView alloc] init];
    }
    return _headImageView;
}

- (UILabel *)nickName
{
    if (!_nickName) {
        self.nickName = [[UILabel alloc] init];
        _nickName.font = FONT_OF_SIZE_15;
        _nickName.textColor = [UIColor whiteColor];
        _nickName.textAlignment = NSTextAlignmentRight;
        _nickName.text = @"小Q";
    }
    return _nickName;
}


@end
