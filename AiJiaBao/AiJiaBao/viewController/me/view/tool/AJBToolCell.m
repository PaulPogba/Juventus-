//
//  AJBToolCell.m
//  AiJiaBao
//
//  Created by nuhgroup on 2017/3/9.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "AJBToolCell.h"

@interface AJBToolCell ()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UILabel *line;
@property (nonatomic, strong) UILabel *lineRight;

@end

@implementation AJBToolCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        __weak typeof(self) __weakSelf = self;
        
        [self addSubview:self.imageView];
        [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(__weakSelf.mas_centerX);
            make.centerY.equalTo(__weakSelf.mas_centerY).offset(-MARGIN_5);
            make.width.mas_equalTo(60);
            make.height.mas_equalTo(60);
        }];
        
        [self addSubview:self.titleLabel];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(__weakSelf.imageView.mas_bottom).offset(MARGIN_10);
            make.left.mas_equalTo(MARGIN_5);
            make.right.equalTo(__weakSelf.mas_right).offset(-MARGIN_5);
            make.height.mas_equalTo(MARGIN_15);
        }];
        
        [self addSubview:self.line];
        [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(__weakSelf.mas_bottom);
            make.left.mas_equalTo(0);
            make.width.equalTo(__weakSelf.mas_width);
            make.height.mas_equalTo(1);
        }];
    
        [self addSubview:self.lineRight];
        [self.lineRight mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(__weakSelf.mas_right);
            make.top.mas_equalTo(0);
            make.height.equalTo(__weakSelf.mas_height);
            make.width.mas_equalTo(1);
        }];
        
    }
    return self;
}


#pragma mark - getters and setters 
- (UIImageView *)imageView
{
    if (!_imageView) {
        self.imageView = [[UIImageView alloc] init];
        _imageView.backgroundColor = COLOR_UI_RANDOM;
    }
    return _imageView;
}


- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        self.titleLabel = [[UILabel alloc] init];
        _titleLabel.font = FONT_OF_SIZE_14;
        _titleLabel.textColor = COLOR_UI_333333;
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}

- (UILabel *)line
{
    if (!_line) {
        self.line = [[UILabel alloc] init];
        _line.backgroundColor = COLOR_UI_f1f1f1;
    }
    return _line;
}

- (UILabel *)lineRight
{
    if (!_lineRight) {
        self.lineRight = [[UILabel alloc] init];
        _lineRight.backgroundColor = COLOR_UI_f1f1f1;
    }
    return _lineRight;
}

+ (NSString *) reuseIdentifier
{
    return @"AJBToolCell";
}


#pragma mark - refresh
- (void) refreshWithImage:(NSString *)image title:(NSString *) title
{
    _imageView.image = imageNamed(image);
    _titleLabel.text = title;
}



@end
