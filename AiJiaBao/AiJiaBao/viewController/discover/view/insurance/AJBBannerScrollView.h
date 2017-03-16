//
//  AJBBannerScrollView.h
//  AiJiaBao
//
//  Created by nuhgroup on 2017/3/12.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AJBBannerScrollView;

@protocol AJBBannerScrollViewDelegate <NSObject>

//选中第几个轮播图片
-(void)lunboScrollViewDelegate:(AJBBannerScrollView *)lunboView didSelectIndex:(NSInteger)index;

@end


@interface AJBBannerScrollView : UIView<UIScrollViewDelegate>

@property(nonatomic,strong)UIScrollView *scrollView;


@property (nonatomic, weak) id<AJBBannerScrollViewDelegate> delegate;

- (void) setImagesWithArray:(NSArray *) array;

@end
