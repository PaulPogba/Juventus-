//
//  AJBSearchFriendView.m
//  AiJiaBao
//
//  Created by nuhgroup on 2017/3/7.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "AJBSearchFriendView.h"
#import "AJBTablePlaceholderView.h"

@interface AJBSearchFriendView ()

@property (nonatomic, strong) UIView *backView;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *searchLabel;

@property (nonatomic, strong) AJBTablePlaceholderView *placeholderView;

@end


@implementation AJBSearchFriendView

- (instancetype)init
{
    if (self = [super init]) {
        
        __weak typeof(self) __weakSelf = self;
        
        UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
        UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:blur];
        [self addSubview:effectView];
        [effectView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.top.mas_equalTo(0);
            make.width.mas_equalTo(SCREEN_WIDTH);
            make.height.mas_equalTo(SCREEN_HEIGHT);
        }];
        
        [self addSubview:self.backView];
        [self.backView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(0);
            make.width.mas_equalTo(SCREEN_WIDTH);
            make.height.mas_equalTo(45);
        }];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onSearchAction:)];
        [_backView addGestureRecognizer:tap];
        
        [self.backView addSubview:self.imageView];
        CGSize imageSize = _imageView.image.size;
        [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(MARGIN_15);
            make.centerY.equalTo(__weakSelf.backView.mas_centerY);
            make.size.mas_equalTo(imageSize);
        }];
        
        [self.backView addSubview:self.searchLabel];
        [self.searchLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(__weakSelf.imageView.mas_right).offset(MARGIN_15);
            make.centerY.equalTo(__weakSelf.imageView.mas_centerY);
            make.width.mas_equalTo(SCREEN_WIDTH - imageSize.width - MARGIN_30 - MARGIN_15);
            make.height.mas_equalTo(MARGIN_30);
        }];
        
        [self addSubview:self.placeholderView];
        [self.placeholderView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(__weakSelf.mas_centerY);
            make.centerX.equalTo(__weakSelf.mas_centerX);
            make.width.mas_equalTo(100);
            make.height.mas_equalTo(100);
        }];
        
        _placeholderView.hidden = YES;
        _backView.hidden =  YES;
        
    }
    return self;
}


#pragma mark - getters and setters 
- (UIView *)backView
{
    if (!_backView) {
        self.backView = [[UIView alloc] init];
        _backView.backgroundColor = [UIColor whiteColor];
    }
    return _backView;
}

- (UIImageView *)imageView
{
    if (!_imageView) {
        self.imageView = [[UIImageView alloc] init];
        _imageView.image = imageNamed(@"homeA");
    }
    return _imageView;
}

- (UILabel *)searchLabel
{
    if (!_searchLabel) {
        self.searchLabel = [[UILabel alloc] init];
        _searchLabel.font = FONT_OF_SIZE_14;
        _searchLabel.textColor = COLOR_UI_333333;
    }
    return _searchLabel;
}


- (AJBTablePlaceholderView *)placeholderView
{
    if (!_placeholderView) {
        self.placeholderView = [[AJBTablePlaceholderView alloc] init];
    }
    return _placeholderView;
}

#pragma mark - refresh
- (void) refresh:(NSString *) title
{
    _backView.hidden = NO;
    NSString *string = [NSString stringWithFormat:@"搜索：%@",title];
    NSMutableAttributedString *attribute = [[NSMutableAttributedString alloc] initWithString:string];
    [attribute addAttribute:NSForegroundColorAttributeName value:COLOR_UI_00cb8e range:NSMakeRange(3,string.length - 3)];
    _searchLabel.attributedText = attribute;
}


- (void) hiddenPlaceholderView:(BOOL) hidden
{
    self.placeholderView.hidden = hidden;
}


- (void) onSearchAction:(id) sender
{
    if ([self.delegate respondsToSelector:@selector(onSearchAction)]) {
        [self.delegate onSearchAction];
    }
}


@end













