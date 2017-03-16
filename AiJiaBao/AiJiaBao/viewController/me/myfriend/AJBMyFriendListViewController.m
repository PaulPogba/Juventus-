//
//  AJBMyFriendListViewController.m
//  AiJiaBao
//
//  Created by nuhgroup on 2017/3/6.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "AJBMyFriendListViewController.h"
#import "AJBFriendsCell.h"
#import "NSString+PinYin.h"
#import "AJBAddFriendsViewController.h"

@interface AJBMyFriendListViewController ()

@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation AJBMyFriendListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataArray = [[NSMutableArray alloc] init];
    
    [self setTitleText:@"我的好友"];
    [self setRightBarButtonItem1WithImage:@"homeA"];
    [self setRightBarButtonItem2WithImage:@"homeA"];
    
    self.tableView.sectionIndexColor = COLOR_UI_888888;
    self.tableView.sectionIndexBackgroundColor = [UIColor clearColor];
    self.tableView.backgroundColor = [UIColor whiteColor];
    
    [self initDataSource];
}

- (UITableViewStyle)tableViewStyle
{
    return UITableViewStyleGrouped;
}

- (void)initDataSource
{
    NSArray *array = @[@"登记", @"大奔", @"周傅", @"爱德华",@"((((", @"啦文琪羊", @"   s文强", @"过段时间", @"等等", @"各个", @"宵夜**", @"***", @"贝尔",@"*而结婚*", @"返回***", @"你还", @"与非门*", @"是的", @"*模块*", @"*没做*",@"俄文", @"   *#咳嗽", @"6",@"fh",@"C罗",@"邓肯"];
    NSArray  *indexArray= [array arrayWithPinYinFirstLetterFormat];
    self.dataArray =[NSMutableArray arrayWithArray:indexArray];
    
    [self.tableView reloadData];
}

#pragma mark ---  delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.dataArray count] + 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    } else {
        NSDictionary *dict = self.dataArray[section-1];
        NSMutableArray *array = dict[@"content"];
        return [array count];
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AJBFriendsCell *cell = [tableView dequeueReusableCellWithIdentifier:[AJBFriendsCell reuseIdentifier]];
    if (!cell) {
        cell = [[AJBFriendsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[AJBFriendsCell reuseIdentifier]];
    }
    if (indexPath.section == 0) {
        [cell refreshTitle:@"新的好友"];
    } else {
        NSDictionary *dict = self.dataArray[indexPath.section-1];
        NSMutableArray *array = dict[@"content"];
        [cell refreshTitle:array[indexPath.row]];
    }
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] init];

    if (section == 0) {
        return view;
    } else {
        view.backgroundColor = COLOR_UI_f1f1f1;
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(MARGIN_15, 0,SCREEN_WIDTH-MARGIN_15, MARGIN_20)];
        label.textColor = COLOR_UI_333333;
        label.font = FONT_OF_SIZE_12;
        label.text= self.dataArray[section-1][@"firstLetter"];
        
        [view addSubview:label];
        return view;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0.001;
    }
    return MARGIN_20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return .1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

#pragma mark---tableView索引相关设置----
//添加TableView头视图标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return @"";
    } else {
        NSDictionary *dict = self.dataArray[section-1];
        NSString *title = dict[@"firstLetter"];
        return title;
    }
}

//添加索引栏标题数组
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    NSMutableArray *resultArray =[NSMutableArray arrayWithObject:UITableViewIndexSearch];
    for (NSDictionary *dict in self.dataArray) {
        NSString *title = dict[@"firstLetter"];
        [resultArray addObject:title];
    }
    return resultArray;
}


//点击索引栏标题时执行
- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    //这里是为了指定索引index对应的是哪个section的，默认的话直接返回index就好。其他需要定制的就针对性处理
    if ([title isEqualToString:UITableViewIndexSearch])
    {
        [tableView setContentOffset:CGPointZero animated:NO];//tabview移至顶部
        return NSNotFound;
    }
    else
    {
        return [[UILocalizedIndexedCollation currentCollation] sectionForSectionIndexTitleAtIndex:index] - 1; // -1 添加了搜索标识
    }
}


#pragma mark - action
- (void)onRightItemAction:(UIButton *)sender
{
    AJBAddFriendsViewController *vc = [[AJBAddFriendsViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
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
