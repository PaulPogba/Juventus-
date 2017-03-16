//
//  AJBRegisterViewController.m
//  AiJiaBao
//
//  Created by 医麦思 on 2017/2/22.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "AJBRegisterViewController.h"
#import "AJBRegisterScrollView.h"

@interface AJBRegisterViewController ()

@property (nonatomic, strong) AJBRegisterScrollView *scrollView;

@end

@implementation AJBRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setTitleText:@"秒注册"];
    
    [self.view addSubview:self.scrollView];
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(NAVITETION_HEIGHT);
        make.left.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT - NAVITETION_HEIGHT));
    }];
}

- (AJBRegisterScrollView *)scrollView
{
    if (!_scrollView) {
        self.scrollView = [[AJBRegisterScrollView alloc] init];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
