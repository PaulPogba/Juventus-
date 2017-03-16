//
//  AJBUploadProtectOrderCell.m
//  AiJiaBao
//
//  Created by nuhgroup on 2017/3/5.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "AJBUploadProtectOrderCell.h"


@interface AJBUploadProtectOrderCell ()

@property (nonatomic, strong) AJBSDWebImageView *imageView;
@property (nonatomic, strong) UILabel *titleLabel;

@end


@implementation AJBUploadProtectOrderCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {

        __weak typeof(self) __weakSelf = self;
        [self addSubview:self.imageView];
        [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(MARGIN_15);
            make.right.equalTo(__weakSelf.mas_right).offset(-MARGIN_15);
            make.height.equalTo(__weakSelf.mas_height).offset(-MARGIN_25-MARGIN_15);
        }];
        
        [self addSubview:self.titleLabel];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(__weakSelf.imageView.mas_bottom);
            make.left.mas_equalTo(MARGIN_5);
            make.right.equalTo(__weakSelf.mas_right).offset(-MARGIN_5);
            make.height.mas_equalTo(MARGIN_25);
        }];
    }
    return self;
}

+ (NSString *) reuseIdentifier
{
    return @"AJBUploadProtectOrderCell";
}

#pragma mark - getters and setters
- (AJBSDWebImageView *) imageView
{
    if (!_imageView) {
        self.imageView = [[AJBSDWebImageView alloc] init];
        _imageView.backgroundColor = COLOR_UI_RANDOM;
    }
    return _imageView;
}

- (UILabel *) titleLabel
{
    if (!_titleLabel) {
        self.titleLabel = [[UILabel alloc] init];
        _titleLabel.backgroundColor = COLOR_UI_RANDOM;
        _titleLabel.font = FONT_OF_SIZE_10;
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.text = @"2014-3-5 14：23：03";
    }
    return _titleLabel;
}


@end
