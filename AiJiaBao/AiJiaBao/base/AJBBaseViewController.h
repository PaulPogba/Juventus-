//
//  AJBBaseViewController.h
//  AiJiaBao
//
//  Created by 医麦思 on 2017/2/20.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AJBNavigationView.h"

@interface AJBBaseViewController : UIViewController

@property (nonatomic, strong) AJBNavigationView *navigationView;

- (void) onLeftItemAction:(UIButton *) sender;

- (void) onRightItemAction:(UIButton *) sender;

- (void) onRight1ItemAction:(UIButton *) sender;


- (void) setRightBarButtonItem1WithTitle:(NSString *)title;

- (void) setRightBarButtonItem2WithTitle:(NSString *)title;

- (void) setRightBarButtonItem1WithImage:(NSString *)image;

- (void) setRightBarButtonItem2WithImage:(NSString *)image;

- (void) setLeftBarButtonItemWithTitle:(NSString *)title;

- (void) setLeftBarButtonItemWithImage:(NSString *)image;

- (void) setTitleText:(NSString *)title;

@end
