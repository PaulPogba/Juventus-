//
//  AJBIntegralHeadView.m
//  AiJiaBao
//
//  Created by nuhgroup on 2017/3/8.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "AJBIntegralHeadView.h"

@interface AJBIntegralHeadView ()

@property (nonatomic, strong) UILabel *integralLabel;

@property (nonatomic, strong) UIButton *detailButton;
@property (nonatomic, strong) UIButton *convertButton;
@property (nonatomic, strong) UIView *marginLine;
@property (nonatomic, strong) UIView *bottomView;

@end

@implementation AJBIntegralHeadView


- (instancetype)init
{
    if (self = [super init]) {
        self.backgroundColor = COLOR_UI_54C1F5;
        
        __weak typeof(self) __weakSelf = self;
        [self addSubview:self.integralLabel];
        [self.integralLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.top.mas_equalTo(MARGIN_10);
            make.width.mas_equalTo(SCREEN_WIDTH);
            make.height.mas_equalTo(MARGIN_40);
        }];
        
        [self addSubview:self.bottomView];
        [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.bottom.equalTo(__weakSelf.mas_bottom);
            make.width.mas_equalTo(SCREEN_WIDTH);
            make.height.mas_equalTo(MARGIN_10);
        }];
        
        [self addSubview:self.detailButton];
        [self.detailButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.bottom.equalTo(__weakSelf.bottomView.mas_top);
            make.width.mas_equalTo(SCREEN_WIDTH/2);
            make.height.mas_equalTo(MARGIN_40);
        }];
        
        [self addSubview:self.convertButton];
        [self.convertButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(__weakSelf.detailButton.mas_right);
            make.bottom.equalTo(__weakSelf.bottomView.mas_top);
            make.width.mas_equalTo(SCREEN_WIDTH/2);
            make.height.mas_equalTo(MARGIN_40);
        }];
        
        [self addSubview:self.marginLine];
        [self.marginLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(__weakSelf.detailButton.mas_right);
            make.bottom.equalTo(__weakSelf.convertButton.mas_bottom);
            make.top.equalTo(__weakSelf.convertButton.mas_top);
            make.width.mas_equalTo(1);
        }];
    }
    return self;
}


#pragma mark - getters and setters
- (UILabel *)integralLabel
{
    if (!_integralLabel) {
        self.integralLabel = [[UILabel alloc] init];
        _integralLabel.font = FONT_OF_SIZE_13;
        _integralLabel.textColor = [UIColor whiteColor];
        _integralLabel.textAlignment = NSTextAlignmentCenter;
        
    }
    return _integralLabel;
}

- (UIButton *)detailButton
{
    if (!_detailButton) {
        self.detailButton = [[UIButton alloc] init];
        [_detailButton setImage:imageNamed(@"homeA") forState:UIControlStateNormal];
        [_detailButton setTitle:@"积分明细" forState:UIControlStateNormal];
        [_detailButton setTitleColor:COLOR_UI_333333 forState:UIControlStateNormal];
        [_detailButton setIconInLeftWithSpacing:MARGIN_5];
        _detailButton.backgroundColor = [UIColor whiteColor];
        _detailButton.titleLabel.font = FONT_OF_SIZE_14;
    }
    return _detailButton;
}

- (UIButton *)convertButton
{
    if (!_convertButton) {
        self.convertButton = [[UIButton alloc] init];
        [_convertButton setImage:imageNamed(@"homeA") forState:UIControlStateNormal];
        [_convertButton setTitle:@"兑换记录" forState:UIControlStateNormal];
        [_convertButton setTitleColor:COLOR_UI_333333 forState:UIControlStateNormal];
        [_convertButton setIconInLeftWithSpacing:MARGIN_5];
        _convertButton.backgroundColor = [UIColor whiteColor];
        _convertButton.titleLabel.font = FONT_OF_SIZE_14;
    }
    return _convertButton;
}


- (UIView *)marginLine
{
    if (!_marginLine) {
        self.marginLine = [[UIView alloc] init];
        _marginLine.backgroundColor = COLOR_UI_f1f1f1;
    }
    return _marginLine;
}

- (UIView *)bottomView
{
    if (!_bottomView) {
        self.bottomView = [[UIView alloc] init];
        _bottomView.backgroundColor = COLOR_UI_f1f1f1;
    }
    return _bottomView;
}

- (void) refreshWithIntegral:(NSString *) integral
{
    NSString *string = [NSString stringWithFormat:@"%@分",integral];
    NSMutableAttributedString *attribute = [[NSMutableAttributedString alloc] initWithString:string];
    [attribute addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:40] range:NSMakeRange(0,integral.length)];
    _integralLabel.attributedText = attribute;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
