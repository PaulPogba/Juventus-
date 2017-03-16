//
//  AJBHomeViewController.m
//  AiJiaBao
//
//  Created by 医麦思 on 2017/2/20.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "AJBHomeViewController.h"
#import "AJBHomeTableHeadView.h"

@interface AJBHomeViewController ()

@property (nonatomic, strong) AJBHomeTableHeadView *headView;

@end

@implementation AJBHomeViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(-STATEBAR_HEIGHT);
        make.height.mas_equalTo(SCREEN_HEIGHT - 49 + STATEBAR_HEIGHT);
    }];
    self.tableView.tableHeaderView = self.headView;
    self.headView.frame = CGRectMake(0, 0,SCREEN_WIDTH, SCREEN_HEIGHT/2);
    
    self.navigationView.backgroundColor = [UIColor clearColor];
    [self.view bringSubviewToFront:self.navigationView];
    [self setLeftBarButtonItemWithImage:@"icon_home_logo"];
    [self setRightBarButtonItem1WithImage:@"icon_home_message"];
    [self setTitleText:@"爱家保"];
}

#pragma mark - getters and setters
- (AJBHomeTableHeadView *)headView
{
    if (!_headView) {
        self.headView = [[AJBHomeTableHeadView alloc] init];
    }
    return _headView;
}

- (void)onRightItemAction:(UIButton *)sender
{
    
}

@end
