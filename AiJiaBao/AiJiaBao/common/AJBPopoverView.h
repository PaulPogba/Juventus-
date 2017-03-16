//
//  AJBPopoverView.h
//  AiJiaBao
//
//  Created by nuhgroup on 2017/3/9.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AJBPopoverView : UIView

@property (nonatomic, strong) NSArray *options;
@property (nonatomic, strong) UIControl *overlayView;

@property (copy, nonatomic) void (^action)(NSInteger idx);

- (id)initWithOptions:(NSArray *) options action: (void (^)(NSInteger idx)) action;

- (void) show;
- (void) dismiss;
- (void) fadeOut;
- (void) fadeIn;

- (void) createOverlay;
- (void) createVisiableViews;
- (void) createOptionButtons;
- (void)actionClick:(UIButton *)sender;



@end
