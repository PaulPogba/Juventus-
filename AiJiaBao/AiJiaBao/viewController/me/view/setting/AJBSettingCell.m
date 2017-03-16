//
//  AJBSettingCell.m
//  AiJiaBao
//
//  Created by nuhgroup on 2017/3/10.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "AJBSettingCell.h"

@interface AJBSettingCell ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *detailLabel;

@property (nonatomic, strong) UILabel *descLabel;
@property (nonatomic, strong) UILabel *stateLabel;

@property (nonatomic, strong) UIImageView *iconImage;
@property (nonatomic, strong) UIImageView *arrowImage;

@property (nonatomic, strong) UILabel *line;

@end

@implementation AJBSettingCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        __weak typeof(self) __weakSelf = self;
        UIImage *image = imageNamed(@"homeA");
        [self addSubview:self.iconImage];
        [self.iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(MARGIN_15);
            make.centerY.equalTo(__weakSelf.mas_centerY);
            make.size.mas_equalTo(image.size);
        }];
        
        [self addSubview:self.titleLabel];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(__weakSelf.iconImage.mas_right).offset(MARGIN_15);
            make.centerY.equalTo(__weakSelf.mas_centerY);
            make.width.mas_equalTo(80);
            make.height.equalTo(__weakSelf.mas_height);
        }];
        
        [self addSubview:self.detailLabel];
        [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(__weakSelf.titleLabel.mas_right).offset(MARGIN_15);
            make.centerY.equalTo(__weakSelf.mas_centerY);
            make.width.mas_equalTo(100);
            make.height.equalTo(__weakSelf.mas_height);
        }];
        
        [self addSubview:self.arrowImage];
        [self.arrowImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(__weakSelf.mas_right).offset(-MARGIN_15);
            make.centerY.equalTo(__weakSelf.mas_centerY);
            make.size.mas_equalTo(CGSizeMake(20, 20));
        }];

        [self addSubview:self.descLabel];
        [self.descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(__weakSelf.arrowImage.mas_left).offset(-MARGIN_15);
            make.centerY.equalTo(__weakSelf.mas_centerY);
            make.height.equalTo(__weakSelf.mas_height);
            make.width.mas_equalTo(50);
        }];
        
        [self addSubview:self.stateLabel];
        [self.stateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(__weakSelf.arrowImage.mas_left).offset(-MARGIN_15);
            make.centerY.equalTo(__weakSelf.mas_centerY);
            make.height.mas_equalTo(30);
            make.width.mas_equalTo(80);
        }];
        
        [self addSubview:self.line];
        [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(MARGIN_15);
            make.bottom.equalTo(__weakSelf.mas_bottom);
            make.width.mas_equalTo(SCREEN_WIDTH - MARGIN_15);
            make.height.mas_equalTo(0.5);
        }];
    }
    return self;
}



#pragma mark - getters and setters 
- (UIImageView *)iconImage
{
    if (!_iconImage) {
        self.iconImage = [[UIImageView alloc] init];
        _iconImage.backgroundColor = COLOR_UI_RANDOM;
    }
    return _iconImage;
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

- (UILabel *) detailLabel
{
    if (!_detailLabel) {
        self.detailLabel = [[UILabel alloc] init];
        _detailLabel.font = FONT_OF_SIZE_14;
        _detailLabel.textColor = COLOR_UI_dddddd;
    }
    return _detailLabel;
}

- (UILabel *) descLabel
{
    if (!_descLabel) {
        self.descLabel = [[UILabel alloc] init];
        _descLabel.font = FONT_OF_SIZE_13;
        _descLabel.textColor = COLOR_UI_54C1F5;
        _descLabel.textAlignment = NSTextAlignmentRight;
    }
    return _descLabel;
}


- (UILabel *)stateLabel
{
    if (!_stateLabel) {
        self.stateLabel = [[UILabel alloc] init];
        _stateLabel.layer.cornerRadius = 3;
        _stateLabel.layer.borderColor = COLOR_UI_29cd94.CGColor;
        _stateLabel.layer.backgroundColor = COLOR_UI_29cd94.CGColor;
        _stateLabel.textColor = [UIColor whiteColor];
        _stateLabel.font = FONT_OF_SIZE_14;
        _stateLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _stateLabel;
}


- (UIImageView *)arrowImage
{
    if (!_arrowImage) {
        self.arrowImage = [[UIImageView alloc] init];
        _arrowImage.backgroundColor = COLOR_UI_RANDOM;
    }
    return _arrowImage;
}

-(UILabel *)line
{
    if (!_line) {
        self.line = [[UILabel alloc] init];
        _line.backgroundColor = COLOR_UI_dddddd;
    }
    return _line;
}


#pragma mark - refresh 
- (void) refreshWithTitle:(NSString *) title
{
    _titleLabel.text = title;
    _iconImage.image = imageNamed(@"homeA");
}

+ (NSString *) reuseIdentifier
{
    return @"AJBSettingCell";
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
//@property (nonatomic, strong) UILabel *titleLabel;
