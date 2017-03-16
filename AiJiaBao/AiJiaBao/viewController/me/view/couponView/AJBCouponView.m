//
//  AJBCouponView.m
//  AiJiaBao
//
//  Created by nuhgroup on 2017/3/1.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "AJBCouponView.h"
#import "AJBCouponMoreView.h"

@interface AJBCouponView ()<AJBCouponMoreViewDelegate>

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIImageView *useImageView;
@property (nonatomic, strong) UIButton *useButton;

@property (nonatomic, strong) UILabel *priceLabel;
@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UIImageView *lineImage;

@property (nonatomic, strong) AJBCouponMoreView *couponMoreView;

@end

@implementation AJBCouponView

- (instancetype)init
{
    if (self = [super init]) {
        
        self.clipsToBounds = YES;
        
        __weak typeof(self) __weakSelf = self;
        UIImage *image = imageNamed(@"coupon_line_red");
        
        [self addSubview:self.imageView];
        [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.mas_equalTo(0);
            make.width.equalTo(__weakSelf.mas_width);
            make.height.mas_equalTo(image.size.height);
        }];
        
        
        [self addSubview:self.useImageView];
        [self.useImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(__weakSelf.imageView.mas_bottom).offset(MARGIN_15);
            make.right.equalTo(__weakSelf.mas_right).offset(-MARGIN_15);
            make.size.mas_equalTo(__weakSelf.useImageView.image.size);
        }];
        
        [self addSubview:self.useButton];
        [self.useButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(MARGIN_15);
            make.right.equalTo(__weakSelf.mas_right).offset(-MARGIN_15);
            make.size.mas_equalTo(CGSizeMake(60,20));
        }];

        [self addSubview:self.priceLabel];
        [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(__weakSelf.imageView.mas_bottom);
            make.left.mas_equalTo(MARGIN_15);
            make.right.equalTo(__weakSelf.useButton.mas_left).offset(-MARGIN_10);
            make.height.mas_equalTo(30);
        }];
        
        [self addSubview:self.titleLabel];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(__weakSelf.priceLabel.mas_bottom).offset(MARGIN_10);
            make.left.mas_equalTo(MARGIN_15);
            make.right.equalTo(__weakSelf.mas_right).offset(-MARGIN_15);
            make.height.mas_equalTo(20);
        }];
        [self addSubview:self.lineImage];
        [self.lineImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(__weakSelf.titleLabel.mas_bottom).offset(MARGIN_10);
            make.left.mas_equalTo(0);
            make.right.equalTo(__weakSelf.mas_right);
            make.height.mas_equalTo(1);
        }];
        
        [self addSubview:self.couponMoreView];
        [self.couponMoreView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.top.equalTo(__weakSelf.lineImage.mas_bottom).offset(MARGIN_10);
            make.width.equalTo(__weakSelf.mas_width);
            make.height.mas_equalTo(0);
        }];
    }
    return self;
}

#pragma getters and setters 
- (UIImageView *)imageView
{
    if (!_imageView) {
        self.imageView = [[UIImageView alloc] init];
    }
    return _imageView;
}

- (UIImageView *)useImageView
{
    if (!_useImageView) {
        self.useImageView = [[UIImageView alloc] init];
    }
    return _useImageView;
}

- (UIButton *)useButton
{
    if (!_useButton) {
        self.useButton = [[UIButton alloc] init];
        [_useButton setTitle:@"使用" forState:UIControlStateNormal];
        [_useButton setTitleColor:COLOR_UI_54C1F5 forState:UIControlStateNormal];
        _useButton.titleLabel.font = FONT_OF_SIZE_13;
        
        _useButton.layer.cornerRadius = 3;
        _useButton.layer.borderColor = COLOR_UI_54C1F5.CGColor;
        _useButton.layer.borderWidth = 0.5;
    }
    return _useButton;
}

- (UILabel *)priceLabel
{
    if (!_priceLabel) {
        self.priceLabel = [[UILabel alloc] init];
        _priceLabel.font = FONT_OF_SIZE_17;
    }
    return _priceLabel;
}

