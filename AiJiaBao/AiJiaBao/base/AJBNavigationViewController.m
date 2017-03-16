//
//  AJBNavigationViewController.m
//  AiJiaBao
//
//  Created by 医麦思 on 2017/2/22.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "AJBNavigationViewController.h"

@interface AJBNavigationViewController ()

@end

@implementation AJBNavigationViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self.navigationBar setBarTintColor:COLOR_UI_54C1F5];
    self.navigationBar.shadowImage = [UIImage imageNamed:@""];
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

    
    
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
