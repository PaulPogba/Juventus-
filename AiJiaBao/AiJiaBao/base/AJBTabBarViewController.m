//
//  AJBTabBarViewController.m
//  AiJiaBao
//
//  Created by 医麦思 on 2017/2/20.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "AJBTabBarViewController.h"
#import "AJBNavigationViewController.h"


#import "AJBHomeViewController.h"
#import "AJBFamilyViewController.h"
#import "AJBDisCoverViewController.h"
#import "AJBMineViewController.h"

@interface AJBTabBarViewController ()

@property (nonatomic, strong) UIImageView *lineImageView;

@end

@implementation AJBTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self clearTabBarTopLine];
    
    [self initViewController];
}


- (void) initViewController {
    AJBHomeViewController *home=[[AJBHomeViewController alloc]init];
    AJBNavigationViewController *navHome = [[AJBNavigationViewController alloc] initWithRootViewController:home];
    navHome.tabBarItem.image = [imageNamed(@"homeA") imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    navHome.tabBarItem.selectedImage = [imageNamed(@"homeL") imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    navHome.tabBarItem.title = @"保障";
    
    
    AJBFamilyViewController *family=[[AJBFamilyViewController alloc]init];
    AJBNavigationViewController *navFamily = [[AJBNavigationViewController alloc] initWithRootViewController:family];
    navFamily.tabBarItem.image = [imageNamed(@"reportA") imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    navFamily.tabBarItem.selectedImage = [imageNamed(@"reportL") imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    navFamily.tabBarItem.title = @"家庭";

    
    AJBDisCoverViewController *view=[[AJBDisCoverViewController alloc]init];
    AJBNavigationViewController *navView = [[AJBNavigationViewController alloc] initWithRootViewController:view];
    navView.tabBarItem.image = [imageNamed(@"baseAct") imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    navView.tabBarItem.selectedImage = [imageNamed(@"baseAct") imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    
    AJBDisCoverViewController *discover=[[AJBDisCoverViewController alloc]init];
    AJBNavigationViewController *navDiscover = [[AJBNavigationViewController alloc] initWithRootViewController:discover];
    navDiscover.tabBarItem.image = [imageNamed(@"messageA") imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    navDiscover.tabBarItem.selectedImage = [imageNamed(@"messageL") imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    navDiscover.tabBarItem.title = @"发现";
    
    
    AJBMineViewController *mine=[[AJBMineViewController alloc]init];
    AJBNavigationViewController *navMine = [[AJBNavigationViewController alloc] initWithRootViewController:mine];
    navMine.tabBarItem.image = [imageNamed(@"shopA") imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    navMine.tabBarItem.selectedImage = [imageNamed(@"shopL") imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    navMine.tabBarItem.title = @"我";
    
    self.viewControllers =  @[navHome,navFamily,navView,navDiscover,navMine];
    
    
    //未选中
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor lightGrayColor],NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
    
//    选中
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:COLOR_UI_54C1F5,NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
}

- (void) viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    //重新设置tabbar 的高度
    CGRect frame = self.tabBar.frame;
    frame.size.height = TABBAR_HEIGHT;
    frame.origin.y = self.view.frame.size.height - TABBAR_HEIGHT;
    self.tabBar.frame = frame;
    self.tabBar.barStyle = UIBarStyleDefault;
    [self.tabBar setBackgroundImage:imageNamed(@"bgbgbg")];
    //因为加高tabbar ,重新设置图片偏移
    for (int i = 0; i<self.tabBar.items.count; i++) {
        UITabBarItem *item = self.tabBar.items[i];
        if (i != 2) {
            item.imageInsets = UIEdgeInsetsMake(TABBAR_HEIGHT - 49 - 5, 0, -(TABBAR_HEIGHT - 49 - 5), 0);
        } else {
            item.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
        }
    }
}

- (void) clearTabBarTopLine
{
    CGRect rect = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    
    UIGraphicsBeginImageContext(rect.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [[UIColor clearColor] CGColor]);
    
    CGContextFillRect(context, rect);
    
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    [self.tabBar setBackgroundImage:img];
    [self.tabBar setShadowImage:img];
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