-(UILabel *)titleLabel
{
    if (!_titleLabel) {
        self.titleLabel = [[UILabel alloc] init];
        _titleLabel.font = FONT_OF_SIZE_15;
        _titleLabel.textColor = COLOR_UI_333333;
    }
    return _titleLabel;
}

- (UIImageView *)lineImage
{
    if (!_lineImage) {
        self.lineImage = [[UIImageView alloc] init];
        _lineImage.backgroundColor = [UIColor redColor];
    }
    return _lineImage;
}

- (AJBCouponMoreView *)couponMoreView
{
    if (!_couponMoreView) {
        self.couponMoreView = [[AJBCouponMoreView alloc] init];
        _couponMoreView.delegate = self;
    }
    return _couponMoreView;
}

- (void)showCouponMoreViewDelegate
{
    if ([self.delegate respondsToSelector:@selector(showMoreDelegate)]) {
        [self.delegate showMoreDelegate];
    }
}

#pragma mark - refresh
- (void) refreshWithObj:(JSONCouponObj *) obj
{
    __weak typeof(self) __weakSelf = self;
    
    if (IS_STR_EMPTY(obj.price)) {
        _priceLabel.hidden = YES;
        
        [_titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(__weakSelf.imageView.mas_bottom).offset(MARGIN_5);
        }];
    } else {
        _priceLabel.hidden = NO;
        [_titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(__weakSelf.priceLabel.mas_bottom).offset(MARGIN_10);
        }];
    }
    
    NSString *price = [NSString stringWithFormat:@"￥%@",obj.price];
    NSMutableAttributedString *attString = [[NSMutableAttributedString alloc] initWithString:price];
    [attString addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:20] range:NSMakeRange(1,obj.price.length)];
    _priceLabel.attributedText = attString;
    
    _titleLabel.text = obj.title;
    
    if (obj.state == 0) {
        _useButton.hidden = NO;
        _useImageView.hidden = YES;
        _imageView.image = imageNamed(@"coupon_line_red");
    } else if (obj.state == 1) {
        _useButton.hidden = YES;
        _useImageView.hidden = NO;
        _imageView.image = imageNamed(@"coupon_line_gray");
    } else if (obj.state == 2) {
        _useButton.hidden = YES;
        _useImageView.hidden = NO;
        _imageView.image = imageNamed(@"coupon_line_gray");
    }
    
    [self.couponMoreView refreshWithObj:obj];
    if (obj.isShowMore) {
        [self.couponMoreView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo([AJBCouponMoreView moreHeight:obj]);
        }];
    } else {
        [self.couponMoreView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo([AJBCouponMoreView defaultHeight:obj]);
        }];
    }
    
    _couponMoreView.backgroundColor = [UIColor whiteColor];
}

#pragma mark - height
+ (CGFloat)defaultHeight:(JSONCouponObj *)obj
{
    UIImage *image = imageNamed(@"coupon_line_gray");
    if (IS_STR_EMPTY(obj.price)) {
        return image.size.height + MARGIN_15 + 20 + MARGIN_10 + 1 + [AJBCouponMoreView defaultHeight:obj];
    } else {
        return image.size.height + MARGIN_15 + 40 + MARGIN_10 + 20 + MARGIN_10 + 1 + [AJBCouponMoreView defaultHeight:obj];
    }
}

+ (CGFloat)moreHeight:(JSONCouponObj *)obj
{
    UIImage *image = imageNamed(@"coupon_line_gray");
    if (IS_STR_EMPTY(obj.price)) {
        return image.size.height + MARGIN_15 + 20 + MARGIN_10 + 1 + [AJBCouponMoreView moreHeight:obj];
    } else {
        return image.size.height + MARGIN_15 + 40 + MARGIN_10 + 20 + MARGIN_10 + 1 + [AJBCouponMoreView moreHeight:obj];
    }
}

@end
