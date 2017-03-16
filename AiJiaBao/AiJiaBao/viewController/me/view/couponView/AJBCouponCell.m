//
//  AJBCouponCell.m
//  AiJiaBao
//
//  Created by nuhgroup on 2017/3/1.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "AJBCouponCell.h"
#import "AJBCouponView.h"

@interface AJBCouponCell ()<AJBCouponViewDelegate>

@property (nonatomic, strong) AJBCouponView *couponView;

@end

@implementation AJBCouponCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        __weak typeof(self) __weakSelf = self;
        [self addSubview:self.couponView];
        
        [self.couponView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(MARGIN_10);
            make.left.mas_equalTo(MARGIN_15);
            make.right.equalTo(__weakSelf.mas_right).offset(-MARGIN_15);
            make.height.mas_equalTo(0);
        }];
    }
    return self;
}

- (AJBCouponView *)couponView
{
    if (!_couponView) {
        self.couponView = [[AJBCouponView alloc] init];
        _couponView.delegate = self;
        _couponView.layer.cornerRadius = 3;
    }
    return _couponView;
}

+ (NSString *) reuseIdentifier
{
    return @"AJBCouponCell";
}

#pragma mark - delegate 
- (void)showMoreDelegate
{
    if ([self.delegate respondsToSelector:@selector(showCouponCellDelegate:)]) {
        [self.delegate showCouponCellDelegate:self];
    }
}

- (void) refreshWithObj:(JSONCouponObj *) obj
{
    [_couponView refreshWithObj:obj];
    if (obj.isShowMore) {
        [self.couponView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo([AJBCouponView moreHeight:obj]);
        }];
        
    } else {
        [self.couponView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo([AJBCouponView defaultHeight:obj]);
        }];
    }
    _couponView.backgroundColor = [UIColor whiteColor];
}

+ (CGFloat)defaultHeight:(JSONCouponObj *)obj
{
   return [AJBCouponView defaultHeight:obj] + MARGIN_10;
}

+ (CGFloat)moreHeight:(JSONCouponObj *)obj
{
   return [AJBCouponView moreHeight:obj] + MARGIN_10;
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
