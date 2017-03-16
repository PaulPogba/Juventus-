//
//  AJBBaseTableViewController.h
//  AiJiaBao
//
//  Created by 医麦思 on 2017/2/23.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "AJBBaseViewController.h"
#import "AJBTablePlaceholderView.h"

@interface AJBBaseTableViewController : AJBBaseViewController <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) AJBTablePlaceholderView *placeholderView;

@property (nonatomic, strong) UITableView *tableView;

- (void)refreshWithImage:(NSString *)image title:(NSString *)title detail:(NSString *)detail;

- (UITableViewStyle) tableViewStyle;

@end
