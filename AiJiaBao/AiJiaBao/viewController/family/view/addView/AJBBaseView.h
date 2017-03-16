//
//  AJBBaseView.h
//  AiJiaBao
//
//  Created by nuhgroup on 2017/3/7.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

/*
    身份信息上半部
 */
#import <UIKit/UIKit.h>
#import "AJBEnterView.h"
#import "AJBBirthdayPickerView.h"
#import "AJBBirthdayView.h"
@protocol AJBBaseViewDelegate <NSObject>
- (void)showPickerView;
@end

@interface AJBBaseView : UIView

@property (nonatomic, assign) id<AJBBaseViewDelegate> delegate;
@property (nonatomic, strong) AJBEnterView *nickNameView;
@property (nonatomic, strong) AJBEnterView *userIDView;
@property (nonatomic, strong) AJBBirthdayView *birthdayView;
@end
