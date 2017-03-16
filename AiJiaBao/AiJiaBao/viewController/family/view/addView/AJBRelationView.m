//
//  AJBRelationView.m
//  AiJiaBao
//
//  Created by nuhgroup on 2017/3/6.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "AJBRelationView.h"

@interface AJBRelationView ()

@property (nonatomic, strong) UIButton *button;

@end

@implementation AJBRelationView

- (instancetype)init
{
    if (self = [super init]) {
        
        __weak typeof(self) __weakSelf = self;
        
        [self addSubview:self.button];
        [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(__weakSelf.line).offset(MARGIN_15);
            make.top.mas_equalTo(MARGIN_10);
            make.width.mas_equalTo(150);
            make.height.mas_equalTo(20);
        }];
    }
    return self;
}

#pragma mark - getters and setters
- (UIButton *) button
{
    if (!_button) {
        self.button = [[UIButton alloc] init];
        [self.button setTitleColor:COLOR_UI_888888 forState:UIControlStateNormal];
        self.button.titleLabel.font = FONT_OF_SIZE_14;
        [_button addTarget:self action:@selector(onRelationAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}

- (void) onRelationAction:(UIButton *)sender
{
//    if ([self.delegate respondsToSelector:@selector(showRelationView)]) {
//        [self.delegate showRelationView];
//    }
    
    //debug
    [self  showRelationView];
}


//debug

- (void)showRelationView
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *cannel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *husband = [UIAlertAction actionWithTitle:@"夫妻" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self.button setTitle:@"夫妻" forState:UIControlStateNormal];
    }];
    UIAlertAction *sun = [UIAlertAction actionWithTitle:@"父子" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self.button setTitle:@"父子" forState:UIControlStateNormal];
    }];
    UIAlertAction *daugter = [UIAlertAction actionWithTitle:@"父女" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self.button setTitle:@"父女" forState:UIControlStateNormal];
    }];
    
    UIAlertAction *msun = [UIAlertAction actionWithTitle:@"母女" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self.button setTitle:@"母女" forState:UIControlStateNormal];
    }];
    
    UIAlertAction *mdaugter = [UIAlertAction actionWithTitle:@"母女" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self.button setTitle:@"母女" forState:UIControlStateNormal];
    }];
    
    [alert addAction:husband];
    [alert addAction:sun];
    [alert addAction:daugter];
    [alert addAction:msun];
    [alert addAction:mdaugter];
    [alert addAction:cannel];
    [self.navigationController presentViewController:alert animated:YES completion:nil];
}


@end
