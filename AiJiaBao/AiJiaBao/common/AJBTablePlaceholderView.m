//  AJBTablePlaceholderView.h
//  AiJiaBao
//
//  Created by 医麦思 on 2017/2/23.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "AJBTablePlaceholderView.h"

@implementation AJBTablePlaceholderView

- (instancetype)init
{
    if (self = [super init]) {
        
    }
    return self;
}

#pragma getters and setters 
- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        self.titleLabel = [[UILabel alloc] init];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = FONT_OF_SIZE_14;
        _titleLabel.textColor = COLOR_UI_RANDOM;
        _titleLabel.numberOfLines = 0;
    }
    return _titleLabel;
}

- (UILabel *)detailLabel
{
    if (!_detailLabel) {
        self.detailLabel = [[UILabel alloc] init];
        _detailLabel.textAlignment = NSTextAlignmentCenter;
        _detailLabel.numberOfLines = 0;
        _detailLabel.font = FONT_OF_SIZE_14;
        _detailLabel.textColor = COLOR_UI_RANDOM;
    }
    return _detailLabel;
}

- (UIImageView *)imageView
{
    if (!_imageView) {
        self.imageView = [[UIImageView alloc] init];
    }
    return _imageView;
}


- (void)refreshWithImage:(NSString *)image title:(NSString *)title detail:(NSString *)detail
{
    _imageView.image = imageNamed(image);
    _titleLabel.text = title;
    
    _detailLabel.text = detail;
}

@end
