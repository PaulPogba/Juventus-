//
//  AJBSettingViewController.m
//  AiJiaBao
//
//  Created by nuhgroup on 2017/3/10.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "AJBSettingViewController.h"
#import "AJBSettingCell.h"


@interface AJBSettingViewController ()

@property (nonatomic, strong) NSArray *titleArray;
@property (nonatomic, strong) NSArray *iconArray;

@end

@implementation AJBSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setTitleText:@"设置"];
    self.titleArray = @[@[@"实名认证",@"绑定手机",@"绑定邮箱"],@[@"登陆密码",@"资金密码"],@[@"关于我们"]];
    self.iconArray = @[@[@"homeA",@"homeA",@"homeA"],@[@"homeA",@"homeA"],@[@"homeA"]];

}


#pragma mark ---  delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *array = [_titleArray objectAtIndex:section];
    return array.count;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.titleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AJBSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:[AJBSettingCell reuseIdentifier]];
    if (!cell) {
        cell = [[AJBSettingCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[AJBSettingCell reuseIdentifier]];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    NSArray *array = [_titleArray objectAtIndex:indexPath.section];
    [cell refreshWithTitle:[array objectAtIndex:indexPath.row]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return MARGIN_15;
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
