//
//  AJBGenderView.m
//  AiJiaBao
//
//  Created by nuhgroup on 2017/3/6.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "AJBGenderView.h"

@interface AJBGenderView ()
@property (nonatomic, strong) UIButton *button;

@end

@implementation AJBGenderView

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
        [_button addTarget:self action:@selector(onShowChooseGenderView:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}


#pragma mark - action
- (void) onShowChooseGenderView:(UIButton *) sender
{
    [self showChooseGenderView];
}

#pragma mark - delegate
- (void)showChooseGenderView
{
    //    __weak typeof(self) __weakSelf = self;
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *cannel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *photo = [UIAlertAction actionWithTitle:@"女" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self.button setTitle:@"女" forState:UIControlStateNormal];
    }];
    
    UIAlertAction *camera = [UIAlertAction actionWithTitle:@"男" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self.button setTitle:@"男" forState:UIControlStateNormal];
    }];
    [alert addAction:photo];
    [alert addAction:camera];
    [alert addAction:cannel];
    [self.navigationController presentViewController:alert animated:YES completion:nil];
}

@end
