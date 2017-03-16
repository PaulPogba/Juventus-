//
//  AJBMyCashCell.m
//  AiJiaBao
//
//  Created by nuhgroup on 2017/3/1.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "AJBMyCashCell.h"
@interface AJBMyCashCell ()

@property (nonatomic, strong) UIImageView *arrowImageView;

@end

@implementation AJBMyCashCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        __weak typeof(self) __weakSelf = self;
        
        [self addSubview:self.arrowImageView];
        [self.arrowImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(__weakSelf.mas_right).offset(-MARGIN_30);
            make.centerY.equalTo(__weakSelf.mas_centerY);
            make.size.mas_equalTo(__weakSelf.arrowImageView.image.size);
        }];
    }
    
    return self;
}

#pragma mark - getters and setters
- (UIImageView *)arrowImageView
{
    if (!_arrowImageView) {
        self.arrowImageView = [[UIImageView alloc] init];
        _arrowImageView.image = imageNamed(@"icon_arrow2");
    }
    return _arrowImageView;
}


- (NSString *)reuseIdentifier
{
    return @"AJBMyCashCell";
}


@end
