//
//  AJBBaseViewController.m
//  AiJiaBao
//
//  Created by 医麦思 on 2017/2/20.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "AJBBaseViewController.h"

@interface AJBBaseViewController ()

@end

@implementation AJBBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationView.frame = CGRectMake(0,0, SCREEN_WIDTH, NAVITETION_HEIGHT);
    [self.view addSubview:self.navigationView];
}

#pragma mark - getters and setters
- (AJBNavigationView *)navigationView
{
    if (!_navigationView) {
        __weak typeof(self) __weakSelf = self;
        self.navigationView = [[AJBNavigationView alloc] initWithLeftAction:^{
            [__weakSelf onLeftItemAction:nil];
        } rightAction:^{
            [__weakSelf onRightItemAction:nil];
        } right1Action:^{
            [__weakSelf onRight1ItemAction:nil];
        }];
    }
    return _navigationView;
}


#pragma mark - action
- (void) onLeftItemAction:(UIButton *) sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void) onRightItemAction:(UIButton *) sender
{
    
}

- (void) onRight1ItemAction:(UIButton *) sender
{
    
}

- (void) setRightBarButtonItem1WithTitle:(NSString *)title
{
    [self.navigationView.rightItem setTitle:title forState:UIControlStateNormal];

}

- (void) setRightBarButtonItem2WithTitle:(NSString *)title
{
    [self.navigationView.rightItem1 setTitle:title forState:UIControlStateNormal];

}

- (void) setRightBarButtonItem1WithImage:(NSString *)image
{
    [self.navigationView.rightItem setImage:imageNamed(image) forState:UIControlStateNormal];
}

- (void) setRightBarButtonItem2WithImage:(NSString *)image
{
    [self.navigationView.rightItem1 setImage:imageNamed(image) forState:UIControlStateNormal];

}

- (void) setLeftBarButtonItemWithTitle:(NSString *)title
{
    [self.navigationView.leftItem setTitle:title forState:UIControlStateNormal];
}

- (void) setLeftBarButtonItemWithImage:(NSString *)image
{
    [self.navigationView.leftItem setImage:imageNamed(image) forState:UIControlStateNormal];
}

- (void) setTitleText:(NSString *)title
{
    self.navigationView.titleLabel.text = title;
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
