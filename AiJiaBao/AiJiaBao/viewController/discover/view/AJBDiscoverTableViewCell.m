//
//  AJBDiscoverTableViewCell.m
//  AiJiaBao
//
//  Created by 医麦思 on 2017/2/24.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "AJBDiscoverTableViewCell.h"

@interface AJBDiscoverTableViewCell ()

@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *line;

@end

@implementation AJBDiscoverTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
    
        __weak typeof(self) __weakSelf = self;
        UIImage *image = imageNamed(@"homeA");
        [self addSubview:self.iconImageView];
        [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(MARGIN_15);
            make.centerY.equalTo(__weakSelf.mas_centerY);
            make.size.mas_equalTo(image.size);
        }];
        
        [self addSubview:self.titleLabel];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(__weakSelf.iconImageView.mas_right).offset(MARGIN_15);
            make.top.mas_equalTo(0);
            make.right.equalTo(__weakSelf.mas_right);
            make.height.equalTo(__weakSelf.mas_height);
        }];
        
        [self addSubview:self.line];
        [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(MARGIN_15);
            make.right.equalTo(__weakSelf.mas_right).offset(-MARGIN_15);
            make.bottom.equalTo(__weakSelf.mas_bottom);
            make.height.mas_equalTo(0.5);
        }];
        
    }
    return self;
}

- (UIImageView *)iconImageView
{
    if (!_iconImageView) {
        self.iconImageView = [[UIImageView alloc] init];
    }
    return _iconImageView;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        self.titleLabel = [[UILabel alloc] init];
        _titleLabel.font = FONT_OF_SIZE_14;
        _titleLabel.textColor = COLOR_UI_333333;
    }
    return _titleLabel;
}

- (UILabel *)line
{
    if (!_line) {
        self.line = [[UILabel alloc] init];
        _line.backgroundColor = COLOR_UI_dddddd;
    }
    return _line;
}

#pragma mark - refresh
- (void) refreshWithIcon:(NSString *)image title:(NSString *) title hiddenLine:(BOOL)hiddenLine
{
    self.iconImageView.image = imageNamed(image);
    self.titleLabel.text = title;
    self.line.hidden = hiddenLine;
}

#pragma mark -
+ (NSString *) reuseIdentifier
{
    return @"AJBDiscoverTableViewCell";
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
