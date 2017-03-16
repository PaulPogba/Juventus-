//
//  AJBProtectScrollView.h
//  AiJiaBao
//
//  Created by nuhgroup on 2017/3/3.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AJBProtectScrollViewDelegate <NSObject>

- (void) scrollDelegateToIndex:(NSInteger) index;

@end

@interface AJBProtectScrollView : UIView

@property (nonatomic, assign) id<AJBProtectScrollViewDelegate> delegate;
@property (nonatomic, strong) UIScrollView *scrollView;

- (void) scrollToInex:(NSInteger) index;

@end
