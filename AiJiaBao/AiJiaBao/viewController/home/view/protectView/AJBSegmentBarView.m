//
//  AJBProtectBarView.m
//  AiJiaBao
//
//  Created by nuhgroup on 2017/3/3.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "AJBSegmentBarView.h"

#define BUTTON_TAG 20


@interface AJBSegmentBarView ()

@property (nonatomic, assign) CGFloat count;
@property (nonatomic, assign) CGFloat currentIndex;
@property (nonatomic, strong) UIView *scrollLine;
@property (nonatomic, strong) UIView *bottomLine;
@end

@implementation AJBSegmentBarView

- (id) initWithCount:(CGFloat)count hiddenLine:(BOOL) hiddeLine
{
    if (self = [super init]) {
        
        self.count = count;
        
        __weak typeof(self) __weakSelf = self;
        
        for (int i = 0; i < count; i++) {
           
            UIButton *button = [[UIButton alloc] init];
            [button setTitleColor:COLOR_UI_333333 forState:UIControlStateNormal];
            [button setTitleColor:COLOR_UI_54C1F5 forState:UIControlStateSelected];
            [button addTarget:self action:@selector(onBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            button.titleLabel.font = FONT_OF_SIZE_13;
            button.tag = BUTTON_TAG + i;
            [self addSubview:button];
            
            [button mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(i * (SCREEN_WIDTH/count));
                make.top.mas_equalTo(0);
                make.height.equalTo(__weakSelf.mas_height);
                make.width.mas_equalTo(SCREEN_WIDTH/count);
            }];
        }
        
        
        if (!hiddeLine) {
            self.bottomLine = [[UIView alloc] init];
            _bottomLine.backgroundColor = COLOR_UI_f1f1f1;
            [self addSubview:_bottomLine];

            [self.bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
                make.bottom.equalTo(__weakSelf.mas_bottom);
                make.width.mas_equalTo(SCREEN_WIDTH);
                make.height.mas_equalTo(1);
                make.left.mas_equalTo(0);
            }];
            
            self.scrollLine = [[UIView alloc] init];
            _scrollLine.backgroundColor = COLOR_UI_54C1F5;
            [self addSubview:_scrollLine];
            [self.scrollLine mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(0);
                make.bottom.equalTo(__weakSelf.mas_bottom);
                make.width.mas_equalTo(SCREEN_WIDTH/count);
                make.height.mas_equalTo(2);
            }];
        }
        
        [self setSelectIndex:0];
    }
    
    return self;
}


- (void)refresh:(NSArray *) array
{
    for (int i = 0; i < _count; i++) {
        UIButton *button = [self viewWithTag:BUTTON_TAG + i];
        [button setTitle:[array objectAtIndex:i] forState:UIControlStateNormal];
    }
}


- (void)onBtnClick:(UIButton *) sender
{
    NSUInteger idx = sender.tag-BUTTON_TAG;
    _currentIndex = idx;
    
    [self setSelectIndex:idx];
    if ([self.delegate respondsToSelector:@selector(switchButtonWithIndex:)]) {
        [_delegate switchButtonWithIndex:idx];
    }
}

- (void) setSelectIndex:(NSInteger) index
{
    __weak typeof(self) __weakSelf = self;
    CGFloat left = (SCREEN_WIDTH/_count) *index;
    [UIView animateWithDuration:0.3 animations:^{
        __weakSelf.scrollLine.x = left;
    }];
    
    NSInteger forIndex = 0;
    for (UIButton *btn in self.subviews) {
        if ([btn isKindOfClass:[UIButton class]]) {
            if (forIndex == index) {
                btn.selected = YES;
            } else {
                btn.selected = NO;
            }
            forIndex ++;
        }
    }
}

@end
