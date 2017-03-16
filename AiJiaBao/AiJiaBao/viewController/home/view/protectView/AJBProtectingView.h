//
//  AJBProtectingView.h
//  AiJiaBao
//
//  Created by nuhgroup on 2017/3/3.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AJBTablePlaceholderView.h"

@interface AJBProtectingView : UIView<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) AJBTablePlaceholderView *placeholderView;
@end
