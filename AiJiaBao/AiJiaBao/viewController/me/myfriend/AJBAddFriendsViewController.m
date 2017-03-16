//
//  AJBAddFriendsViewController.m
//  AiJiaBao
//
//  Created by nuhgroup on 2017/3/7.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "AJBAddFriendsViewController.h"
#import "AJBSearchFriendView.h"


#define SEARCHBACKVIEW_HEIGHT 40

@interface AJBAddFriendsViewController ()<UISearchBarDelegate,AJBSearchFriendViewDelegate>

@property (nonatomic, strong) NSArray *titleArray;
@property (nonatomic, strong) NSArray *detailArray;

@property (nonatomic, strong) UIView *searchBackView;
@property (nonatomic, strong) UISearchBar *searchBar;
@property (nonatomic, strong) UIView *searchLine;


@property (nonatomic, strong) AJBSearchFriendView *searchView;

@end

@implementation AJBAddFriendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    __weak typeof(self) __weakSelf = self;
    
    [self setTitleText:@"添加好友"];
    self.titleArray = @[@[@"我的二维码"],@[@"扫一扫",@"手机联系人"],@[@"微信好友",@"QQ好友"]];
    self.detailArray = @[@[@""],@[@"扫描二维码名片添加好友",@"添加或邀请手机通讯录的好友"],@[@"邀请微信通讯录中的好友",@"邀请QQ联系人中的好友"]];
    
    [self.view addSubview:self.searchBackView];
    [self.searchBackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(NAVITETION_HEIGHT);
        make.left.mas_equalTo(0);
        make.height.mas_equalTo(SEARCHBACKVIEW_HEIGHT);
        make.width.mas_equalTo(SCREEN_WIDTH);
    }];
    
    [self.searchBackView addSubview:self.searchBar];
    [self.searchBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(MARGIN_5);
        make.left.mas_equalTo(0);
        make.height.mas_equalTo(MARGIN_30);
        make.width.mas_equalTo(SCREEN_WIDTH);
    }];
    [self.searchBackView addSubview:self.searchLine];
    [self.searchLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(__weakSelf.searchBackView.mas_bottom);
        make.left.mas_equalTo(0);
        make.width.mas_equalTo(SCREEN_WIDTH);
        make.height.mas_equalTo(1);
    }];
    
    [self.view addSubview:self.searchView];
    [self.searchView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(NAVITETION_HEIGHT);
        make.width.mas_equalTo(SCREEN_WIDTH);
        make.height.mas_equalTo(SCREEN_HEIGHT);
    }];
    

    
    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(40+NAVITETION_HEIGHT);
    }];
    
    [self showSearchView:YES];
}


#pragma mark - getters and setters
- (UISearchBar *)searchBar
{
    if (!_searchBar) {
        self.searchBar = [[UISearchBar alloc] init];
        _searchBar.placeholder = @"请输入手机号";
        _searchBar.clipsToBounds = YES;
        _searchBar.delegate = self;
        _searchBar.tintColor= COLOR_UI_54C1F5;
        [_searchBar setBackgroundImage:imageNamed(@"searchBackColor")];
    }
    return _searchBar;
}

- (UIView *)searchBackView
{
    if (!_searchBackView) {
        self.searchBackView = [[UIView alloc] init];
        _searchBackView.backgroundColor = COLOR_UI_f1f1f1;
        
    }
    return _searchBackView;
}

- (UIView *)searchView
{
    if (!_searchView) {
        self.searchView = [[AJBSearchFriendView alloc] init];
        _searchView.delegate = self;
    }
    return _searchView;;
}

- (UIView *)searchLine
{
    if (!_searchLine) {
        self.searchLine = [[UIView alloc] init];
        _searchLine.backgroundColor = COLOR_UI_dddddd;
    }
    return _searchLine;
}

#pragma mark ---  tableViewStyle

- (UITableViewStyle)tableViewStyle
{
    return UITableViewStyleGrouped;
}

