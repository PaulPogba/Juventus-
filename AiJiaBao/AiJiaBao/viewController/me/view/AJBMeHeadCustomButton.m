//
//  AJBMeHeadCustomButton.m
//  AiJiaBao
//
//  Created by 医麦思 on 2017/2/26.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "AJBMeHeadCustomButton.h"

@interface AJBMeHeadCustomButton ()

@property (nonatomic, strong) UILabel *titlLabel;
@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel *descLabel;


@end

@implementation AJBMeHeadCustomButton

- (instancetype)init
{
    if (self = [super init]) {
        
        __weak typeof(self) __weakSelf = self;
        
        [self addSubview:self.titlLabel];
        [self.titlLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(MARGIN_15);
            make.centerX.equalTo(__weakSelf.mas_centerX);
            make.width.equalTo(__weakSelf.mas_width);
            make.height.mas_equalTo(MARGIN_20);
        }];
        
        [self addSubview:self.iconImageView];
        [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(__weakSelf.titlLabel.mas_bottom).offset(MARGIN_5);
            make.left.mas_equalTo(MARGIN_15);
        }];
        
        [self addSubview:self.descLabel];
        [self.descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(__weakSelf.iconImageView.mas_top);
            make.left.equalTo(__weakSelf.iconImageView.mas_right).offset(MARGIN_5);
            make.width.mas_equalTo(__weakSelf.mas_width).offset(-MARGIN_15 - __weakSelf.iconImageView.image.size.width);
            make.height.mas_equalTo(MARGIN_15);
        }];
    }
    return self;
}


#pragma mark - getters and setters
- (UILabel *)titlLabel
{
    if (!_titlLabel) {
        self.titlLabel = [[UILabel alloc] init];
        _titlLabel.font = FONT_OF_SIZE_10;
        _titlLabel.textColor = COLOR_UI_ff7878;
        _titlLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titlLabel;
}

- (UIImageView *) iconImageView
{
    if (!_iconImageView) {
        self.iconImageView = [[UIImageView alloc] init];
        _iconImageView.clipsToBounds = YES;
    }
    return _iconImageView;
}

- (UILabel *) descLabel
{
    if (!_descLabel) {
        self.descLabel = [[UILabel alloc] init];
        _descLabel.font = FONT_OF_SIZE_12;
        _descLabel.textColor = COLOR_UI_888888;
    }
    return _descLabel;
}

#pragma mark - refresh
- (void) refresh:(NSString *) text
{
    NSMutableAttributedString *attbutString = [[NSMutableAttributedString alloc] initWithString:text];
    [attbutString addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:17] range:NSMakeRange(0,text.length - 1)];
    _titlLabel.attributedText = attbutString;
}

- (void) refreshdesc:(NSString *)desc icon:(NSString *)icon
{
    __weak typeof(self) __weakSelf = self;
    self.descLabel.text = desc;
    self.iconImageView.image = imageNamed(icon);
    [self.iconImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(__weakSelf.iconImageView.image.size);
    }];
}


@end
