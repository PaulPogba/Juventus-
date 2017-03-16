//
//  AJBMyCashViewController.m
//  AiJiaBao
//
//  Created by nuhgroup on 2017/3/1.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "AJBMyCashViewController.h"
#import "AJBMyCashHeadView.h"
#import "AJBMyCashCell.h"

@interface AJBMyCashViewController ()

@property (nonatomic, strong) AJBMyCashHeadView *headView;
@property (nonatomic, strong) NSArray *titleArray;

@end

@implementation AJBMyCashViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.titleArray = @[@"银行卡管理",@"资金明细"];
    self.tableView.tableHeaderView = self.headView;
    self.headView.frame = CGRectMake(0,-STATEBAR_HEIGHT,SCREEN_WIDTH,230);
    [_headView refreshCash:@"122323元"];
    [self setTitleText:@"现金"];
}


#pragma mark ---  delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AJBMyCashCell *cell = [tableView dequeueReusableCellWithIdentifier:[AJBMyCashCell reuseIdentifier]];
    if (!cell) {
        cell = [[AJBMyCashCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[AJBMyCashCell reuseIdentifier]];
    }
    BOOL hiddenLine = NO;
    if (indexPath.row == 1) {
        hiddenLine = YES;
    }
    [cell refreshWithIcon:@"homeA" title:[self.titleArray objectAtIndex:indexPath.row] hiddenLine:hiddenLine];
    return cell ;
}



#pragma getters and setters
- (AJBMyCashHeadView *)headView
{
    if (!_headView) {
        self.headView = [[AJBMyCashHeadView alloc] init];
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