#pragma mark ---  delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *array = [_titleArray objectAtIndex:section];
    return array.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _titleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *textArray = [_titleArray objectAtIndex:indexPath.section];
    NSArray *detarray = [_detailArray objectAtIndex:indexPath.section];

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tableViewCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"tableViewCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.textLabel.font = FONT_OF_SIZE_15;
        cell.textLabel.textColor = COLOR_UI_333333;
    
        cell.detailTextLabel.font = FONT_OF_SIZE_12;
        cell.detailTextLabel.textColor = COLOR_UI_cacaca;
        
        UILabel *line = [[UILabel alloc] init];
        line.backgroundColor = COLOR_UI_f1f1f1;
        [cell addSubview:line];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(cell.mas_bottom);
            make.left.mas_equalTo(MARGIN_15);
            make.width.mas_equalTo(SCREEN_WIDTH - MARGIN_15);
            make.height.mas_equalTo(1);
        }];
        
        if (indexPath.row == textArray.count - 1) {
            line.hidden = YES;
        } else {
            line.hidden = NO;
        }
        
    }
    
    cell.imageView.image = imageNamed(@"homeA");
    cell.textLabel.text = [textArray objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = [detarray objectAtIndex:indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return MARGIN_15;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.01;
}


- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] init];

    if (section == 2) {
        UIView *topLine = [[UIView alloc] init];
        topLine.backgroundColor = COLOR_UI_dddddd;
        [view addSubview:topLine];
        [topLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.left.mas_equalTo(0);
            make.width.mas_equalTo(SCREEN_WIDTH);
            make.height.mas_equalTo(1);
        }];
    } else
    {
        UIView *topLine = [[UIView alloc] init];
        topLine.backgroundColor = COLOR_UI_dddddd;
        [view addSubview:topLine];
        [topLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.left.mas_equalTo(0);
            make.width.mas_equalTo(SCREEN_WIDTH);
            make.height.mas_equalTo(1);
        }];
        
        UIView *bottomLine = [[UIView alloc] init];
        bottomLine.backgroundColor = COLOR_UI_dddddd;
        [view addSubview:bottomLine];
        [bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(14);
            make.left.mas_equalTo(0);
            make.width.mas_equalTo(SCREEN_WIDTH);
            make.height.mas_equalTo(1);
        }];
    }
    
    return view;
}

#pragma mark - searchBar delegate
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
        searchBar.showsCancelButton = YES;
        for(UIView *view in  [[[searchBar subviews] objectAtIndex:0] subviews]) {
            if([view isKindOfClass:[NSClassFromString(@"UINavigationButton") class]]) {
                UIButton * cancel =(UIButton *)view;
                [cancel setTitle:@"取消" forState:UIControlStateNormal];
                cancel.titleLabel.font = [UIFont systemFontOfSize:14];
            }
        }
}

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar {
    
    [self showSearchView:NO];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    _searchBar.showsCancelButton = YES;
    _searchBackView.backgroundColor = COLOR_UI_efeff4;
    [_searchBar setBackgroundImage:imageNamed(@"searchBackColor1")];
    __weak typeof(self) __weakSelf = self;
    [UIView animateWithDuration:0.3 animations:^{
        [__weakSelf.searchBackView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.height.mas_equalTo(NAVITETION_HEIGHT);
        }];
        
        [__weakSelf.searchBar mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(MARGIN_30);
        }];
     
    }];
    
    return YES;
}


- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    [_searchView refresh:searchBar.text];
}


- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    [self showSearchView:YES];
    [_searchBar resignFirstResponder];
    _searchBar.showsCancelButton = NO;
    _searchBar.text = @"";
    _searchBackView.backgroundColor = COLOR_UI_f1f1f1;
    [_searchBar setBackgroundImage:imageNamed(@"searchBackColor")];
    
    __weak typeof(self) __weakSelf = self;
    [UIView animateWithDuration:0.3 animations:^{
        [__weakSelf.searchBackView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(NAVITETION_HEIGHT);
            make.height.mas_equalTo(SEARCHBACKVIEW_HEIGHT);
        }];
        
        [__weakSelf.searchBar mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(MARGIN_5);
        }];
    }];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [self search];
}

#pragma mark - searchFriendView delegate
- (void)onSearchAction
{
     [self search];
}

#pragma mark - action
-(void) showSearchView:(BOOL) hidden
{
    _searchView.hidden = hidden;
}

- (void) search {
     NSLog(@"搜索");
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
