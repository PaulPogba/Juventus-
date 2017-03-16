//
//  AJBCouponMoreView.m
//  AiJiaBao
//
//  Created by nuhgroup on 2017/3/2.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "AJBCouponMoreView.h"

@interface AJBCouponLabel:UILabel

@end


@implementation AJBCouponLabel
- (instancetype)init
{
    if (self = [super init]) {
        self.textColor = COLOR_UI_dddddd;
        self.font = FONT_OF_SIZE_13;
    }
    return self;
}

@end

@interface AJBCouponMoreView ()

@property (nonatomic, strong) NSMutableArray *labelArray;
@property (nonatomic, strong) UIButton *showMoreButton;

@property (nonatomic, strong) JSONCouponObj *obj;

@end

@implementation AJBCouponMoreView
- (instancetype)init
{
    if (self = [super init]) {
        
        self.labelArray = [[NSMutableArray alloc] init];
        
        __weak typeof(self) __weakSelf = self;
        [self addSubview:self.showMoreButton];
        [self.showMoreButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(__weakSelf.mas_right);
            make.top.mas_equalTo(0);
            make.height.mas_equalTo(30);
            make.width.mas_equalTo(30);
        }];
    }
    return self;
}

- (UIButton *)showMoreButton
{
    if (!_showMoreButton) {
        self.showMoreButton = [[UIButton alloc] init];
        [_showMoreButton setImage:imageNamed(@"icon_arrow2") forState:UIControlStateNormal];
        [_showMoreButton addTarget:self action:@selector(showMore) forControlEvents:UIControlEventTouchUpInside];
    }
    return _showMoreButton;
}

- (void)showMore{
    self.obj.isShowMore = !self.obj.isShowMore;
    if ([self.delegate respondsToSelector:@selector(showCouponMoreViewDelegate)]){
        [self.delegate showCouponMoreViewDelegate];
    }
}

-(void) refreshWithObj:(JSONCouponObj *)obj
{
    self.obj = obj;
    NSInteger idx = 0;
    for (NSString *title in obj.array) {
        if (!obj.isShowMore && idx > 1) {
            break;
        }
        AJBCouponLabel *label = nil;
        if (_labelArray.count > idx) {
            label = [_labelArray objectAtIndex:idx];
            label.hidden = NO;
        } else {
            label = [[AJBCouponLabel alloc] init];
            [self addSubview:label];
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(MARGIN_15);
                make.top.mas_equalTo(idx * MARGIN_20);
                make.width.mas_equalTo(SCREEN_WIDTH - 60);
                make.height.mas_equalTo(MARGIN_20);
            }];
            [_labelArray addObject:label];
        }
        label.text = title;
        idx++;
    }
    
    NSInteger tmp = idx;
    while (tmp<_labelArray.count)
    {
        AJBCouponLabel *label = [_labelArray objectAtIndex:tmp];
        label.hidden = YES;
        tmp++;
    }
    
    if (obj.array.count > 3) {
        _showMoreButton.hidden = NO;
    } else {
        _showMoreButton.hidden = YES;
    }
}

/**
 默认高度
 */
+ (CGFloat)defaultHeight:(JSONCouponObj *)obj
{
    if (obj.array.count >= 2) {
        return 40;
    } else {
        return 20;
    }
}

/**
 展开高度
 */
+ (CGFloat)moreHeight:(JSONCouponObj *)obj
{
    return obj.array.count *MARGIN_20;
}


@end
