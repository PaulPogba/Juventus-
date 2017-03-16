//
//  AJBInsuranceCell.m
//  AiJiaBao
//
//  Created by nuhgroup on 2017/3/12.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "AJBInsuranceCell.h"
#import "AJBInsuranceTagView.h"
#import "AJBInsuranceDetailView.h"
#import "AJBInsurancePriceView.h"
#import "AJBBaseMarginView.h"

@interface AJBInsuranceCell ()

@property (nonatomic, strong) UILabel *insuranceNameLabel;
@property (nonatomic, strong) UIImageView *insuranceIconImageView;

@property (nonatomic, strong) AJBInsuranceTagView *tagView;
@property (nonatomic, strong) AJBInsuranceDetailView *detailView;
@property (nonatomic, strong) AJBInsurancePriceView *priceView;

@property (nonatomic, strong) AJBBaseMarginView *marginView;

@end

@implementation AJBInsuranceCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        __weak typeof(self) __weakSelf = self;
        
        [self addSubview:self.insuranceIconImageView];
        [self.insuranceIconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(__weakSelf.mas_right).offset(-MARGIN_15);
            make.top.mas_equalTo(MARGIN_15);
            make.width.mas_equalTo(MARGIN_40);
            make.height.mas_equalTo(MARGIN_20);
        }];
        
        [self addSubview:self.insuranceNameLabel];
        [self.insuranceNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(MARGIN_15);
            make.top.mas_equalTo(MARGIN_15);
            make.right.equalTo(__weakSelf.insuranceIconImageView.mas_left).offset(-MARGIN_15);
            make.height.mas_equalTo(MARGIN_20);
        }];
        
        [self addSubview:self.tagView];
        [self.tagView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.top.equalTo(__weakSelf.insuranceNameLabel.mas_bottom);
            make.width.mas_equalTo(SCREEN_WIDTH);
            make.height.mas_equalTo(50);
        }];
        
        [self addSubview:self.detailView];
        [self.detailView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(__weakSelf.tagView.mas_bottom);
            make.left.mas_equalTo(0);
            make.width.mas_equalTo(SCREEN_WIDTH);
            make.height.mas_equalTo(0);
        }];
        
        [self addSubview:self.priceView];
        [self.priceView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.width.mas_equalTo(SCREEN_WIDTH);
            make.height.mas_equalTo(45);
        }];
        
        [self addSubview:self.marginView];
        [self.marginView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.width.mas_equalTo(SCREEN_WIDTH);
            make.bottom.equalTo(__weakSelf.mas_bottom);
            make.height.mas_equalTo(MARGIN_20);
        }];
        
    }
    return self;
}


+ (NSString *) reuseIdentifier
{
    return @"AJBInsuranceCell";
}


#pragma mark - getters and setters 
- (UILabel *)insuranceNameLabel
{
    if (!_insuranceNameLabel) {
        self.insuranceNameLabel = [[UILabel alloc] init];
        _insuranceNameLabel.font = FONT_OF_SIZE_15;
        _insuranceNameLabel.textColor = COLOR_UI_333333;
        _insuranceNameLabel.backgroundColor = COLOR_UI_RANDOM;
    }
    return _insuranceNameLabel;
}

- (UIImageView *) insuranceIconImageView
{
    if (!_insuranceIconImageView) {
        self.insuranceIconImageView = [[UIImageView alloc] init];
        _insuranceIconImageView.backgroundColor = COLOR_UI_RANDOM;
    }
    return _insuranceIconImageView;
}


- (AJBInsuranceTagView *)tagView
{
    if (!_tagView) {
        self.tagView = [[AJBInsuranceTagView alloc] init];
    }
    return _tagView;
}

- (AJBInsuranceDetailView *)detailView
{
    if (!_detailView) {
        self.detailView = [[AJBInsuranceDetailView alloc] init];
    }
    return _detailView;
}

- (AJBInsurancePriceView *)priceView
{
    if (!_priceView) {
        self.priceView = [[AJBInsurancePriceView alloc] init];
    }
    return _priceView;
}

- (AJBBaseMarginView *)marginView
{
    if (!_marginView) {
        self.marginView = [[AJBBaseMarginView alloc] init];
    }
    return _marginView;
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
