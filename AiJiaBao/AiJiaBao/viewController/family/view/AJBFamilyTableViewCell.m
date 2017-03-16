//
//  AJBFamilyTableViewCell.m
//  AiJiaBao
//
//  Created by 医麦思 on 2017/2/24.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "AJBFamilyTableViewCell.h"
#import "LXWaveProgressView.h"
#define  TransverseLineColor [UIColor colorWithRed:91.0/255.0 green:196.0/255.0 blue:243.0/255.0 alpha:1]
@interface AJBFamilyTableViewCell ()

@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UIImageView *verticalLineUpImgV;
@property (nonatomic, strong) UIImageView *verticalLineDownImgV;
@property (nonatomic, strong) UIView *transverseLineLeftV;
@property (nonatomic, strong) UIView *transverseLineRightV;



@end

@implementation AJBFamilyTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        
        [self addSubview:self.iconImageView];
        [self addSubview:self.progressView];
        [self addSubview:self.verticalLineUpImgV];
        [self addSubview:self.verticalLineDownImgV];
        [self addSubview:self.transverseLineLeftV];
        [self addSubview:self.transverseLineRightV];
        [self addSubview:self.peachImageV];
        [self addSubview:self.nameL];
        [self addSubview:self.numPage];
        [self addSubview:self.safeguardNum];
        [self loadSubLayerOut];
    }
    return self;
}

- (void)loadSubLayerOut{
    
    __weak typeof(self) __weakSelf = self;
    
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(__weakSelf);
        make.right.equalTo(__weakSelf).with.offset(-20);
        make.size.mas_equalTo(CGSizeMake(80, 80));
    }];
    
    [self.verticalLineUpImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(__weakSelf);
        make.centerX.equalTo(__weakSelf);
        make.size.mas_equalTo(CGSizeMake(5, 100));
    }];

    [self.transverseLineLeftV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(__weakSelf.iconImageView.mas_centerY);
        make.right.equalTo(__weakSelf.verticalLineUpImgV.mas_left).with.offset(-3);
        make.size.mas_equalTo(CGSizeMake(35, 3));
    }];
    [self.transverseLineRightV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(__weakSelf.iconImageView.mas_centerY);
        make.left.equalTo(__weakSelf.verticalLineUpImgV.mas_right).with.offset(3);
        make.size.mas_equalTo(CGSizeMake(50, 3));
    }];
    

    [self.nameL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_verticalLineUpImgV.mas_right).with.offset(5);
        make.bottom.mas_equalTo(_transverseLineRightV.mas_top);
        make.size.mas_equalTo(CGSizeMake(100, 20));
        
        
    }];
    [self.numPage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_verticalLineUpImgV.mas_right).with.offset(5);
        make.top.mas_equalTo(_transverseLineRightV.mas_bottom).with.offset(5);
        make.size.mas_equalTo(CGSizeMake(100, 15));
    }];
    [self.safeguardNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_verticalLineUpImgV.mas_right).with.offset(5);
        make.top.mas_equalTo(_numPage.mas_bottom).with.offset(3);
        make.size.mas_equalTo(CGSizeMake(100, 15));
    }];

}


- (void)setFamilyListM:(familyListModel *)familyListM{
    if (_familyListM != familyListM) {
        _familyListM.servFamilyMemberId = @"1";
        
        NSString *numPageText = @"有效保单0份";
        NSString *safeguardNumText = @"保障6021万";
        NSMutableAttributedString *numPageAtr = [[NSMutableAttributedString alloc]initWithString:numPageText];
        NSMutableAttributedString *safeguardNumAtr = [[NSMutableAttributedString alloc]initWithString:safeguardNumText];
        //设置：在0-3个单位长度内的内容显示成红色
        [numPageAtr addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0, 4)];
        [numPageAtr addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(numPageText.length-2, 1)];
        _numPage.attributedText = numPageAtr;
        
        [safeguardNumAtr addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0, 2)];
        [safeguardNumAtr addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(safeguardNumAtr.length-2, 1)];
        _numPage.attributedText = numPageAtr;
        _safeguardNum.attributedText = safeguardNumAtr;
        _nameL.text = @"灰原哀(本人)";

        
    }
}

