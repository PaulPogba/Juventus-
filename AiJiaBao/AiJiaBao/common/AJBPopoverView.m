//
//  AJBPopoverView.m
//  AiJiaBao
//
//  Created by nuhgroup on 2017/3/9.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "AJBPopoverView.h"
#define BTNTAG 444

@interface AJBPopoverView ()

@property (nonatomic, assign) BOOL visiableViewCreated;

@end

@implementation AJBPopoverView

- (id)initWithOptions:(NSArray *) options action: (void (^)(NSInteger idx)) action
{
    self = [super init];
    if (self)
    {
        self.backgroundColor = [UIColor whiteColor];
        _action = action;
        self.options = options;
        
        [self createOverlay];
    }
    return self;
}

- (void) createVisiableViews
{
    self.visiableViewCreated = YES;
        CGFloat height =  170;
        self.frame = CGRectMake(0,_overlayView.size.height - height,SCREEN_WIDTH, height);
    [self createOptionButtons];
}

- (void) createOptionButtons
{
    
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0,MARGIN_15,SCREEN_WIDTH,MARGIN_15)];
    title.text = @"分享到";
    title.font = FONT_OF_SIZE_14;
    title.textAlignment = NSTextAlignmentCenter;
    title.textColor = COLOR_UI_333333;
    [self addSubview:title];
    
        NSArray *images = nil;
        CGFloat btnWidth = SCREEN_WIDTH/(_options.count-1);
        CGFloat btnHeight = 80;
        images = @[@"homeA",@"homeA",@"homeA",@"homeA",@""];
    
        for (int i = 0; i<_options.count; i++)
        {
            
            UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(i*btnWidth,MARGIN_40+MARGIN_10,btnWidth, btnHeight)];
            button.tag = i + BTNTAG;
            button.titleLabel.font = FONT_OF_SIZE_12;
            [button addTarget:self action:@selector(actionClick:) forControlEvents:UIControlEventTouchUpInside];
            [button setTitle:[_options objectAtIndex:i] forState:UIControlStateNormal];
            [button setTitleColor:COLOR_UI_333333 forState:UIControlStateNormal];
            [button setImage:imageNamed([images objectAtIndex:i]) forState:UIControlStateNormal];
            
            if (i == _options.count - 1) {
                UILabel *line = [[UILabel alloc] initWithFrame:CGRectMake(MARGIN_15,0,SCREEN_WIDTH - MARGIN_30, 0.5)];
                line.backgroundColor = COLOR_UI_dddddd;
                [button addSubview:line];
                button.frame = CGRectMake(0,btnHeight+MARGIN_40+MARGIN_10,SCREEN_WIDTH,45);
            }
            if (i != _options.count -1) {
                [button setIconInTopWithSpacing:MARGIN_15];
            }
            
            [self addSubview:button];

        }
}

- (void)actionClick:(UIButton *)sender
{
    _action(sender.tag - BTNTAG);
}

- (void) createOverlay
{
    self.clipsToBounds = TRUE;
    
    self.overlayView = [[UIControl alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    _overlayView.backgroundColor = [UIColor colorWithRed:.16 green:.17 blue:.21 alpha:.5];
    [_overlayView addTarget:self
                     action:@selector(dismiss)
           forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - animations

- (void)fadeIn
{
    __weak typeof(self) __weakSelf = self;
    [UIView animateWithDuration:0.05 animations:^{
        __weakSelf.alpha = 1;
        CATransition *animation = [CATransition animation];
        animation.duration = 0.2f;
        animation.timingFunction = UIViewAnimationCurveEaseInOut;
        animation.fillMode = kCAFillModeForwards;
        animation.type = kCATransitionMoveIn;
        animation.subtype = kCATransitionFromTop;
        [__weakSelf.layer addAnimation:animation forKey:@"animation"];
    } completion:^(BOOL finished) {
    }];
    
}

- (void)fadeOut
{
    __weak typeof(self) __weakSelf = self;
    [UIView animateWithDuration:0.05 animations:^{
        
        CATransition *animation = [CATransition animation];
        animation.duration = 0.2f;
        animation.timingFunction = UIViewAnimationCurveEaseInOut;
        animation.fillMode = kCAFillModeForwards;
        animation.type = kCATransitionPush;
        animation.subtype = kCATransitionFromBottom;
        [__weakSelf.layer addAnimation:animation forKey:@"animation"];
        
    } completion:^(BOOL finished) {
        if (finished) {
            __weakSelf.alpha = 0.0;
            __weakSelf.overlayView.alpha = 0.0;
            [__weakSelf.overlayView removeFromSuperview];
        }
    }];
    
}

- (void)show
{
    if (!_visiableViewCreated) {
        [self createVisiableViews];
    }
    
    UIWindow *keywindow = [[UIApplication sharedApplication] keyWindow];
    [keywindow addSubview:_overlayView];
    [keywindow addSubview:self];
    
    [self fadeIn];
    
}

- (void)dismiss
{
    [self fadeOut];
}

#define mark - UITouch
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self dismiss];
}



@end
