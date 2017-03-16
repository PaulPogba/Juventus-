//
//  AJBBirthdayView.h
//  AiJiaBao
//
//  Created by nuhgroup on 2017/3/6.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//
/*
    生日页面
 */
#import <UIKit/UIKit.h>
#import "AJBAddView.h"

@protocol AJBBirthdayViewDelegate <NSObject>

- (void) showPickerView;

@end

@interface AJBBirthdayView : AJBAddView
@property (nonatomic, strong) UIButton *button;
@property (nonatomic, assign) id<AJBBirthdayViewDelegate> delegate;

@end
