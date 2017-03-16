//
//  AJBAInsuranceViewController.m
//  AiJiaBao
//
//  Created by nuhgroup on 2017/3/12.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "AJBAInsuranceViewController.h"
#import "AJBInsuranceHeadView.h"
#import "AJBInsuranceCell.h"


@interface AJBAInsuranceViewController ()

@property (nonatomic, strong) AJBInsuranceHeadView *headerView;



@end

@implementation AJBAInsuranceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitleText:@"淘宝险"];
    
    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(-STATEBAR_HEIGHT);
        make.height.mas_equalTo(SCREEN_HEIGHT + STATEBAR_HEIGHT);
    }];
    
    self.tableView.tableHeaderView = self.headerView;
    self.headerView.frame = CGRectMake(0, 0,SCREEN_WIDTH, 350);
    
    [_headerView setImagesWithArray:@[@"http://scimg.jb51.net/allimg/160822/103-160R21K405308.jpg",
                                      @"http://image56.360doc.com/DownloadImg/2012/11/2311/28422958_1.jpg",
                                      @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1489318604230&di=0d49e8a8cbe2661aed7596d45b97a289&imgtype=0&src=http%3A%2F%2Fa1.att.hudong.com%2F74%2F70%2F20300543008748142258701127927_s.jpg",
                                      @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1489318604229&di=64ab7cfbfb25f21b96bdea40cf6f4015&imgtype=0&src=http%3A%2F%2Fpic.58pic.com%2F58pic%2F12%2F06%2F64%2F43r58PIC9yb.jpg"]];
    
    [_headerView refreshTitle:@"热销保险"];
    
}


#pragma mark - getters and setters 
- (AJBInsuranceHeadView *)headerView
{
    if (!_headerView) {
        self.headerView = [[AJBInsuranceHeadView alloc] init];
    }
    return _headerView;
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
    AJBInsuranceCell *cell = [tableView dequeueReusableCellWithIdentifier:[AJBInsuranceCell reuseIdentifier]];
    if (!cell) {
        cell = [[AJBInsuranceCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[AJBInsuranceCell reuseIdentifier]];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}


#pragma mark - scrollView
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.y > 45)
    {
        self.navigationView.backgroundColor = [COLOR_UI_54C1F5 colorWithAlphaComponent:(scrollView.contentOffset.y - 45)/45];
    }else
    {
        self.navigationView.backgroundColor = [UIColor clearColor];
    }

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
