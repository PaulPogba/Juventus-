//
//  AJBFamilyCustomButton.m
//  AiJiaBao
//
//  Created by 医麦思 on 2017/2/24.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "AJBFamilyCustomButton.h"

@interface AJBFamilyCustomButton ()

@property (nonatomic, strong) UILabel *titlLabel;
@property (nonatomic, strong) UILabel *descLabel;

@end


@implementation AJBFamilyCustomButton
- (instancetype)init
{
    if (self = [super init]) {
        
        __weak typeof(self) __weakSelf = self;
       
        [self addSubview:self.titlLabel];
        [self.titlLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.left.mas_equalTo(0);
            make.width.equalTo(__weakSelf.mas_width);
            make.height.mas_equalTo(MARGIN_20);
        }];
        
        [self addSubview:self.descLabel];
        [self.descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(__weakSelf.titlLabel.mas_bottom).offset(MARGIN_10);
            make.left.mas_equalTo(0);
            make.width.equalTo(__weakSelf.mas_width);
            make.height.mas_equalTo(MARGIN_25);
        }];
        
    }
    return self;
}

#pragma getters and setters
- (UILabel *)titlLabel
{
    if (!_titlLabel) {
        self.titlLabel = [[UILabel alloc] init];
        _titlLabel.font = FONT_OF_SIZE_13;
        _titlLabel.textColor = [UIColor whiteColor];
        _titlLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titlLabel;
}

- (UILabel *)descLabel
{
    if (!_descLabel) {
        self.descLabel = [[UILabel alloc] init];
        _descLabel.font = FONT_OF_SIZE_12;
        _descLabel.textColor = [UIColor whiteColor];
        _descLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _descLabel;
}

#pragma mark - refresh 
- (void) refreshWithTitle:(NSString *)title desc:(NSString *)desc
{
    _titlLabel.text = title;
    NSMutableAttributedString *AttributedStr = [[NSMutableAttributedString alloc]initWithString:desc];
    [AttributedStr addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:16] range:NSMakeRange(0,desc.length - 1)];
    _descLabel.attributedText = AttributedStr;
    
}
@end
