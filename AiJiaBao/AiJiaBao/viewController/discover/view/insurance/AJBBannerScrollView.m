//
//  AJBBannerScrollView.m
//  AiJiaBao
//
//  Created by nuhgroup on 2017/3/12.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "AJBBannerScrollView.h"

@interface AJBBannerScrollView ()<UIScrollViewDelegate>

@property (nonatomic, strong) UIPageControl *pageControl;

@property(nonatomic,strong)NSTimer *time;

@property (nonatomic, strong) NSArray *imageArr;

@end

@implementation AJBBannerScrollView

- (instancetype)init
{
    if (self = [super init]) {

        __weak typeof(self) __weakSelf = self;
        [self addSubview:self.scrollView];
        [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(0);
            make.width.equalTo(__weakSelf.mas_width);
            make.height.equalTo(__weakSelf.mas_height);
        }];
        
        
        [self addSubview:self.pageControl];
        [self.pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.bottom.equalTo(__weakSelf.mas_bottom).offset(-MARGIN_10);
            make.width.mas_equalTo(SCREEN_WIDTH);
            make.height.mas_equalTo(MARGIN_15);
        }];
    }
    return self;
}

#pragma mark - getters and setters 
- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        self.scrollView = [[UIScrollView alloc] init];
        _scrollView.pagingEnabled = YES;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.delegate = self;
        _scrollView.contentOffset = CGPointMake(SCREEN_WIDTH, 0) ;
    }
    return _scrollView;
}



- (UIPageControl *)pageControl
{
    if (!_pageControl) {
        self.pageControl = [[UIPageControl alloc] init];
        _pageControl.currentPageIndicatorTintColor = [UIColor redColor];
        _pageControl.pageIndicatorTintColor = [UIColor blackColor];

    }
    return _pageControl;
}

- (void)setImagesWithArray:(NSArray *)array {
    
    self.imageArr = array;
    
    _scrollView.contentSize = CGSizeMake(SCREEN_WIDTH * (self.imageArr.count +2), self.height);
    _pageControl.numberOfPages = 4;
    _pageControl.currentPage = 0;

    __weak typeof(self) __weakSelf = self;
    //图片
    for (int i = 0; i <self.imageArr.count+2; i++) {
        
        AJBSDWebImageView *imageView = [[AJBSDWebImageView alloc]init];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        
        imageView.layer.masksToBounds = YES;
        
        if (i == 0) {
            //网络图片
            [imageView setImageURL:self.imageArr.lastObject];
        }else if (i == _imageArr.count+1){
            
            [imageView setImageURL:self.imageArr.firstObject];
        }else{
            [imageView setImageURL:[self.imageArr objectAtIndex:i-1 ]];
        }
        [self.scrollView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(SCREEN_WIDTH *i);
            make.top.mas_equalTo(0);
            make.width.mas_equalTo(SCREEN_WIDTH);
            make.height.equalTo(__weakSelf.mas_height);
        }];
    }
    
    //点击手势
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dianjiTapAction:)];
    tap.numberOfTapsRequired=1;
    tap.numberOfTouchesRequired=1;
    [self.scrollView addGestureRecognizer:tap];
    
    //定时器
    self.time = [NSTimer scheduledTimerWithTimeInterval:4 target:self selector:@selector(scrollTimer) userInfo:nil repeats:YES];

}

//点击方法
-(void)dianjiTapAction:(UITapGestureRecognizer *)tap{
    
    if ([self.delegate respondsToSelector:@selector(lunboScrollViewDelegate:didSelectIndex:)]) {
        [self.delegate lunboScrollViewDelegate:self didSelectIndex:self.pageControl.currentPage];
    }
}

//page方法
-(void)pageCtrlAction:(UIPageControl *)page{
    
    //如有需要自己填写
}
//定时器方法
-(void)scrollTimer{
    [self.scrollView setContentOffset:CGPointMake(self.scrollView.contentOffset.x + SCREEN_WIDTH, 0) animated:YES];
}

//2.滑动视图时,滑动时调用(实时调用)
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    if (self.scrollView.contentOffset.x == 0) {
        self.scrollView.contentOffset = CGPointMake(self.imageArr.count * SCREEN_WIDTH , 0);
    }
    if (self.scrollView.contentOffset.x == self.scrollView.contentSize.width - SCREEN_WIDTH) {
        self.scrollView.contentOffset = CGPointMake(SCREEN_WIDTH , 0);
    }
    
 _pageControl.currentPage = (self.scrollView.contentOffset.x-SCREEN_WIDTH)/SCREEN_WIDTH;
    
}

//已经结束减速
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSLog(@"已经结束减速");
    if (self.time == nil) {
        self.time = [NSTimer scheduledTimerWithTimeInterval:4 target:self selector:@selector(scrollTimer) userInfo:nil repeats:YES];
    }
}
//改变偏移量的时候调用
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
}
//手指将要开始拖拽
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    NSLog(@"手指将要开始拖拽");
    
    [self.time invalidate];
    self.time = nil;
    
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
}
-(void)dealloc{
    [self.time invalidate];
}

@end
