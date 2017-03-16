//
//  AJBNavigationView.h
//  AiJiaBao
//
//  Created by 医麦思 on 2017/2/20.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AJBNavigationView : UIView


- (id)initWithLeftAction: (void (^)()) leftAction rightAction:(void(^)()) rightAction right1Action:(void(^)()) right1Action;

@property (copy, nonatomic) void (^onLeftAction)();
@property (copy, nonatomic) void (^onRightAction)();
@property (copy, nonatomic) void (^onRight1Action)();


@property (nonatomic, strong) UIButton *leftItem;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *rightItem;
@property (nonatomic, strong) UIButton *rightItem1;

- (void) onLeftItemAction:(UIButton *) sender;
- (void) onRightItemAction:(UIButton *) sender;
- (void) onRight1ItemAction:(UIButton *) sender;


@end
