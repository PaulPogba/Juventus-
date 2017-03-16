//
//  AJBInviteViewController.m
//  AiJiaBao
//
//  Created by nuhgroup on 2017/3/9.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "AJBInviteViewController.h"
#import "AJBQRCode.h"
#import "AJBShareSheetView.h"

@interface AJBInviteViewController ()

@property (nonatomic, strong) UIImageView *qrCodeImageView;
@property (nonatomic, strong) AJBSDWebImageView *headImage;
@property (nonatomic, strong) UIButton *reTitleLabel;


@property (nonatomic, strong) UIView *shareView;
@property (nonatomic, strong) UILabel *shareTitleLabel;
@property (nonatomic, strong) UILabel *shareDetailLabel;
@property (nonatomic, strong) UIImageView *arrowImage;
@property (nonatomic, strong) UIButton *tapButton;

@end

@implementation AJBInviteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    __weak typeof(self) __weakSelf = self;
    self.view.backgroundColor = COLOR_UI_f1f1f1;
    
    [self setTitleText:@"邀请有礼"];
    
    [self.view addSubview:self.qrCodeImageView];
    [self.qrCodeImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(NAVITETION_HEIGHT + MARGIN_40);
        make.left.mas_equalTo(80);
        make.right.equalTo(__weakSelf.view.mas_right).offset(-80);
        make.centerX.equalTo(__weakSelf.view.mas_centerX);
        make.height.equalTo(__weakSelf.qrCodeImageView.mas_width);
    }];
    _qrCodeImageView.image = [AJBQRCode generateWithLogoQRCodeData:@"https://github.com/kingsic"];
    
    [self.view addSubview:self.headImage];
    [self.headImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(__weakSelf.qrCodeImageView.mas_centerX);
        make.centerY.equalTo(__weakSelf.qrCodeImageView.mas_centerY);
        make.height.width.mas_equalTo(50);
    }];
    
    [self.view addSubview:self.reTitleLabel];
    [self.reTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(__weakSelf.qrCodeImageView.mas_bottom).offset(MARGIN_10);
        make.centerX.equalTo(__weakSelf.view.mas_centerX);
        make.height.mas_equalTo(MARGIN_25);
        make.width.equalTo(__weakSelf.qrCodeImageView.mas_width);
    }];
    [_reTitleLabel setIconInRightWithSpacing:MARGIN_5];
    
    [self.view addSubview:self.shareView];
    [self.shareView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(__weakSelf.reTitleLabel.mas_bottom).offset(MARGIN_40);
        make.left.mas_equalTo(0);
        make.width.mas_equalTo(SCREEN_WIDTH);
        make.height.mas_equalTo(50);
    }];
    
    [self.shareView addSubview:self.shareTitleLabel];
    [self.shareTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(MARGIN_15);
        make.width.mas_equalTo(80);
        make.height.equalTo(__weakSelf.shareView.mas_height);
    }];
    
    [self.shareView addSubview:self.arrowImage];
    [self.arrowImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(__weakSelf.shareView.mas_right).offset(-MARGIN_15);
        make.centerY.equalTo(__weakSelf.shareView.mas_centerY);
        make.size.mas_equalTo(__weakSelf.arrowImage.image.size);
    }];
    
    
    [self.shareView addSubview:self.shareDetailLabel];
    [self.shareDetailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(__weakSelf.arrowImage.mas_right).offset(-MARGIN_15);
        make.centerY.equalTo(__weakSelf.shareView.mas_centerY);
        make.width.mas_equalTo(200);
        make.height.equalTo(__weakSelf.shareView.mas_height);
    }];
    
    [self.shareView addSubview:self.tapButton];
    [self.tapButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(0);
        make.width.mas_equalTo(SCREEN_WIDTH);
        make.height.mas_equalTo(50);
    }];
}



#pragma mark - getters and setters 
- (UIImageView *)qrCodeImageView
{
    if (!_qrCodeImageView) {
        self.qrCodeImageView = [[UIImageView alloc] init];
    }
    return _qrCodeImageView;
}

- (AJBSDWebImageView *)headImage
{
    if (!_headImage) {
        self.headImage = [[AJBSDWebImageView alloc] init];
        _headImage.layer.cornerRadius = 5;
        _headImage.layer.borderColor = [UIColor whiteColor].CGColor;
        _headImage.layer.borderWidth = 2;
    }
    return _headImage;
}

- (UIButton *)reTitleLabel
{
    if (!_reTitleLabel) {
        self.reTitleLabel = [[UIButton alloc] init];
        [_reTitleLabel setImage:imageNamed(@"homeA") forState:UIControlStateNormal];
        [_reTitleLabel setTitle:@"好友扫一扫，同赢注册礼" forState:UIControlStateNormal];
        [_reTitleLabel setTitleColor:COLOR_UI_333333 forState:UIControlStateNormal];
        _reTitleLabel.titleLabel.font = FONT_OF_SIZE_14;
    }
    return _reTitleLabel;
}

- (UIView *)shareView
{
    if (!_shareView) {
        self.shareView = [[UIView alloc] init];
        _shareView.backgroundColor = [UIColor whiteColor];
    }
    return _shareView;
}

- (UILabel *)shareTitleLabel
{
    if (!_shareTitleLabel) {
        self.shareTitleLabel = [[UILabel alloc] init];
        _shareTitleLabel.font = FONT_OF_SIZE_15;
        _shareTitleLabel.textColor = COLOR_UI_333333;
        _shareTitleLabel.text = @"邀请好友";
    }
    return _shareTitleLabel;
}

- (UILabel *)shareDetailLabel
{
    if (!_shareDetailLabel) {
        self.shareDetailLabel = [[UILabel alloc] init];
        _shareDetailLabel.font = FONT_OF_SIZE_13;
        _shareDetailLabel.textColor = COLOR_UI_dddddd;
        _shareDetailLabel.textAlignment = NSTextAlignmentRight;
        _shareDetailLabel.text = @"分享好友注册，领积分奖励";
    }
    return _shareDetailLabel;
}

- (UIImageView *)arrowImage
{
    if (!_arrowImage) {
        self.arrowImage = [[UIImageView alloc] init];
        _arrowImage.image = imageNamed(@"icon_arrow2");
        _arrowImage.backgroundColor = COLOR_UI_RANDOM;
    }
    return _arrowImage;
}

- (UIButton *)tapButton
{
    if (!_tapButton) {
        self.tapButton = [[UIButton alloc] init];
        [_tapButton addTarget:self action:@selector(onTap) forControlEvents:UIControlEventTouchUpInside];
    }
    return _tapButton;
}


#pragma mark - action

- (void) onTap
{
    [[AJBShareSheetView shareArticleTitle:@"" desc:@"" icon:@"" url:@""] show];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
