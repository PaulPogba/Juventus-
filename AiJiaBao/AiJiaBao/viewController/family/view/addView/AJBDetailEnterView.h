//
//  AJBDetailEnterView.h
//  AiJiaBao
//
//  Created by nuhgroup on 2017/3/7.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//
/*
    手机邮箱户口本
 */
#import "AJBAddView.h"

@protocol AJBDetailEnterViewDelegate <NSObject>

- (void) textFieldBeginEdit;

@end

@interface AJBDetailEnterView : AJBAddView

@property (nonatomic, assign) id<AJBDetailEnterViewDelegate>delegate;

@property (nonatomic, strong) UITextField *textfield;

- (void) refreshWithTitle:(NSString *)title placeholder:(NSString *)placeholder;


@end
