//
//  AJBProtectFeedsViewController.m
//  AiJiaBao
//
//  Created by 医麦思 on 2017/2/27.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "AJBProtectFeedsViewController.h"
#import "AJBProtectFeedsHeadView.h"

@interface AJBProtectFeedsViewController ()

@property (nonatomic, strong) AJBProtectFeedsHeadView *headView;

@end

@implementation AJBProtectFeedsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(-STATEBAR_HEIGHT);
        make.height.mas_equalTo(SCREEN_HEIGHT + STATEBAR_HEIGHT);
    }];
    self.tableView.tableHeaderView = self.headView;
    self.headView.frame = CGRectMake(0, 0,SCREEN_WIDTH, 250);
    
    self.navigationView.backgroundColor = [UIColor clearColor];
    [self.view bringSubviewToFront:self.navigationView];
    [self setRightBarButtonItem1WithImage:@"icon_home_message"];
    [self setTitleText:@"保障圈"];
}


#pragma mark - getters and setters
- (AJBProtectFeedsHeadView *)headView
{
    if (!_headView) {
        self.headView = [[AJBProtectFeedsHeadView alloc] init];
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
