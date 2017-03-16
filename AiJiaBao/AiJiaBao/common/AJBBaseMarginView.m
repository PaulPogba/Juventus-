//
//  AJBBaseMarginView.m
//  AiJiaBao
//
//  Created by nuhgroup on 2017/3/14.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "AJBBaseMarginView.h"

@interface AJBBaseMarginView ()

@property (nonatomic, strong) UILabel *topLine;
@property (nonatomic, strong) UILabel *bottomLine;

@end

@implementation AJBBaseMarginView

- (instancetype)init
{
    if (self = [super init]) {
        
        self.backgroundColor = COLOR_UI_f1f1f1;
        
        __weak typeof(self) __weakSelf = self;
        [self addSubview:self.topLine];
        [self.topLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.left.mas_equalTo(0);
            make.width.equalTo(__weakSelf.mas_width);
            make.height.mas_equalTo(0.5);
        }];
        
        
        [self addSubview:self.bottomLine];
        [self.bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(__weakSelf.mas_bottom);
            make.left.mas_equalTo(0);
            make.width.equalTo(__weakSelf.mas_width);
            make.height.mas_equalTo(0.5);
        }];
        
    }
    return self;
}


- (UILabel *)topLine
{
    if (!_topLine) {
        self.topLine = [[UILabel alloc] init];
        _topLine.backgroundColor = COLOR_UI_dddddd;
    }
    return _topLine;
}

- (UILabel *) bottomLine
{
    if (!_bottomLine) {
        self.bottomLine = [[UILabel alloc] init];
        _bottomLine.backgroundColor = COLOR_UI_dddddd;
    }
    return _bottomLine;
}




@end
