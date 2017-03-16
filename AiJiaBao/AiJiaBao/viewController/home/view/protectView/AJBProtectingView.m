//
//  AJBProtectingView.m
//  AiJiaBao
//
//  Created by nuhgroup on 2017/3/3.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "AJBProtectingView.h"
#import "AJBProtectCell.h"


@implementation AJBProtectingView

- (instancetype)init
{
    if (self = [super init]) {
        
        __weak typeof(self) __weakSelf = self;
        
        [self addSubview:self.tableView];
        [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.left.mas_equalTo(0);
            make.height.equalTo(__weakSelf.mas_height);
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
    return self;
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
    return 5;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AJBProtectCell *cell = [tableView dequeueReusableCellWithIdentifier:[AJBProtectCell reuseIdentifier]];
    if (!cell) {
        cell = [[AJBProtectCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[AJBProtectCell reuseIdentifier]];
    }
    cell.backgroundColor = COLOR_UI_RANDOM;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

@end
