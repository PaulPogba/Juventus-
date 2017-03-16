//
//  AJBIntegralViewController.m
//  AiJiaBao
//
//  Created by nuhgroup on 2017/3/8.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "AJBIntegralViewController.h"
#import "AJBIntegralHeadView.h"

@interface AJBIntegralViewController ()

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) AJBIntegralHeadView *headView;

@end

@implementation AJBIntegralViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setTitleText:@"积分"];
    
    [self.view addSubview:self.scrollView];
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(NAVITETION_HEIGHT);
        make.width.mas_equalTo(SCREEN_WIDTH);
        make.height.mas_equalTo(SCREEN_HEIGHT);
    }];
    
    [self.scrollView addSubview:self.headView];
    [self.headView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.width.mas_equalTo(SCREEN_WIDTH);
        make.height.mas_equalTo(150);
    }];
    
    [_headView refreshWithIntegral:@"1232"];
}


#pragma mark - getters and setters 
- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        self.scrollView = [[UIScrollView alloc] init];
        _scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT);
    }
    return _scrollView;
}

- (AJBIntegralHeadView *)headView
{
    if (!_headView) {
        self.headView = [[AJBIntegralHeadView alloc] init];
    }
    return _headView;
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
