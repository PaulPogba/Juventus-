//
//  AJBDisCoverViewController.m
//  AiJiaBao
//
//  Created by 医麦思 on 2017/2/22.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "AJBDisCoverViewController.h"
#import "AJBDiscoverTableViewCell.h"

#import "AJBProtectFeedsViewController.h"

#import "AJBAInsuranceViewController.h"

@interface AJBDisCoverViewController ()

@property (nonatomic, strong) NSArray *titleArray;
@property (nonatomic, strong) NSArray *imageArray;

@end

@implementation AJBDisCoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setRightBarButtonItem1WithImage:@"icon_home_message"];
    [self setTitleText:@"发现"];
    self.navigationView.leftItem.hidden = YES;
    [self.navigationView.layer insertSublayer:[AJBCommon gradientLayerWithHeight:NAVITETION_HEIGHT] atIndex:0];
    
    self.titleArray = @[@[@"保障圈",@"排行榜"],@[@"抢现金",@"赚积分",@"排行榜"],@[@"淘保险",@"缴社保"]];
    self.imageArray = @[@[@"homeA",@"homeA"],@[@"homeA",@"homeA",@"homeA"],@[@"homeA",@"homeA"]];
    
}

- (UITableViewStyle) tableViewStyle
{
    return UITableViewStyleGrouped;
}

#pragma mark ---  delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 2;
    } else if (section == 1) {
        return 3;
    }
    return 2;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AJBDiscoverTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[AJBDiscoverTableViewCell reuseIdentifier]];
    if (!cell) {
        cell = [[AJBDiscoverTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[AJBDiscoverTableViewCell reuseIdentifier]];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    NSArray *array =  [self.imageArray objectAtIndex:indexPath.section];
    BOOL hiddenLine = NO;
    if (indexPath.row == array.count -1 ) {
        hiddenLine = YES;
    }
    [cell refreshWithIcon:[[self.imageArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row] title:[[self.titleArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row] hiddenLine:hiddenLine];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            AJBProtectFeedsViewController *vc = [[AJBProtectFeedsViewController alloc] init];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
    } else if (indexPath.section == 2) {
        if (indexPath.row == 0) {
            AJBAInsuranceViewController *vc = [[AJBAInsuranceViewController alloc] init];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return MARGIN_20;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 1;
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