#pragma getter&setter
- (UIImageView *)iconImageView
{
    if (!_iconImageView) {
        self.iconImageView = [[UIImageView alloc] init];
        self.iconImageView.layer.cornerRadius = 40;
        self.iconImageView.clipsToBounds = YES;
        
    }
    return _iconImageView;
}
-(LXWaveProgressView *)progressView{
    if (!_progressView) {
        _progressView =[[LXWaveProgressView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/5, 15, 50, 50)];
        _progressView.firstWaveColor = [UIColor colorWithRed:134/255.0 green:116/255.0 blue:210/255.0 alpha:1];
        _progressView.secondWaveColor = [UIColor colorWithRed:134/255.0 green:116/255.0 blue:210/255.0 alpha:0.5];
//        _progressView.hidden = YES;
    }
    return _progressView;
}
- (UIImageView *)peachImageV
{
    if (!_peachImageV) {
        self.peachImageV = [[UIImageView alloc] init];
        self.peachImageV.frame = _progressView.frame;
        self.peachImageV.image = imageNamed(@"Like");
        self.peachImageV.layer.cornerRadius = 25;
        self.peachImageV.clipsToBounds = YES;
        self.peachImageV.layer.borderColor = FamilyDefaultTextColoe.CGColor;
        self.peachImageV.layer.borderWidth = 1.0f;
        self.peachImageV.hidden = YES;
        
    }
    return _peachImageV;
}



- (UIImageView *)verticalLineUpImgV
{
    if (!_verticalLineUpImgV) {
        self.verticalLineUpImgV = [[UIImageView alloc] init];
        self.verticalLineUpImgV.image = imageNamed(@"icon_family");
        
    }
    return _verticalLineUpImgV;
}
- (UIImageView *)verticalLineDownImgV
{
    if (!_verticalLineDownImgV) {
        self.verticalLineDownImgV = [[UIImageView alloc] init];
        
    }
    return _verticalLineDownImgV;
}

- (UIView *)transverseLineLeftV{
    if (!_transverseLineLeftV) {
        self.transverseLineLeftV = [UIView new];
        self.transverseLineLeftV.backgroundColor = TransverseLineColor;
        self.transverseLineLeftV.layer.cornerRadius = 1.5;
        self.transverseLineLeftV.clipsToBounds = YES;
        
    }
    return _transverseLineLeftV;
}
- (UIView *)transverseLineRightV{
    if (!_transverseLineRightV) {
        self.transverseLineRightV = [UIView new];
        self.transverseLineRightV.backgroundColor = TransverseLineColor;
        self.transverseLineRightV.layer.cornerRadius = 1.5;
        self.transverseLineRightV.clipsToBounds = YES;
    }
    return _transverseLineRightV;
}

- (UILabel *)nameL{
    if (!_nameL) {
        _nameL = [UILabel new];
        _nameL.text = @"灰原哀(本人)";
        _nameL.textColor = [UIColor blackColor];
        _nameL.font = [UIFont systemFontOfSize:13];
        _nameL.textAlignment = NSTextAlignmentLeft;
    }
    return _nameL;
}


- (UILabel *)numPage{
    if (!_numPage) {
        _numPage = [UILabel new];
        _numPage.text = @"有效保单0份";
        _numPage.textColor = FamilyDefaultTextColoe;
        _numPage.font = [UIFont systemFontOfSize:11];
        _numPage.textAlignment = NSTextAlignmentLeft;
///后期直接拉到Model的setter
        NSString *numPageText = @"有效保单0份";
        NSMutableAttributedString *numPageAtr = [[NSMutableAttributedString alloc]initWithString:numPageText];
        [numPageAtr addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0, 4)];
        [numPageAtr addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(numPageText.length-1, 1)];
        _numPage.attributedText = numPageAtr;

    }
    return _numPage;
}


- (UILabel *)safeguardNum{
    if (!_safeguardNum) {
        _safeguardNum = [UILabel new];
        _safeguardNum.text = @"保障6021万";
        _safeguardNum.textColor = FamilyDefaultTextColoe;
        _safeguardNum.font = [UIFont systemFontOfSize:11];
        _safeguardNum.textAlignment = NSTextAlignmentLeft;
///后期直接拉到Model的setter
        NSString *safeguardNumText = @"保障6021万";
        NSMutableAttributedString *safeguardNumAtr = [[NSMutableAttributedString alloc]initWithString:safeguardNumText];
        [safeguardNumAtr addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0, 2)];
        [safeguardNumAtr addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(safeguardNumAtr.length-1, 1)];
        _safeguardNum.attributedText = safeguardNumAtr;
    }
    return _safeguardNum
    ;
}


#pragma mark - refresh
- (void) refreshWithIcon:(NSString *)image
{
    self.iconImageView.image = imageNamed(image);
}

#pragma mark - reuseIdentifier
+ (NSString *) reuseIdentifierStr
{
    return @"AJBFamilyTableViewCell";
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
