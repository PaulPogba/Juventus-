//
//  AJBMineViewController.m
//  AiJiaBao
//
//  Created by 医麦思 on 2017/2/22.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "AJBMineViewController.h"
#import "AJBMeHeadView.h"
#import "AJBDiscoverTableViewCell.h"

#import "AJBCollectViewController.h"

#import "AJBMyFriendListViewController.h"
#import "AJBInviteViewController.h"

#import "AJBToolViewController.h"
#import "AJBSettingViewController.h"

@interface AJBMineViewController ()

@property (nonatomic, strong) AJBMeHeadView *headView;
@property (nonatomic, strong) NSArray *titleArray;
@property (nonatomic, strong) NSArray *imageArray;

@end

@implementation AJBMineViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self postSERVACCOUNTINFO];
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.height.mas_equalTo(SCREEN_HEIGHT - 50);
    }];
    self.tableView.tableHeaderView = self.headView;
    self.headView.frame = CGRectMake(0, 0,SCREEN_WIDTH, 290);
    self.tableView.sectionHeaderHeight = MARGIN_20;
    
    [self setRightBarButtonItem1WithImage:@"icon_home_message"];
    self.navigationView.backgroundColor = [UIColor clearColor];
    
    self.titleArray = @[@[@"会员中心",@"我的收藏"],@[@"我的好友",@"邀请有礼"],@[@"常用工具",@"设置"],@[@"帮助与反馈"]];
    self.imageArray = @[@[@"icon_me_member",@"icon_me_collection"],@[@"icon_me_friends",@"icon_me_invite"],@[@"icon_me_tool",@"icon_me_setting"],@[@"icon_me_help"]];
    [_headView refreshWithUserAccount:nil];
}


#pragma mark - getters and setters

- (AJBMeHeadView *) headView
{
    if (!_headView) {
        self.headView = [[AJBMeHeadView alloc] init];
    }
    return _headView;
}


- (UITableViewStyle) tableViewStyle
{
    return UITableViewStyleGrouped;
}

#pragma mark ---  delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 3) {
        return 1;
    }
    return 2;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.titleArray.count;
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


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45;
}


-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 1;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        if (indexPath.row == 1) {
            AJBCollectViewController *vc = [[AJBCollectViewController alloc] init];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
    } else if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            AJBMyFriendListViewController *vc = [[AJBMyFriendListViewController alloc] init];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        } else
        {
            AJBInviteViewController *vc =[[AJBInviteViewController alloc] init];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
        
    } else if (indexPath.section == 2) {
        if (indexPath.row == 0) {
            AJBToolViewController *vc =[[AJBToolViewController alloc] init];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        } else {
            AJBSettingViewController *vc = [[AJBSettingViewController alloc] init];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
    } else if (indexPath.section == 3) {
        
    }
}

#pragma mark - POST
- (void)  postSERVACCOUNTINFO
{// POST 获取用户 Account 信息
    __weak typeof(self) __weakSelf = self;
    [DataService postWithinterfaceType:SERV_ACCOUNT_INFO param:nil responseBlock:^(id responseObject) {
        
        RestUserAccountResp *resp = [RestUserAccountResp mj_objectWithKeyValues:responseObject];
        JSONUserAccountObj *obj = [JSONUserAccountObj mj_objectWithKeyValues:[resp.result objectAtIndex:0]];
        [__weakSelf.headView refreshWithUserAccount:obj];
        
    } loadTokenRespnseBlock:^(BOOL success) {
        if (success) {
            [__weakSelf postSERVACCOUNTINFO];
        }
    } hud:nil];
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
