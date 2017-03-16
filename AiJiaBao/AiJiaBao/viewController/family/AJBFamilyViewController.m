//
//  AJBFamilyViewController.m
//  AiJiaBao
//
//  Created by 医麦思 on 2017/2/22.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "AJBFamilyViewController.h"
#import "AJBFamilyTableHeadView.h"
#import "AJBFamilyTableViewCell.h"
#import "LXWaveProgressView.h"
#import "AJBFamilyTwoTableViewCell.h"
@interface AJBFamilyViewController ()

@property (nonatomic, strong) AJBFamilyTableHeadView *headView;

@end

@implementation AJBFamilyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(-STATEBAR_HEIGHT);
        make.height.mas_equalTo(SCREEN_HEIGHT + STATEBAR_HEIGHT + MARGIN_10);
    }];
    self.tableView.tableHeaderView = self.headView;
    self.tableView.allowsSelection = NO;
    self.headView.frame = CGRectMake(0, 0,SCREEN_WIDTH, 220);
    
    [self.view bringSubviewToFront:self.navigationView];
    [self setTitleText:@"家庭"];
    self.navigationView.leftItem.hidden = YES;
    
    [self setRightBarButtonItem1WithImage:@"icon_home_message"];
    self.navigationView.backgroundColor = [UIColor clearColor];
    
    
}

#pragma mark - getters and setters
- (AJBFamilyTableHeadView *)headView
{
    if (!_headView) {
        self.headView =[[AJBFamilyTableHeadView alloc] init];
    }
    return _headView;
}


#pragma mark ---  delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    if (indexPath.row%2==0) {//如果是偶数
        AJBFamilyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[AJBFamilyTableViewCell reuseIdentifierStr]];
        if(!cell) {
            cell = [[AJBFamilyTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[AJBFamilyTableViewCell reuseIdentifierStr]];
            
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell refreshWithIcon:@"icon_protect_bg"];
        cell.progressView.progress=MIN(0.8, (indexPath.row)*0.1);
        cell.progressView.waveHeight=(indexPath.row)*0.1;
        cell.progressView.speed=(indexPath.row)*0.1+0.5;
        return cell;
    }else{//如果是奇数
            AJBFamilyTwoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[AJBFamilyTableViewCell reuseIdentifierStr]];
            if(!cell) {
                cell = [[AJBFamilyTwoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[AJBFamilyTableViewCell reuseIdentifierStr]];
            }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell refreshWithIcon:@"icon_protect_bg"];
        cell.progressView.progress=MIN(0.8, (indexPath.row)*0.1);
        cell.progressView.waveHeight=(indexPath.row)*0.1;
        cell.progressView.speed=(indexPath.row)*0.1+0.5;
        return cell;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
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
