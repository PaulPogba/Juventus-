//
//  AJBBaseTableViewController.m
//  AiJiaBao
//
//  Created by 医麦思 on 2017/2/23.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "AJBBaseTableViewController.h"

@interface AJBBaseTableViewController ()

@end

@implementation AJBBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    __weak typeof(self) __weakSelf = self;
    
     [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(NAVITETION_HEIGHT);
        make.left.mas_equalTo(0);
        make.height.mas_equalTo(SCREEN_HEIGHT - NAVITETION_HEIGHT);
        make.width.mas_equalTo(SCREEN_WIDTH);
    }];
    
    
    [self.tableView addSubview:self.placeholderView];
    self.placeholderView.hidden = YES;
    [self.placeholderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(__weakSelf.tableView.mas_centerX);
        make.centerY.equalTo(__weakSelf.tableView.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(150, 150));
    }];
}


#pragma mark - getters and setters
-(UITableView *)tableView
{
    if (!_tableView) {
        self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:[self tableViewStyle]];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = COLOR_UI_f1f1f1;
    }
    return _tableView;
}

- (AJBTablePlaceholderView *)placeholderView
{
    if (!_placeholderView) {
        self.placeholderView = [[AJBTablePlaceholderView alloc] init];
    }
    return _placeholderView;
}


- (void)refreshWithImage:(NSString *)image title:(NSString *)title detail:(NSString *)detail
{
    [_placeholderView refreshWithImage:image title:title detail:detail];
}

- (UITableViewStyle) tableViewStyle {
    return UITableViewStylePlain;
}

#pragma mark ---  delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
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
