//
//  AJBFriendsCell.m
//  AiJiaBao
//
//  Created by nuhgroup on 2017/3/6.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "AJBFriendsCell.h"

@interface AJBFriendsCell ()

@property (nonatomic, strong) AJBSDWebImageView *headImageView;
@property (nonatomic, strong) UILabel *nickName;
@property (nonatomic, strong) UIView *line;

@end

@implementation AJBFriendsCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        __weak typeof(self) __weakSelf = self;
        [self addSubview:self.headImageView];
        [self.headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(MARGIN_15);
            make.top.mas_equalTo(MARGIN_10);
            make.bottom.equalTo(__weakSelf.mas_bottom).offset(- MARGIN_10);
            make.width.mas_equalTo(40);
        }];
        
        [self addSubview:self.nickName];
        [self.nickName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(__weakSelf.headImageView.mas_right).offset(MARGIN_15);
            make.centerY.equalTo(__weakSelf.mas_centerY);
            make.width.mas_equalTo(SCREEN_WIDTH - 100 - MARGIN_15);
            make.height.mas_equalTo(MARGIN_30);
        }];
        
        [self addSubview:self.line];
        [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(__weakSelf.mas_bottom);
            make.left.mas_equalTo(MARGIN_15);
            make.height.mas_equalTo(0.5);
            make.right.equalTo(__weakSelf.mas_right);
        }];
    }
    return self;
}


+ (NSString *) reuseIdentifier
{
    return @"AJBFriendsCell";
}


#pragma mark - getters and setters
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
        _nickName.font = FONT_OF_SIZE_14;
        _nickName.textColor = COLOR_UI_333333;
    }
    return _nickName;
}

- (UIView *)line
{
    if (!_line) {
        self.line = [[UIView alloc] init];
        _line.backgroundColor = COLOR_UI_f1f1f1;
    }
    return _line;
}


- (void) refreshTitle:(NSString *) title
{
    _nickName.text = title;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
