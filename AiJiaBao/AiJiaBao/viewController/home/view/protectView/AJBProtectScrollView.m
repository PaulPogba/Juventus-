//
//  AJBProtectScrollView.m
//  AiJiaBao
//
//  Created by nuhgroup on 2017/3/3.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "AJBProtectScrollView.h"
#import "AJBProtectingView.h"

#define COLLECTIONVIEW_HEIGHT 100
#define SELECT_TABBAR_HEIGHT 40

@interface AJBProtectScrollView ()<UIScrollViewDelegate>

@property (nonatomic, strong) AJBProtectingView *protectingView;
@property (nonatomic, strong) AJBProtectingView *protectView;
@property (nonatomic, strong) AJBProtectingView *failureView;
@property (nonatomic, strong) AJBProtectingView *allProtectView;


@end

@implementation AJBProtectScrollView

- (instancetype)init
{
    if (self = [super init]) {
        
        __weak typeof(self) __weakSelf = self;
        
        [self addSubview:self.scrollView];
        [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.left.mas_equalTo(0);
            make.width.equalTo(__weakSelf.mas_width);
            make.height.equalTo(__weakSelf.mas_height);
        }];
        
        [self.scrollView addSubview:self.protectingView];
        [self.protectingView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.left.mas_equalTo(0);
            make.width.equalTo(__weakSelf.mas_width);
            make.height.equalTo(__weakSelf.mas_height);
        }];
        
        [self.scrollView addSubview:self.protectView];
        [self.protectView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.left.mas_equalTo(SCREEN_WIDTH);
            make.width.equalTo(__weakSelf.mas_width);
            make.height.equalTo(__weakSelf.mas_height);
        }];

        
        [self.scrollView addSubview:self.failureView];
        [self.failureView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.left.mas_equalTo(SCREEN_WIDTH*2);
            make.width.equalTo(__weakSelf.mas_width);
            make.height.equalTo(__weakSelf.mas_height);
        }];
        
        [self.scrollView addSubview:self.allProtectView];
        [self.allProtectView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.left.mas_equalTo(SCREEN_WIDTH*3);
            make.width.equalTo(__weakSelf.mas_width);
            make.height.equalTo(__weakSelf.mas_height);
        }];
    }
    return self;
}

#pragma mark - getters and setters
- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        self.scrollView = [[UIScrollView alloc] init];
        _scrollView.contentSize = CGSizeMake(SCREEN_WIDTH *4,SCREEN_HEIGHT - COLLECTIONVIEW_HEIGHT - NAVITETION_HEIGHT - SELECT_TABBAR_HEIGHT - MARGIN_30);
        _scrollView.backgroundColor = COLOR_UI_RANDOM;
        _scrollView.pagingEnabled = YES;
        _scrollView.delegate = self;
        _scrollView.showsHorizontalScrollIndicator = NO;
    }
    return _scrollView;
}

- (AJBProtectingView *)protectingView
{
    if (!_protectingView) {
        self.protectingView = [[AJBProtectingView alloc] init];
    }
    return _protectingView;
}

- (AJBProtectingView *)protectView
{
    if (!_protectView) {
        self.protectView = [[AJBProtectingView alloc] init];
    }
    return _protectView;
}

- (AJBProtectingView *)failureView
{
    if (!_failureView) {
        self.failureView = [[AJBProtectingView alloc] init];
    }
    return _failureView;
}

- (AJBProtectingView *)allProtectView
{
    if (!_allProtectView) {
        self.allProtectView = [[AJBProtectingView alloc] init];
    }
    return _allProtectView;
}

#pragma mark - scrollview delegate
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger index = scrollView.contentOffset.x/SCREEN_WIDTH;
    
    if ([self.delegate respondsToSelector:@selector(scrollDelegateToIndex:)]) {
        [self.delegate scrollDelegateToIndex:index];
    }
}

- (void) scrollToInex:(NSInteger) index
{
    __weak typeof(self) _weakSelf = self;
    [UIView animateWithDuration:0.3 animations:^{
        _weakSelf.scrollView.contentOffset = CGPointMake(SCREEN_WIDTH * index, 0);
    }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
