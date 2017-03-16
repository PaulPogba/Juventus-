//
//  AJBCouponViewController.m
//  AiJiaBao
//
//  Created by nuhgroup on 2017/3/1.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "AJBCouponViewController.h"
#import "AJBCouponCell.h"

@interface AJBCouponViewController ()<AJBCouponCellDelegate>

@end

@implementation AJBCouponViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self setTitleText:@"优惠券"];
    
    [self.tableView reloadData];
}

#pragma rest

#pragma mark ---  delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AJBCouponCell *cell = [tableView dequeueReusableCellWithIdentifier:[AJBCouponCell reuseIdentifier]];
    if (!cell) {
        cell = [[AJBCouponCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[AJBCouponCell reuseIdentifier]];
        cell.delegate = self;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = COLOR_UI_f1f1f1;
    }
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    RestCouponListResp *resp = (RestCouponListResp *) self.dataModal;
//    JSONCouponObj *obj = [resp.list objectAtIndex:indexPath.row];
//    
//    if (obj.isShowMore){
//        return [AJBCouponCell moreHeight:obj];
//    } else{
//        return [AJBCouponCell defaultHeight:obj];
//    }
    return 100;
}


#pragma mark - delegate
- (void)showCouponCellDelegate:(UITableViewCell *)cell
{
    NSIndexPath *reloadIndexPath = [self.tableView indexPathForCell:cell];
    [self.tableView reloadRowsAtIndexPaths:@[reloadIndexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
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
