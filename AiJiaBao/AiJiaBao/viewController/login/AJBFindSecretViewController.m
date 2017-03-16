//
//  AJBFindSecretViewController.m
//  AiJiaBao
//
//  Created by 医麦思 on 2017/2/22.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "AJBFindSecretViewController.h"
#import "AJBFindSecretScrollView.h"

@interface AJBFindSecretViewController ()

@property (nonatomic, strong) AJBFindSecretScrollView *scrollView;

@end

@implementation AJBFindSecretViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self setTitleText:@"找回密码"];
    [self.view addSubview:self.scrollView];
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(NAVITETION_HEIGHT);
        make.left.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT - NAVITETION_HEIGHT));
    }];
}

- (AJBFindSecretScrollView *)scrollView
{
    if (!_scrollView) {
        self.scrollView = [[AJBFindSecretScrollView alloc] init];
        _scrollView.contentSize = CGSizeMake(SCREEN_WIDTH*3,SCREEN_HEIGHT - NAVITETION_HEIGHT);
        _scrollView.bounces = YES;
        _scrollView.scrollEnabled = NO;
    }
    return _scrollView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
