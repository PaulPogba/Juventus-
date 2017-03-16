//
//  AJBProtectCollectionViewCell.m
//  AiJiaBao
//
//  Created by nuhgroup on 2017/3/3.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "AJBProtectCollectionViewCell.h"

@interface AJBProtectCollectionViewCell ()

@property (nonatomic, strong) AJBSDWebImageView *headImageView;
@property (nonatomic, strong) UILabel *nickName;

@end


@implementation AJBProtectCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = COLOR_UI_RANDOM;
        __weak typeof(self) __weakSelf = self;
        [self addSubview:self.headImageView];
        [self.headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(MARGIN_15);
            make.right.equalTo(__weakSelf.mas_right).offset(-MARGIN_15);
            make.height.mas_equalTo(50);
        }];
        
        [self addSubview:self.nickName];
        [self.nickName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(__weakSelf.headImageView.mas_bottom).offset(MARGIN_5);
            make.left.mas_equalTo(MARGIN_5);
            make.right.equalTo(__weakSelf.mas_right).offset(-MARGIN_5);
            make.height.mas_equalTo(20);
        }];
    }
    return self;
}

+ (NSString *) reuseIdentifier
{
    return @"AJPProtectCollectionViewCell";
}

#pragma mark - getters and setters 
- (AJBSDWebImageView *) headImageView
{
    if (!_headImageView) {
        self.headImageView = [[AJBSDWebImageView alloc] init];
        _headImageView.backgroundColor = COLOR_UI_RANDOM;
    }
    return _headImageView;
}

- (UILabel *) nickName
{
    if (!_nickName) {
        self.nickName = [[UILabel alloc] init];
        _nickName.backgroundColor = COLOR_UI_RANDOM;
        _nickName.font = FONT_OF_SIZE_13;
        _nickName.textAlignment = NSTextAlignmentCenter;
        _nickName.text = @"昵称";
    }
    return _nickName;
}

@end
